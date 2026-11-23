# AURA Portal — Training Copy

A **reduced, independent** Sphinx copy of the AURA Portal, for live demonstrations from the trainer’s Mac. This is **not** the official Portal.

## Included
Landing page, latest-news widget, news index and example article, AQ eReporting, Data tables, Tools and guidance, Links, AURA branding, Furo sidebar, and original news creation script.

## Set up on the Mac
1. Create an **empty** GitHub repository named `AQ_Portal_Training` under `MIH-aqteam`. Do not initialise it with a README.
2. Unzip this package, open Terminal in the `AQ_Portal_Training` folder.
3. Install dependencies: `python3 -m pip install -r requirements.txt` (prefer a virtual environment).
4. Preview: `./local.sh` (or `python3 -m sphinx -b html -n -W docs build/html`).
5. Only after reviewing the site: `git init -b main; git remote add origin https://github.com/MIH-aqteam/AQ_Portal_Training.git`.
6. Run `./publish.sh`. The script refuses any non-training remote and asks before staging, committing and pushing.
7. For GitHub Pages, set **Settings → Pages → Source: GitHub Actions**. The included `.github/workflows/pages.yml` builds and deploys the site automatically after a push. Do not select main/docs as the Pages source.

## Training exercises
- Edit `docs/index.md` and preview the landing page.
- Edit `docs/pages/data-tables.md` and preview the sidebar navigation.
- Run `./new_news.sh` to create a new news item and refresh the landing card.
- Inspect `docs/_templates` and `docs/_static/custom.css` to explain AURA identity.

## Safety
No official or existing testing repository is changed by this package. Never add an official AURA repository as the Git remote of this training copy.

## Validation status
The package structure, retained pages and guarded publishing destination were checked. A complete Sphinx build has **not** yet been run in this environment; run `./local.sh` before first publication.
