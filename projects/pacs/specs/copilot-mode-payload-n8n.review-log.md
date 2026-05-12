# Review Log — copilot-mode-payload-n8n

> Loop de revisores encerrado em 3 rodadas (limite máximo). Spec salva como best-effort draft com questões abertas para revisão cross-funcional.

---

## Rodada 1

| Campo | Valor |
|-------|-------|
| **Técnico** | Changes Requested |
| **Qualidade** | Changes Requested |
| **Produto** | Changes Requested |
| **Produto A1 (terminologia)** | Not Affirmed |
| **Produto A2 (sem contradições)** | Affirmed |
| **Findings — Técnico** | critical: 2, important: 3, minor: 2 |
| **Findings — Qualidade** | critical: 2, important: 3, minor: 2 |
| **Findings — Produto** | critical: 0, important: 3, minor: 3 |
| **Classificação** | autonomous: 4, po-input: 4 |

### Escalações ao PO — Rodada 1

**P1:** Qual é o caminho completo de propagação do campo de modo desde o estado no frontend até a chamada ao n8n — quais serviços intermediários existem?
**Resposta:** Alteração apenas no `animati-ai`. Campo renomeado de `copilotMode` para `interactionMode`.

**P2:** Qual é o comportamento esperado ao receber um valor de modo não reconhecido?
**Resposta:** Aplicar fallback `"normal"`.

**P3:** A propagação exige alteração em algum serviço intermediário fora do escopo?
**Resposta:** Apenas `animati-ai`. Verificação do código de `pacs` e `pacs-core-front` solicitada pelo PO.

**P4:** A medida de sucesso "100% das chamadas" requer mecanismo de verificação em produção?
**Resposta:** Apenas testes automatizados são suficientes.

### Correções autônomas aplicadas

- Terminologia: "modo de revisão" → "Modo revisão" (consistência com AP-2135)
- Non-Goals: adicionado non-goal explícito sobre consumo do campo pelo n8n
- Intent: reforçada âncora de dor do usuário com palavras do PO
- Open Questions: adicionadas Q1–Q4 como Implementation-choice

---

## Rodada 2

| Campo | Valor |
|-------|-------|
| **Técnico** | Changes Requested |
| **Qualidade** | Changes Requested |
| **Produto** | Changes Requested |
| **Produto A1 (terminologia)** | Affirmed |
| **Produto A2 (sem contradições)** | Affirmed |
| **Findings — Técnico** | critical: 1, important: 3, minor: 2 |
| **Findings — Qualidade** | critical: 3, important: 3, minor: 1 |
| **Findings — Produto** | critical: 0, important: 5, minor: 2 |
| **Classificação** | autonomous: 6, po-input: 4 |

### Escalações ao PO — Rodada 2

**C1:** Condições técnicas de fallback — ausente, null, string vazia → todos aplicam `"normal"`?
**Resposta:** Confirmado (OK).

**C2:** Comportamento em falha de comunicação com o n8n está fora do escopo desta história?
**Resposta:** Confirmado (OK).

**C3:** Abordagem de validação: fallback silencioso sem HTTP 400?
**Resposta:** Confirmado (OK).

**C4:** Nomes de classes Java devem ficar fora do spec?
**Resposta:** Confirmado — devem ficar fora do spec.

### Correções autônomas aplicadas

- AC4: condições concretas adicionadas (campo ausente, null, string vazia)
- Constraints: adicionado contrato do `pacs-core-front` (`copilotMode: 'review'/'default'`)
- Constraints: adicionado timing de captura (momento do acionamento)
- Constraints: abordagem de validação (sem HTTP 400, fallback interno)
- Non-Goals: adicionado tratamento de falha de rede como non-goal
- NFRs: adicionada nota sobre validar payload serializado, não objeto interno
- Open Questions: Q1/Q2 fechadas; Q3/Q4 mantidas como Implementation-choice

---

## Rodada 3 (máximo atingido)

| Campo | Valor |
|-------|-------|
| **Técnico** | Changes Requested |
| **Qualidade** | Changes Requested |
| **Produto** | Changes Requested |
| **Produto A1 (terminologia)** | Not Affirmed |
| **Produto A2 (sem contradições)** | Not Affirmed |
| **Findings — Técnico** | critical: 2, important: 3, minor: 2 |
| **Findings — Qualidade** | critical: 2, important: 3, minor: 2 |
| **Findings — Produto** | critical: 0, important: 3, minor: 2 |
| **Classificação** | autonomous: 5, po-input: 0 (limite atingido) |
| **⚠️ Limite máximo de rodadas** | Loop encerrado sem convergência |

### Correções autônomas finais aplicadas (antes do banner)

- AC6: adicionada regra de mapeamento explícita (`'review'` → `"revisao"`, `'default'` → `"normal"`)
- AC3: adicionada obrigatoriedade de presença em 100% das requisições
- Cenário 4: vocabulário corrigido para usar valores de entrada do `pacs-core-front`
- Constraint: adicionada nota sobre recepção (`pacs-core-front` envia mas `animati-ai` descarta atualmente)
- Non-Goals: adicionado non-goal sobre externalização da regra de mapeamento
- NFRs: removida referência a "objeto Java intermediário" (stack-específica)

### Questões capturadas como Open Questions (não resolvidas)

| # | Tag | Questão |
|---|-----|---------|
| Q1 | `Product-choice` | Dependência de deploy do `pacs-core-front` |
| Q2 | `Product-choice` | Log de WARNING para ativações de fallback |
| Q3 | `Implementation-choice` | Case-sensitivity dos valores de entrada |
| Q4 | `Implementation-choice` | Nível de teste para validação do payload |
| Q5 | `Implementation-choice` | Garantia de serialização (NON_EMPTY/NON_NULL) |

---

## Status da Aprovação por Seção (Phase 6 — não iniciada)

> Phase 6 não foi iniciada. O loop não convergiu. A aprovação por seção ocorrerá após a revisão cross-funcional resolver as questões Q1 e Q2 e uma nova execução deste skill.

| Seção | Status |
|-------|--------|
| 1. Intent | Pendente |
| 2. User Story & AC | Pendente |
| 3. User-Facing Behavior | Pendente |
| 4. Mockups | Pendente |
| 5. NFRs | Pendente |
| 6. Architectural Constraints | Pendente |
| 7. Non-Goals | Pendente |
| 8. Open Questions | Pendente |
| 9. Links | Pendente |
