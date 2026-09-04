# SauceDemo — Robot Framework e Selenium

Automação web em **https://www.saucedemo.com/**, seguindo a estrutura do meu [Robot com Selenium](https://github.com/brunobaccari/robot-selenium-demo).

## Instalação

Python e Google Chrome. O CI usa Python 3.14; Selenium Manager resolve o driver automaticamente.

```bash
python -m venv .venv
```

Ative com `.venv\Scripts\activate` no Windows ou `source .venv/bin/activate` no Linux/macOS.

```bash
python -m pip install -r requirements.txt
python run_tests.py --outputdir results src/Clients
```

## Estrutura

```text
src/Clients/Checkout.robot       testes, setup e teardown
src/TestCases/Checkout.robot     composição dos cenários
src/Pages/                      ações de login e checkout
src/Resources/Browser.robot     navegador e ambiente
```

## Cenários

- Login e compra de mochila: item correto, subtotal US$ 29,99, taxa US$ 2,40 e total US$ 32,39, seguido de confirmação.
- Usuário bloqueado permanece no login.
- Nome obrigatório impede avançar no checkout.
- Remoção do produto limpa o carrinho e o indicador de quantidade.

Cada teste abre um navegador novo e fecha no teardown. As keywords esperam por elementos e URLs; não há sleeps nem retry automático.

`src/Helpers/StableElement.py` espera duas observações consecutivas com a mesma posição e dimensão antes de interagir. As transições também aguardam o conteúdo da página de destino, além da mudança de URL.

## Relatórios

`results/report.html`, `results/log.html` e screenshot do checkout concluído. O CI guarda a pasta de resultados. [Execuções e artifacts no Actions](https://github.com/brunobaccari/robot-selenium-checkout/actions).

Credenciais são as públicas da página inicial e os dados de cliente são fictícios. Não há compra real, aplicação local ou emulador. O ambiente público pode mudar; os valores representam o catálogo padrão conferido em 06/10/2026.

## Configuração do ambiente

Copie `.env.example` para `.env` (`Copy-Item .env.example .env` no PowerShell ou `cp .env.example .env` no Linux/macOS). As variáveis do processo têm prioridade. `.env` não é versionado. URLs e credenciais ficam nessa configuração; os valores esperados dos testes permanecem nos cenários.

As contas do exemplo são públicas e exclusivas de demonstração. Para outro ambiente, injete credenciais via secrets do CI e confirme também o contrato e os dados esperados antes de executar.

Datas de commits deste portfólio foram reorganizadas retroativamente; as execuções do Actions mantêm suas datas reais.
