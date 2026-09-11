# SauceDemo — Robot Framework and Selenium

[Versão em português](README.md)

Web automation against the hosted [SauceDemo](https://www.saucedemo.com/) site, following the organization of my [earlier Robot/Selenium project](https://github.com/brunobaccari/robot-selenium-demo).

## Run

Python and Google Chrome. CI uses Python 3.14. Selenium Manager resolves the browser driver.

Create a virtual environment with `python -m venv .venv`. Activate it with `.venv\Scripts\activate` on Windows or `source .venv/bin/activate` on Linux/macOS.

```bash
cp .env.example .env
python -m pip install -r requirements.txt
python run_tests.py --pythonpath . --outputdir results --xunit junit.xml src/Clients
```

Use `Copy-Item .env.example .env` on PowerShell. The runner loads URLs and public demo credentials from `.env`; existing process variables take precedence. `.env` is ignored. If adapting the project, keep private credentials in CI secrets.

## Structure and scenarios

`src/Clients/` defines tests and teardown, `src/TestCases/` composes scenarios, `src/Pages/` contains actions, and `src/Resources/` configures the browser.

Four cases cover backpack checkout (USD 29.99 subtotal, USD 2.40 tax, USD 32.39 total and confirmation), blocked login, required customer name and removal of the last cart item.

Each test opens a fresh browser and closes it at teardown. `src/Helpers/StableElement.py` waits for two consecutive observations with the same position and dimensions before interaction. Transitions wait for destination content as well as the URL. No fixed sleeps or automatic retries of actions or tests.

## Evidence and limits

`results/report.html`, `results/log.html` and a screenshot of completed checkout are uploaded by CI. See [Actions runs and artifacts](https://github.com/brunobaccari/robot-selenium-checkout/actions).

Only public demo accounts and fictitious customer data are used. No real purchase, local application or emulator. Expected values refer to the catalog reviewed on October 6, 2026; changes in the hosted environment require review.


On GitHub, open **Actions → Tests → run → Summary** for the test-step outcome, JUnit counts and evidence download link. Under **Artifacts**, download `results` and extract the ZIP to open the reports. The ZIP also includes `summary.md`. Retention is 7 days; upload and summary steps also run after failures. Missing reports are explicitly reported as unverified execution.

Commit dates in this portfolio were reorganized retroactively; Actions runs retain their actual execution dates.
