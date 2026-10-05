# poppicu website

Personal website for https://poppicu.github.io/zola/ on branch `poppicu-website`.
The Zola generator source remains at the repository root; the website lives here.

Theme: https://github.com/poppicu/tabi_personal, pinned as `themes/tabi`.
Structure and configuration inspired by https://github.com/welpo/tabi-start at
commit 285d3f9de8a2e656040f9e35d1b1f252c26962d5. Posts are starter content written
for this site. Replace `static/img/profile.webp` with your own image when ready.

## Develop

Use Zola **0.19.2**: this theme uses Tera 1 and the older feed context.
The current Zola source at the repository root is incompatible with this theme.

From the repository root:

```sh
git submodule update --init --recursive
sh website/scripts/install-zola.sh website/.tools
website/.tools/zola --root website build
website/.tools/zola --root website serve --port 1112
```

The installer supports Linux x86_64. On another platform, install Zola 0.19.2
from the official releases. The generated `public/` and local `.tools/` are ignored.
Edit `content/` for posts, `config.toml` for navigation and settings, and
`content/_index.md` for the introduction. Theme updates require a compatibility check.

## GitHub Pages

1. Push the `poppicu-website` branch.
2. In repository Settings → Pages, choose **GitHub Actions** as the source.
3. If the `github-pages` environment restricts deployment branches, allow
   `poppicu-website` in Settings → Environments → github-pages.
4. Run **Publish poppicu website** from Actions on `poppicu-website`, or push a
   website change. The workflow installs pinned Zola, builds `website/`, uploads
   the Pages artifact, and deploys it.

The workflow publishes only from `poppicu-website`; it does not publish Zola's
documentation. Publishing replaces the repository's existing Pages site, if any.
No personal access token or custom domain is needed for this workflow.
