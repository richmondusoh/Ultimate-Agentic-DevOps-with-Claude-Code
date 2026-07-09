# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A **static HTML/CSS portfolio website** (single-page site for "Pravin Mishra") used as the deployable artifact in a **DevOps Micro Internship (DMI)** course. Students deploy this site to prove they can host a static site in production.

Pure HTML5 + CSS3 — **no JavaScript, no build step, no package manager, no tests, no linter.** Files are served as-is. "Building" means copying files to a web root.

## Structure

- `index.html` — the whole site. One page, ordered sections: navbar → hero (`#home`) → about → services → courses → books → community/trust → contact → footer. Section `id`s are the in-page nav anchors; keep them in sync with the `<nav>` links.
- `style.css` — all styling (~1145 lines), mobile-first responsive. Breakpoints at **900px, 768px, 600px**. This one file styles `index.html`; the two policy pages use their own inline styles instead.
- `privacy.html`, `terms.html` — standalone policy pages with **inline `<style>` blocks** (they do not use `style.css`). Linked from the footer.
- `images/` — all assets (logo, hero, signature, book covers, course thumbnail). Course thumbnails for external courses are hot-linked from Udemy CDN in `index.html`, not stored here.

## Local preview

No server needed — open the file directly:

```bash
open index.html          # macOS
start index.html         # Windows
```

## Deployment: the DMI exercise

The README defines the assignment: deploy this site to an **Ubuntu VM running Nginx** and keep it live 24h, accessible at `http://<public-ip>`.

**Mandatory ownership-proof rule:** before deploying, edit the footer in `index.html` (the "Crafted with cloud excellence" line, near the end of `<footer>`) to add a "Deployed by: ..." line. This proof must be visible in the browser screenshot submission. Do not skip this — it is a graded requirement, not decoration.

Typical Nginx deploy:

```bash
sudo apt update && sudo apt install -y nginx
sudo cp -r index.html privacy.html terms.html style.css images/ /var/www/html/
sudo systemctl enable --now nginx
```

## AWS automation layer (in git history, NOT on disk)

Earlier commits contained an AWS deployment stack — a `CLAUDE.md`, Terraform-scaffolding/plan/apply/deploy skills under `.claude/skills/`, and a GitHub Actions workflow (`.github/workflows/deploy.yml`) — targeting **S3 + CloudFront** with GitHub OIDC. These files are currently **deleted from the working tree** (see `git status`); the `terraform/`, `.mcp.json`, and `.claude/agents/` directories they referenced never existed on disk in this checkout.

If asked to work on cloud deployment, first `git restore .` to bring the deleted files back, then note that the workflow hardcodes the **original author's** AWS account ID, S3 bucket (`pravinmishradmi-site-production`), and CloudFront distribution ID (`E3V6O6MRE2E21P`) — these must be re-pointed at the user's own AWS resources before anything will run. Do not treat that stack as live infrastructure.

## Editing conventions

- Content is authored directly in the HTML — edit the markup in place; there is no templating or data file.
- When adding a nav section, update both the desktop `.nav-links` and the `#mobileMenu` block in `index.html`, and add a matching `id` on the target `<section>`.
- Keep responsive changes within the existing 900/768/600 breakpoint structure in `style.css` rather than introducing new breakpoints.
