> **Status: Questões `Product-choice` resolvidas em revisão prévia com o PO. Questões `Implementation-choice` (Q3–Q5) permanecem abertas para o planner. Spec segue para aprovação final do PO.**

# Modo de Interação do Copilot no Payload do n8n

## 1. Intent

O radiologista que usa o Copilot em "Modo revisão" não recebe suporte contextualizado à revisão de laudos — o agente de IA responde de forma genérica porque a requisição não transmite o modo ativo. Isso impossibilita fluxos de IA especializados em revisão, forçando o radiologista a trabalhar sem o suporte específico que o modo revisão deveria oferecer.

**Resultado esperado:** A informação do modo atual (revisão ou normal) chega consistentemente no `body` da requisição ao n8n, habilitando roteamento de fluxos de IA por contexto.

**Medida de sucesso:** O campo `interactionMode` aparece no `body` em 100% das chamadas ao Copilot (incluindo cenários de fallback), com valor correto para cada modo, verificável por testes automatizados no `animati-ai`.

## 2. User Story & AC

**User Story:**
Como radiologista usando o Copilot em "Modo revisão", quero que a requisição ao n8n inclua a informação do modo atual, para que os agentes de IA possam direcionar fluxos específicos de revisão de laudos.

**Critérios de Aceite:**

1. Quando o médico aciona o Copilot com "Modo revisão" ativo, a requisição ao n8n inclui no `body` o campo `interactionMode` com valor `"review"`.
2. Quando o médico aciona o Copilot com "Modo normal" ativo, a requisição ao n8n inclui no `body` o campo `interactionMode` com valor `"default"`.
3. O campo `interactionMode` está sempre presente no payload em 100% das requisições ao n8n, mesmo quando o valor é `"default"`.
4. Quando o estado do modo não estiver disponível (campo ausente, `null` ou string vazia), a requisição inclui o campo `interactionMode` com valor padrão `"default"`.
5. Quando o valor recebido não for reconhecido (diferente de `'review'` e `'default'`), o `animati-ai` aplica o fallback `"default"` antes de encaminhar ao n8n; o valor não reconhecido não é encaminhado.
6. O `animati-ai` passa o valor recebido no campo `copilotMode` do `pacs-core-front` diretamente como `interactionMode` no payload ao n8n, sem transformação dos valores.
7. Quando o fallback é ativado (condições do AC4 ou AC5), o `animati-ai` emite um log de nível WARNING registrando o valor original recebido no campo `copilotMode`.

## 3. User-Facing Behavior

**Cenário 1 — Modo revisão:**

```gherkin
Dado que o médico está na tela de laudo com "Modo revisão" ativo
Quando aciona o Copilot
Então a requisição ao n8n contém no body o campo interactionMode com valor "review"
```

**Cenário 2 — Modo normal:**

```gherkin
Dado que o médico está na tela de laudo com "Modo normal" ativo
Quando aciona o Copilot
Então a requisição ao n8n contém no body o campo interactionMode com valor "default"
```

**Cenário 3 — Estado indisponível:**

```gherkin
Dado que o campo de modo chega ausente, null ou vazio ao animati-ai
Quando o Copilot processa a requisição
Então a requisição ao n8n contém no body o campo interactionMode com valor padrão "default"
E o animati-ai emite um log de WARNING com o valor original recebido no campo copilotMode
```

**Cenário 4 — Valor não reconhecido:**

```gherkin
Dado que o animati-ai recebe do pacs-core-front um valor de copilotMode não reconhecido (diferente de 'review' e 'default')
Quando processa a requisição ao Copilot
Então encaminha ao n8n o campo interactionMode com valor de fallback "default"
E o valor não reconhecido não é encaminhado ao n8n
E o animati-ai emite um log de WARNING com o valor original recebido no campo copilotMode
```

## 4. Mockups

N/A — nenhuma mudança de UI nesta história. O botão "Modo revisão / Modo normal" foi criado em AP-2135 e não será alterado.

## 5. NFRs

O `animati-ai` deve emitir log de nível WARNING sempre que o fallback `"default"` for ativado (por campo ausente, `null`, vazio ou valor não reconhecido), incluindo no log o valor original recebido no campo `copilotMode`. Demais requisitos seguem os padrões da plataforma.

Verificação por testes automatizados no `animati-ai` é suficiente; os testes devem validar o payload HTTP enviado ao n8n, não apenas a lógica de mapeamento interna do serviço.

## 6. Architectural Constraints

- O campo `interactionMode` deve ser adicionado ao `body` da requisição ao n8n no mesmo nível dos campos existentes, sem remover ou renomear campos já presentes no payload.
- O campo deve ter tipo `string` para acomodar valores futuros além de `"review"` e `"default"`.
- O `pacs-core-front` já envia ao `animati-ai` a informação de modo via campo `copilotMode` no corpo da requisição, com valores `'review'` (Modo revisão) e `'default'` (Modo normal); nenhuma alteração no `pacs-core-front` é necessária para esta história.
- A camada de recepção de requisições do `animati-ai` (endpoint que recebe chamadas do `pacs-core-front`) deve ser atualizada para aceitar e processar o campo `copilotMode`; atualmente o campo é enviado pelo `pacs-core-front` mas descartado ao chegar no `animati-ai`.
- Nenhuma alteração em `pacs-core-front` ou no backend Java `pacs` é necessária para esta história.
- O escopo de mudança está inteiramente no serviço `animati-ai`.
- O valor de `interactionMode` é capturado a partir da requisição recebida pelo `animati-ai` no momento do acionamento do Copilot — não há outro momento de captura disponível na arquitetura atual.
- Valores não reconhecidos são convertidos para `"default"` internamente antes do encaminhamento ao n8n; o `animati-ai` não rejeita a requisição com erro HTTP para esse caso.

## 7. Non-Goals

- Não alterar o visual ou comportamento do botão "Modo revisão / Modo normal"
- Não criar novos fluxos no n8n
- Não garantir que o n8n consuma ou utilize o campo `interactionMode` — o consumo e a criação de fluxos baseados nesse campo são responsabilidade de histórias separadas
- Não alterar o `pacs-core-front` nem o backend Java `pacs`
- Não alterar outros endpoints ou integrações além do payload enviado pelo `animati-ai` ao n8n
- Não alterar o comportamento do laudo
- Não alterar o comportamento do `animati-ai` em casos de falha de comunicação com o n8n — o tratamento de erros de rede existente não é escopo desta história
- Não introduzir mecanismo externo de configuração dos valores válidos de `interactionMode`

## 8. Open Questions

| # | Questão | Tag |
|---|---------|-----|
| Q3 | A comparação dos valores de `copilotMode` recebidos deve ser case-sensitive (`'Review'` ≠ `'review'`) ou case-insensitive? | `Implementation-choice` |
| Q4 | Qual nível de teste é esperado para validar o payload HTTP enviado ao n8n: teste unitário com mock do cliente HTTP, ou teste de integração com servidor stub (ex: WireMock)? | `Implementation-choice` |
| Q5 | A serialização do campo `interactionMode` deve garantir que o valor `"normal"` nunca seja omitido por configurações de serialização JSON do serviço (ex: NON_EMPTY, NON_NULL)? | `Implementation-choice` |

## 9. Links

- [AP-2135](https://animati.atlassian.net/browse/AP-2135) — história de origem (botão "Modo revisão / Modo normal" criado)
