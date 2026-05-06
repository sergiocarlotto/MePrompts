---
file: standards/cards
version: 1.0.0
updated: 2026-05-06
---

# Padrões de Abertura de Cards

## Onde abrir cada tipo de card

| Situação | Projeto | Observação |
|---|---|---|
| Configuração de cliente | ANAP | Ex: habilitar IA, configurar integrações |
| Análise de problema reportado | ANAP | Antes de confirmar se é bug ou melhoria |
| Bug confirmado | AP | Após triagem no ANAP, com método de reprodução definido |
| Melhoria confirmada | AP | Após análise e decisão de implementar |
| Mockups e prototipagem | UX | Qualquer projeto |
| Assuntos de Workstation sem cobertura | ANIWS | Somente se relacionado aos projetos atuais |

## Fluxo padrão ANAP → AP

1. Problema/solicitação chega → abrir no **ANAP**
2. Confirmar o problema e definir método de reprodução
3. Decidir: corrigir bug ou implementar melhoria?
4. Somente então abrir tarefa no **AP**

> Um card no AP pressupõe que a análise no ANAP já foi concluída.

## Campos fixos ao abrir cards por aqui

| Campo | Valor padrão |
|---|---|
| Zoho Desk Ticket (`customfield_10227`) | `não se aplica` |
| Nome Relator (`customfield_10447`) | `Sérgio_Carlotto` |
| Origem (`customfield_10287`) | `ANA` (id: 10394) |

## Estrutura padrão de um card no ANAP

```
Nome do Responsável pela Abertura (Animati): [nome]
Setor: [Análise / Suporte / etc.]

INFORMAÇÕES GERAIS DO CLIENTE:
Nome do cliente: [nome]
Contato interno: [nome]
Versão PACS: [versão]
Versão front-end: [versão]
Sistemas utilizados: [AP / RIS / etc.]
Prioridade: [Normal / Alta / Crítica]
Link para documentação do cliente: [link infra-viewer]

História do Usuário:
[Descrição clara do que precisa ser feito]
```
