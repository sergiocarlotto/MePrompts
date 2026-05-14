---
file: replicar-ambiente-codex
scope: global
version: 2.2.0
updated: 2026-05-14
---

# Prompt Unico para Replicar o Ambiente Codex

Copie e cole o bloco abaixo em uma nova sessao do Codex/IA no outro computador. Ele deve guiar a propria IA a instalar, clonar, validar e carregar o contexto necessario para todos os projetos locais conhecidos.

```text
Voce vai me ajudar a replicar neste computador o ambiente de trabalho que uso hoje com Codex/IA.

Contexto original:
- Sistema esperado: Windows
- Shell esperado: PowerShell
- Timezone operacional: America/Sao_Paulo
- Pasta GitHub original: C:\Users\sergi\OneDrive\Documents\GitHub
- Pasta GitLab Animati original: C:\Users\sergi\OneDrive\Documents\Gitlab Animati
- Repo de prompts/contexto: MePrompts
- Ferramentas de agente envolvidas: Claude/Claude Code, Codex CLI e MCPs quando disponiveis
- Projeto Jira padrao para triagem: ANAP
- Projeto Jira para desenvolvimento confirmado: AP

Objetivo:
Deixar este computador pronto para trabalhar com os mesmos repositorios, prompts, regras de Jira e padrao de colaboracao usados no ambiente original.

Regras de conducao:
1. Trabalhe de forma pratica: execute comandos, verifique resultados e faca os ajustes necessarios.
2. Antes de instalar, clonar, mover ou alterar arquivos, confirme o que ja existe no computador.
3. Se faltar informacao obrigatoria, faca uma pergunta objetiva e espere minha resposta.
4. Se uma acao exigir credencial, token, permissao de rede, VPN ou acesso Git/Jira, pare e pergunte o que usar.
5. Nao apague nem sobrescreva pastas existentes sem pedir confirmacao explicita.
6. Preserve alteracoes locais existentes.
7. Use `rg`/`rg --files` quando disponivel; se nao estiver instalado, use PowerShell.
8. Responda em portugues, de forma objetiva, informando caminhos e comandos relevantes.

Repositorios conhecidos no ambiente original:

| Grupo | Pasta local original | Remote | Branch observada |
|---|---|---|---|
| GitHub | C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts | https://github.com/sergiocarlotto/MePrompts.git | main |
| GitHub | C:\Users\sergi\OneDrive\Documents\GitHub\AssistantsAI | https://github.com/sergiocarlotto/AssistantsAI.git | main |
| GitHub | C:\Users\sergi\OneDrive\Documents\GitHub\plugin-marketplace | https://github.com/ArcadeaGroup/plugin-marketplace.git | main |
| GitHub | C:\Users\sergi\OneDrive\Documents\GitHub\arcadea_worshop | SEM REMOTE CONFIGURADO no ambiente original | main |
| GitLab Animati | C:\Users\sergi\OneDrive\Documents\Gitlab Animati\animati-ai | https://git.animati.com.br/animati-pacs/pacs-services/animati-ai.git | main |
| GitLab Animati | C:\Users\sergi\OneDrive\Documents\Gitlab Animati\pacs | https://git.animati.com.br/animati-pacs/pacs.git | master |
| GitLab Animati | C:\Users\sergi\OneDrive\Documents\Gitlab Animati\pacs-core-front | https://git.animati.com.br/animati-pacs/pacs-core-front.git | master |

Ferramentas e integracoes observadas no ambiente original:

| Tipo | Item | Detalhe |
|---|---|---|
| Codex CLI | `codex` | `codex-cli 0.130.0-alpha.5`, vindo da extensao VS Code `openai.chatgpt` |
| Claude Code | `claude` | `2.1.126 (Claude Code)`, binario em `C:\Users\sergi\.local\bin\claude.exe` |
| Git | `git` | `2.54.0.windows.1` |
| Node | `node` | `v24.15.0` |
| npm | `npm` | `11.12.1`; no ambiente original `npm list -g --depth=0` falhava porque `C:\Users\sergi\AppData\Roaming\npm` nao existia |
| ripgrep | `rg` | Disponivel via extensao VS Code `openai.chatgpt` |
| Java/Maven/Ant | `java`, `mvn`, `ant` | Nao apareceram no PATH durante a auditoria |
| Codex MCP | `atlassian` | URL `https://mcp.atlassian.com/v1/mcp/authv2` em `~\.codex\config.toml` |
| Claude MCP | `Jira` | User-scope, HTTP, URL `https://mcp.atlassian.com/v1/mcp/authv2`; no ambiente original falhou conexao no momento da auditoria |
| Claude plugins | `superpowers@superpowers-marketplace` | instalado e habilitado, versao `5.0.7`, escopo user |
| Claude plugins | `abs-animati@plugin-marketplace` | instalado e habilitado, versao `0.1.53`, escopo user |
| Claude marketplace | `superpowers-marketplace` | GitHub `obra/superpowers-marketplace` |
| Claude marketplace | `plugin-marketplace` | GitHub `ArcadeaGroup/plugin-marketplace` |

Extensoes VS Code observadas:
- `openai.chatgpt`
- `anthropic.claude-code`
- `angular.ng-template`
- `eamodio.gitlens`
- `mhutchie.git-graph`
- `redhat.java`
- `vscjava.vscode-gradle`
- `vscjava.vscode-java-debug`
- `vscjava.vscode-java-dependency`
- `vscjava.vscode-java-pack`
- `vscjava.vscode-java-test`
- `vscjava.vscode-maven`

Arquivos sensiveis que NAO devem ser copiados diretamente:
- `C:\Users\<usuario>\.claude\.credentials.json`
- `C:\Users\<usuario>\.codex\auth.json`
- qualquer arquivo com token, refresh token, client secret, cookie ou chave privada

Esses acessos devem ser recriados por login/OAuth na nova maquina.

Sequencia obrigatoria de bootstrap:

1. Identificar ambiente
   - Execute:
     - `pwd`
     - `$PSVersionTable.PSVersion`
     - `git --version`
   - Se `git` nao existir, pergunte:
     "Git nao esta instalado ou nao esta no PATH. Posso instalar/configurar o Git neste computador?"

2. Definir pastas base
   - Sugestao padrao:
     - `C:\Users\<usuario>\OneDrive\Documents\GitHub`
     - `C:\Users\<usuario>\OneDrive\Documents\Gitlab Animati`
   - Se essas pastas nao existirem, pergunte:
     "Qual pasta base devo usar para os repositorios GitHub e GitLab Animati neste computador?"
   - Se o usuario escolher uma pasta diferente, adapte todos os caminhos seguintes.

3. Clonar ou validar `MePrompts` primeiro
   - Este repo deve vir antes porque contem o contexto compartilhado dos projetos.
   - Caminho sugerido:
     - `C:\Users\<usuario>\OneDrive\Documents\GitHub\MePrompts`
   - Se nao existir, clone:
     - `git clone https://github.com/sergiocarlotto/MePrompts.git "C:\Users\<usuario>\OneDrive\Documents\GitHub\MePrompts"`
   - Se ja existir:
     - verifique se e repo Git;
     - mostre `git remote -v`;
     - mostre `git branch --show-current`;
     - mostre `git status --short`;
     - nao faca pull se houver alteracoes locais sem perguntar.
   - Se o clone pedir credencial ou falhar por acesso, pergunte:
     "Nao consegui acessar o repo MePrompts. Voce quer usar HTTPS com token, SSH, ou copiar a pasta manualmente?"

4. Validar estrutura principal do `MePrompts`
   - Depois de clonar/validar, confirme se existem:
     - `README.md`
     - `projects\shared\workflow.md`
     - `projects\shared\jira.md`
     - `projects\shared\standards\cards.md`
     - `projects\shared\standards\user-stories.md`
     - `projects\shared\standards\definition-of-done.md`
     - `projects\pacs`
     - `projects\animati-ai`
     - `projects\assistants-ai`
     - `projects\plugin-marketplace`
     - `projects\me-prompts`
     - `docs\replicar-ambiente-codex.md`

5. Clonar ou validar repositorios GitHub
   - Para cada repo abaixo, se a pasta nao existir, clone. Se existir, valide remote/branch/status e nao sobrescreva nada.
   - `AssistantsAI`:
     - caminho sugerido: `C:\Users\<usuario>\OneDrive\Documents\GitHub\AssistantsAI`
     - clone: `git clone https://github.com/sergiocarlotto/AssistantsAI.git "C:\Users\<usuario>\OneDrive\Documents\GitHub\AssistantsAI"`
   - `plugin-marketplace`:
     - caminho sugerido: `C:\Users\<usuario>\OneDrive\Documents\GitHub\plugin-marketplace`
     - clone: `git clone https://github.com/ArcadeaGroup/plugin-marketplace.git "C:\Users\<usuario>\OneDrive\Documents\GitHub\plugin-marketplace"`
   - `arcadea_worshop`:
     - caminho sugerido: `C:\Users\<usuario>\OneDrive\Documents\GitHub\arcadea_worshop`
     - no ambiente original, este repo nao tem remote configurado;
     - pergunte antes de prosseguir:
       "O projeto `arcadea_worshop` nao tem remote configurado no ambiente original. Qual remote devo usar, ou voce prefere copiar essa pasta manualmente?"

6. Clonar ou validar repositorios GitLab Animati
   - Para cada repo abaixo, se a pasta nao existir, clone. Se existir, valide remote/branch/status e nao sobrescreva nada.
   - Se qualquer clone do GitLab Animati falhar, pergunte:
     "Nao consegui acessar o GitLab Animati. Voce quer usar HTTPS com usuario/token, SSH, VPN, ou outro caminho?"
   - `animati-ai`:
     - caminho sugerido: `C:\Users\<usuario>\OneDrive\Documents\Gitlab Animati\animati-ai`
     - clone: `git clone https://git.animati.com.br/animati-pacs/pacs-services/animati-ai.git "C:\Users\<usuario>\OneDrive\Documents\Gitlab Animati\animati-ai"`
   - `pacs`:
     - caminho sugerido: `C:\Users\<usuario>\OneDrive\Documents\Gitlab Animati\pacs`
     - clone: `git clone https://git.animati.com.br/animati-pacs/pacs.git "C:\Users\<usuario>\OneDrive\Documents\Gitlab Animati\pacs"`
   - `pacs-core-front`:
     - caminho sugerido: `C:\Users\<usuario>\OneDrive\Documents\Gitlab Animati\pacs-core-front`
     - clone: `git clone https://git.animati.com.br/animati-pacs/pacs-core-front.git "C:\Users\<usuario>\OneDrive\Documents\Gitlab Animati\pacs-core-front"`

7. Ajustar arquivos `CLAUDE.md` quando existirem
   - Para cada repo clonado/validado, procure `CLAUDE.md` na raiz.
   - Se existir, leia o arquivo e verifique referencias absolutas ao `MePrompts`.
   - Se os caminhos apontarem para outro usuario/computador, pergunte antes de editar:
     "O CLAUDE.md de [repo] aponta para outro ambiente. Posso ajustar para o caminho local do MePrompts neste computador?"
   - Se autorizado, atualize apenas os caminhos dos includes, mantendo a lista de arquivos referenciados.
   - No ambiente original foram encontrados `CLAUDE.md` nestes repos:
     - `AssistantsAI`
     - `animati-ai`
     - `pacs`
     - `plugin-marketplace`
   - Se algum desses repos nao tiver `CLAUDE.md` apos o clone, pergunte:
     "O repo [repo] nao tem CLAUDE.md nesta maquina. Posso recriar com base nos includes do MePrompts?"

8. Replicar configuracoes locais do Claude/Claude Code
   - Verifique se a ferramenta esta disponivel:
     - `claude --version`
   - Se nao estiver disponivel, pergunte:
     "Claude/Claude Code nao esta instalado ou nao esta no PATH. Voce quer instalar/configurar agora ou apenas deixar os arquivos do projeto prontos?"
   - Leia `C:\Users\<usuario>\.claude\CLAUDE.md`, se existir. No ambiente original ele define:
     - responder em portugues do Brasil;
     - manter comandos/arquivos/APIs no idioma original;
     - pedir confirmacao antes de comandos destrutivos;
     - nao gravar permissoes em `.claude/settings.local.json` de projetos;
     - gravar permissoes do Claude Code no arquivo global `~\.claude\settings.json`.
   - Verifique `C:\Users\<usuario>\.claude\settings.json`, se existir, sem copiar segredos.
   - No ambiente original, `~\.claude\settings.json` continha:
     - plugins habilitados: `superpowers@superpowers-marketplace` e `abs-animati@plugin-marketplace`;
     - marketplaces: `obra/superpowers-marketplace` e `ArcadeaGroup/plugin-marketplace`;
     - permissoes para ferramentas MCP Jira e alguns comandos `python3`/`node`;
     - permissao de skill `update-config`.
   - Procure pastas `.claude` nos repos.
   - No ambiente original foi encontrada:
     - `C:\Users\sergi\OneDrive\Documents\Gitlab Animati\pacs\.claude\settings.local.json`
   - Essa configuracao local do `pacs` contem permissoes antigas para ler `MePrompts` e caminhos GitHub, mas a regra global atual do usuario diz para nao gravar novas permissoes em arquivos locais de projeto.
   - Portanto, replique preferencialmente em `~\.claude\settings.json`, nao em `.claude/settings.local.json` de projeto.
   - Ao replicar configuracao Claude, siga:
     - nunca copie tokens ou segredos;
     - ajuste caminhos absolutos para o usuario atual;
     - nao libere permissao ampla sem perguntar;
     - preserve o escopo minimo necessario para ler `MePrompts` e os repos clonados.
   - Se for necessario criar/ajustar permissoes Claude, pergunte antes:
     "Posso criar/ajustar `~\.claude\settings.json` para apontar para os caminhos locais do MePrompts e dos repos clonados?"
   - Se algum projeto exigir uma excecao em `.claude/settings.local.json`, explique que isso contraria a preferencia global atual e pergunte explicitamente antes.

9. Replicar plugins e marketplaces do Claude Code
   - Verifique:
     - `claude plugin marketplace list`
     - `claude plugin list`
   - No ambiente original, configure estes marketplaces se faltarem:
     - `claude plugin marketplace add obra/superpowers-marketplace`
     - `claude plugin marketplace add ArcadeaGroup/plugin-marketplace`
   - Depois instale/habilite estes plugins, se faltarem:
     - `claude plugin install -s user superpowers@superpowers-marketplace`
     - `claude plugin install -s user abs-animati@plugin-marketplace`
   - Valide:
     - `claude plugin list`
   - Resultado esperado:
     - `superpowers@superpowers-marketplace`, versao proxima de `5.0.7`, escopo user, enabled;
     - `abs-animati@plugin-marketplace`, versao proxima de `0.1.53`, escopo user, enabled.
   - Se houver conflito de versao, marketplace privado, falha de rede ou autenticacao, pare e pergunte.

10. Replicar Codex CLI, plugins e MCPs envolvidos
   - Verifique se Codex CLI esta disponivel:
     - `codex --version`
   - Se nao estiver disponivel, pergunte:
     "Codex CLI nao esta instalado ou nao esta no PATH. Voce quer instalar/configurar agora?"
   - Verifique configuracao local:
     - caminho esperado: `C:\Users\<usuario>\.codex\config.toml`
   - Se existir, leia somente a estrutura necessaria e nao exponha segredos.
   - Se nao existir, pergunte:
     "Nao encontrei `~\.codex\config.toml`. Posso criar uma configuracao basica para este ambiente?"
   - No ambiente original, a configuracao relevante observada era:
     - modelo preferido: `gpt-5.5`
     - reasoning: `medium`
     - personalidade: `pragmatic`
     - memorias habilitadas
     - projeto `pacs` marcado como trusted
     - MCP Atlassian declarado em `[mcp_servers.atlassian]`
     - URL MCP Atlassian: `https://mcp.atlassian.com/v1/mcp/authv2`
   - Nao copie `~\.codex\auth.json`; refaca login/autenticacao na nova maquina.
   - Para configurar MCP Atlassian no Codex, use preferencialmente:
     - `codex mcp add atlassian --url https://mcp.atlassian.com/v1/mcp/authv2`
   - Depois valide:
     - `codex mcp get atlassian`
     - `codex mcp list`
   - Se a autenticacao OAuth for solicitada, pare e pergunte:
     "O MCP Atlassian precisa autenticar via OAuth. Posso abrir/seguir o fluxo de autenticacao nesta maquina?"
   - Importante: diferencie sempre estes estados:
     - MCP registrado no `config.toml`;
     - OAuth/autenticacao concluida;
     - MCP realmente carregado na sessao atual.
   - Se `codex mcp list` mostrar o Atlassian configurado/autenticado, mas as ferramentas Atlassian nao aparecerem na sessao, explique que provavelmente e necessario reiniciar/reabrir a sessao do Codex.
   - Se houver outros MCPs locais ou remotos configurados no computador original, pergunte:
     "Existe algum outro MCP alem do Atlassian que devo replicar nesta maquina?"
   - Sobre plugins:
     - valide o repo `plugin-marketplace`, pois ele faz parte do ambiente original;
     - verifique se ha plugins locais instalados no Codex/Claude antes de tentar replicar;
     - nao instale plugin automaticamente sem perguntar qual fonte/marketplace usar;
     - se o usuario pedir especificamente o plugin do Claude, confirme se ele se refere ao Claude Code, ao arquivo `.claude`, ou a algum plugin instalado em marketplace.

11. Replicar MCP Jira/Atlassian do Claude Code
   - Verifique:
     - `claude mcp list`
     - `claude mcp get Jira`
   - No ambiente original, havia um MCP user-scope:
     - nome: `Jira`
     - tipo: `http`
     - URL: `https://mcp.atlassian.com/v1/mcp/authv2`
   - Se faltar, configure:
     - `claude mcp add -s user --transport http Jira https://mcp.atlassian.com/v1/mcp/authv2`
   - Se OAuth/autenticacao for solicitada, pare e pergunte:
     "O MCP Jira do Claude precisa autenticar via OAuth. Posso seguir o fluxo de autenticacao nesta maquina?"
   - Valide de novo:
     - `claude mcp list`
     - `claude mcp get Jira`
   - Se aparecer `Failed to connect`, registre como pendencia de rede/auth/VPN/OAuth, mas nao considere que os repos ou prompts falharam.

12. Replicar extensoes do VS Code
   - Verifique:
     - `code --version`
     - `code --list-extensions`
   - Se `code --list-extensions` nao listar nada, tambem verifique a pasta:
     - `C:\Users\<usuario>\.vscode\extensions`
   - Instale as extensoes observadas quando faltarem:
     - `code --install-extension openai.chatgpt`
     - `code --install-extension anthropic.claude-code`
     - `code --install-extension angular.ng-template`
     - `code --install-extension eamodio.gitlens`
     - `code --install-extension mhutchie.git-graph`
     - `code --install-extension redhat.java`
     - `code --install-extension vscjava.vscode-gradle`
     - `code --install-extension vscjava.vscode-java-debug`
     - `code --install-extension vscjava.vscode-java-dependency`
     - `code --install-extension vscjava.vscode-java-pack`
     - `code --install-extension vscjava.vscode-java-test`
     - `code --install-extension vscjava.vscode-maven`
   - Se a instalacao de extensoes exigir marketplace/proxy/login, pergunte antes de continuar.
   - Depois de instalar/abrir VS Code, garanta que uma pasta de projeto esteja aberta. O Codex/ChatGPT pode exibir `"add a project to use codex"` quando o VS Code esta aberto apenas com um arquivo solto ou sem workspace.
   - Se essa mensagem aparecer:
     - feche abas de arquivos soltos que apontem para caminhos antigos;
     - use `File > Open Folder...` ou `Add Folder to Workspace...`;
     - selecione a raiz de um repo clonado, por exemplo `MePrompts`, `pacs`, `animati-ai`, `AssistantsAI`, `plugin-marketplace` ou `pacs-core-front`;
     - para trabalhar no prompt de replicacao, abra a pasta `MePrompts` e entao o arquivo `docs\replicar-ambiente-codex.md`;
     - para trabalhar no PACS, abra a pasta raiz `pacs`, nao apenas um arquivo `.md`.

13. Carregar regras compartilhadas
   - Leia no `MePrompts`:
     - `projects\shared\workflow.md`
     - `projects\shared\jira.md`
     - `projects\shared\standards\cards.md`
     - `projects\shared\standards\user-stories.md`
     - `projects\shared\standards\definition-of-done.md`
   - Aplique estas regras principais:
     - ANAP e o projeto padrao para analise, configuracao e triagem.
     - AP e usado apenas para bugs, melhorias ou desenvolvimento ja confirmados.
     - Nao consultar nem escrever em projetos Jira fora da lista permitida sem perguntar antes.
     - Cards, specs e historias devem seguir os padroes de `MePrompts\projects\shared\standards`.

14. Verificar ferramentas opcionais
   - Verifique disponibilidade de:
     - Java
     - Maven
     - Ant
     - Node/npm
     - VS Code e extensoes listadas
     - Codex CLI, se aplicavel
     - Claude/Claude Code, se aplicavel
     - MCP/Atlassian, se a tarefa envolver Jira/Confluence
   - Nao instale nada opcional sem perguntar.
   - Se `npm list -g --depth=0` falhar por ausencia de `AppData\Roaming\npm`, pergunte antes de criar a pasta ou alterar configuracao npm.
   - Se Jira/Confluence for necessario, diferencie:
     - ferramenta configurada
     - autenticacao feita
     - ferramenta ativa na sessao atual

15. Validacao final
   - Para cada repo existente/clonado, execute:
     - `git status --short`
     - `git remote -v`
     - `git branch --show-current`
   - Para ferramentas/agentes, execute quando disponivel:
     - `claude --version`
     - `codex --version`
     - `codex mcp list`
     - `claude plugin marketplace list`
     - `claude plugin list`
     - `claude mcp list`
     - `code --list-extensions`
   - Informe um resumo com:
     - caminho final de cada repo;
     - remote de cada repo;
     - branch atual de cada repo;
     - repos nao clonados por falta de remote/acesso;
     - status do Claude/Claude Code;
     - status dos plugins e marketplaces Claude;
     - status do Codex CLI;
     - MCPs configurados no Codex e MCPs realmente disponiveis na sessao;
     - MCPs configurados no Claude e status de conexao;
     - extensoes VS Code instaladas/faltantes;
     - pendencias de credencial, VPN, ferramenta, plugin ou configuracao.

Depois do bootstrap:
- Nao faca alteracoes de produto sem uma tarefa concreta minha.
- Quando eu pedir implementacao, investigue o codigo primeiro e entao edite.
- Quando eu pedir revisao, responda em postura de code review: achados primeiro, por severidade, com arquivo/linha.
- Quando eu pedir cards, historias ou specs, use os padroes do `MePrompts`.
- Quando o pedido envolver outro repositorio, confirme o caminho real antes de editar.
```
