# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

The [pdf-archiver.io](https://pdf-archiver.io) website: a Swift package that generates static HTML
with [Publish](https://github.com/JohnSundell/Publish) and Plot. `README.md` documents the project
for contributors — the paths, the language layout, and how to add a page or a language. This file
adds what is not written there.

## Commands

```bash
swift run                                   # build the generator and write the site to Output/
swift build                                 # compile only
python3 -m http.server --directory Output   # serve the generated site
```

There are no tests and no linter. Verification is `swift run` finishing green plus reading the files
it wrote to `Output/`. Every asset is linked absolutely (`/css/styles.css`), so opening
`Output/index.html` over `file://` renders unstyled — serve the folder instead.

`Output/` and `.publish/` are generated and git-ignored; never edit anything below them.

## Pipeline

`SiteGenerator.swift` lists the publishing steps, and their **order is the architecture** — each
custom step in `PublishingSteps.swift` repairs something Publish does that this site cannot use:

- `.buildPressKitArchive()` zips `presskit/` into `presskit.zip` at publish time, so the archive is
  never versioned.
- `.moveGermanIndexPageToLanguageRoot()` turns `Content/de/index.md` into `/de` rather than
  `/de/index`.
- `.removeFAQEntryPages()` deletes the per-question pages after HTML generation — the entries only
  ever appear collected on `/faq` and `/de/faq`.
- `.generateCanonicalSiteMap(excluding:)` replaces Publish's site map, which omits the home pages
  and spells URLs without their trailing slash.
- `.moveNotFoundPageToRoot()` writes `/404.html`, the only error page GitHub Pages serves.

## Invariants worth knowing before changing anything

- **The URL is the language.** `SiteLanguage(path:)` reads the leading path component, so a page's
  language, strings and `lang` attribute all follow from where its file sits. Nothing carries the
  language in front matter.
- **Every internal link ends in a slash.** GitHub Pages 301-redirects `/faq` to `/faq/`, so
  `Path.directoryPath` and `canonicalURL(for:)` in `CanonicalPaths.swift` exist to keep the
  canonical tag, the `hreflang` links and the site map pointing at the page instead of a redirect.
  Use them for anything URL-shaped; `url(for:)` alone is one redirect off.
- **The home pages have no Markdown body.** `/` and `/de` are built from `SiteStrings`; their
  Markdown files carry only `title` and `description`. Copy changes on the home page happen in
  `Localization/SiteStrings+English.swift` and `+German.swift`, which must stay structurally
  identical — `SiteStrings` has no optional members.
- **FAQ entries are ordered by file name.** `Content/faq/NN-slug.md`, sorted by path; the number is
  the running order on the page. `/de/faq` renders the same English entries, because the FAQ itself
  is not translated.
- **`Resources/` is copied verbatim into the site root; `root-resources/` holds files that must sit
  unchanged at the root** (`CNAME`, `robots.txt`, `.well-known/`). Folder traversal skips dotted
  folders, so `apple-app-site-association` is copied by name in a separate step, and the Pages
  workflow needs `include-hidden-files: true` — universal links break silently otherwise.
- **The head is hand-assembled** in `Theme/DocumentHead.swift`: the full favicon set, `hreflang`
  pairs, and JSON-LD that is emitted on the home pages only. `Website.favicon` and
  `tagHTMLConfig` are deliberately `nil` so Publish adds nothing of its own.

## Front end

`Resources/css/styles.css` is the whole stylesheet, token-driven (`--font-heading`, `--font-body`,
`--font-mono`, the colour tokens) with a `prefers-color-scheme` block that only redefines tokens.
Headings are set in Charter, self-hosted from `Resources/assets/fonts/` under the Bitstream licence
that ships beside it as `charter-license.txt`. The other font files in that folder are leftovers of
the previous site and are referenced by nothing.

## Conventions

Base branch `develop`; branches are named `feature/…`. Pushing to `develop` builds on GitHub Actions
and publishes the Pages artifact — no branch holds the generated HTML. Pull requests build too, so a
broken generator surfaces before the merge.
