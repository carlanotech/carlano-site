# Carlano Technology Solutions LLC — Website

Static single-page site for Carlano Technology Solutions LLC. No build step, no dependencies.

## Files

- `index.html` — the entire site (HTML + CSS inline)
- `assets/` — logo files (icon + full logo)
- `404.html` — redirects stray paths back to home
- `.nojekyll` — tells GitHub Pages to serve files as-is

## Deploy to GitHub Pages

1. Create a new **public** repo (suggested name: `carlano-site`).
2. Upload the contents of this `carlano-website` folder to the repo root
   (so `index.html` is at the top level, not inside a subfolder).
   - Web: repo → **Add file → Upload files** → drag everything in, commit.
   - CLI: `git init && git add . && git commit -m "Initial site" && git remote add origin <repo-url> && git push -u origin main`
3. Repo → **Settings → Pages**.
4. Under **Build and deployment → Source**, choose **Deploy from a branch**.
5. Branch: `main`, folder: `/ (root)`. Save.
6. Wait ~1 minute. Your site is live at:
   `https://<your-username>.github.io/carlano-site/`

## Adding a custom domain later (optional)

1. Buy a domain (e.g. carlanotech.com / carlano.tech).
2. Repo → **Settings → Pages → Custom domain** → enter the domain → Save.
   (This creates a `CNAME` file in the repo.)
3. At your domain registrar, add DNS records:
   - Four `A` records for the apex domain pointing to:
     `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
   - Or a `CNAME` record for `www` → `<your-username>.github.io`
4. Back in Pages settings, check **Enforce HTTPS** once the cert provisions.

## Editing the site

Everything is in `index.html`. Edit text directly, commit, and Pages redeploys automatically within a minute.
