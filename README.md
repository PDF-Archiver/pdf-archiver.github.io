# pdf-archiver.io

The [PDF Archiver](https://pdf-archiver.io) website, generated with
[Publish](https://github.com/JohnSundell/Publish).

## Local development

```bash
swift run
```

The generated site lands in `Output/`. Serve it from there, for example with
`python3 -m http.server --directory Output`.

## Project structure

| Path | Contents |
| --- | --- |
| `Content/` | Markdown, laid out like the URLs it produces |
| `Resources/` | Copied verbatim into the site root (`assets/`, `css/`) |
| `root-resources/` | Files that must sit unchanged in the site root (`CNAME`, `presskit.zip`, `.well-known/`) |
| `Sources/PDFArchiverWebsite/SiteGenerator.swift` | The publishing pipeline |
| `Sources/PDFArchiverWebsite/PublishingSteps.swift` | Custom pipeline steps |
| `Sources/PDFArchiverWebsite/Localization/` | Languages and their translated strings |
| `Sources/PDFArchiverWebsite/Theme/` | The Plot-based HTML |

## Languages

English lives at the site root, German below `/de`:

| Page | English | German |
| --- | --- | --- |
| Home | `/` | `/de/` |
| FAQ | `/faq` | `/de/faq` |
| Imprint | `/imprint` | `/de/imprint` |
| Privacy | `/privacy` | `/de/privacy` |
| Terms | `/terms` | `/de/terms` |
| Press | `/press` | `/de/press` |

The URL *is* the language: `SiteLanguage(path:)` reads the leading path component, so every page
knows which strings and which `lang` attribute to use. The language switcher in the header links to
the counterpart page, or to that language's home page when a page exists in English only.

Two locations are generated rather than written:

- The home pages (`/` and `/de`) are built entirely from `SiteStrings`; their Markdown files only
  carry title and description.
- `/faq` is a Publish section whose entries live in `Content/faq/`, rendered onto one page. `/de/faq`
  renders the same entries, because the FAQ itself is not translated.

## Adding a page

Add `Content/<name>.md` with a `title` in its front matter, and `Content/de/<name>.md` for the German
version. To link it from the footer, add its path to `footerPaths` in `Theme/SiteChrome.swift`.

## Adding a language

Add a case to `SiteLanguage`, a matching `SiteStrings` value, and a content folder named after the
new language code. Everything else — path mapping, switcher, footer — follows from the enum.

## Deployment

Pushing to `develop` builds the site on GitHub Actions and publishes it to GitHub Pages as a
deployment artifact (`.github/workflows/deploy.yml`). No branch holds the generated HTML.
