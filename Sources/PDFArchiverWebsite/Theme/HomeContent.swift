import Plot
import Publish

extension Node where Context == HTML.BodyContext {
    /// The home page, built entirely from the translated strings.
    ///
    /// Light throughout, with "Keep it." as the single dark card. The filename opens the page as
    /// a self-typing artifact and closes it at rest, and its own `--` / `__` grammar doubles as
    /// the section dividers in between.
    static func homeContent(in language: SiteLanguage, on site: PDFArchiverWebsite) -> Node {
        let strings = language.strings

        return .group(
            .hero(in: language, on: site),
            .grammarRule(),
            .workflow(strings),
            .spotlight(strings),
            .grammarRule(),
            .keepCard(strings),
            .promises(strings),
            .testimonials(strings),
            .trial(strings),
            .help(in: language, on: site)
        )
    }
}

private extension Node where Context == HTML.BodyContext {
    static func hero(in language: SiteLanguage, on site: PDFArchiverWebsite) -> Node {
        let strings = language.strings

        return .section(
            .class("hero"),
            .div(
                .class("wrap"),
                .div(
                    .class("hero-copy"),
                    .span(.class("eyebrow"), .text(strings.heroEyebrow)),
                    .h1(
                        .class("hero-title"),
                        .text("\(strings.heroTitleLead) "),
                        .span(.class("accent"), .text(strings.heroTitleAccent))
                    ),
                    .p(.class("hero-lead"), .text(strings.heroLead)),
                    .div(
                        .class("hero-cta-row"),
                        .a(.class("button"), .href(strings.appStoreURL), .text(strings.downloadButton)),
                        .a(.class("button button-ghost"), .href("#features"), .text(strings.heroSecondaryCTA))
                    ),
                    .p(.class("trust-line"), .text(strings.trustLine)),
                    // Mastodon only verifies a profile link if the linked page answers with `rel="me"`.
                    .a(
                        .class("verify-link"),
                        .attribute(named: "rel", value: "me"),
                        .href(site.mastodonURL.absoluteString),
                        .text("Mastodon")
                    )
                ),
                .div(
                    .class("sig-card"),
                    .div(
                        .class("sig-line-wrap"),
                        .style("--sig-chars: \(strings.filenameExample.characterCount)"),
                        .span(.class("sig-reveal"), .signatureLine(strings.filenameExample))
                    )
                )
            )
        )
    }

    /// The hero's filename. Same structure as the one in "Keep it.", but typed out on load.
    static func signatureLine(_ example: SiteStrings.FilenameExample) -> Node {
        .span(
            .class("sig-line"),
            .signaturePart(value: example.date, label: example.dateLabel, kind: "date"),
            .span(.class("sig-sep"), .text("--")),
            .signaturePart(value: example.description, label: example.descriptionLabel, kind: "desc"),
            .span(.class("sig-sep"), .text("__")),
            .signaturePart(value: example.tags, label: example.tagsLabel, kind: "tags"),
            .span(.class("sig-sep sig-ext"), .text(".pdf"))
        )
    }

    static func signaturePart(value: String, label: String, kind: String) -> Node {
        .span(
            .class("sig-part sig-\(kind)"),
            .span(.class("sig-value"), .text(value)),
            .span(.class("sig-label"), .text(label))
        )
    }

    static func grammarRule() -> Node {
        .hr(.class("divider wrap"))
    }

    static func workflow(_ strings: SiteStrings) -> Node {
        .section(
            .class("features-wrap"),
            .id("features"),
            .div(
                .class("wrap"),
                .h2(.class("section-title"), .text(strings.workflowTitle)),
                .p(.class("section-lead"), .text(strings.workflowLead)),
                .div(
                    .class("feature-cards"),
                    .forEach(strings.steps.indices) { index in
                        let step = strings.steps[index]
                        let isFindStep = index == strings.steps.count - 1

                        return .article(
                            .class("feature-card"),
                            .div(.class("feature-card-tag"), .text(step.tag)),
                            .h3(.text(step.title)),
                            .p(.class("feature-lead"), .text(step.lead)),
                            .p(.text(step.body)),
                            .if(isFindStep, .searchChips(strings.searchChips))
                        )
                    }
                )
            )
        )
    }

    static func searchChips(_ chips: [String]) -> Node {
        .div(
            .class("chips"),
            .forEach(chips) { .code(.text($0)) }
        )
    }

    static func spotlight(_ strings: SiteStrings) -> Node {
        .section(
            .class("spotlight-wrap"),
            .div(
                .class("wrap"),
                .div(
                    .class("spotlight"),
                    .div(
                        .class("spotlight-copy"),
                        .h3(.class("spotlight-title"), .text(strings.spotlightTitle)),
                        .forEach(strings.spotlightBody) { .p(.text($0)) }
                    ),
                    .div(
                        .class("device-row"),
                        .forEach(strings.spotlightShots) { shot in
                            .img(
                                .class("device-shot device-\(shot.device)"),
                                .src(shot.path),
                                .alt(shot.alt),
                                .attribute(named: "loading", value: "lazy"),
                                .attribute(named: "decoding", value: "async")
                            )
                        }
                    )
                )
            )
        )
    }


    static func keepCard(_ strings: SiteStrings) -> Node {
        .section(
            .class("keep-wrap"),
            .div(
                .class("wrap"),
                .div(
                    .class("keep-card"),
                    .h2(.class("section-title"), .text(strings.keepTitle)),
                    .p(.class("keep-lead"), .text(strings.keepLead)),
                    .filenameFigure(strings.filenameExample),
                    .div(
                        .class("keep-body"),
                        .forEach(strings.keepBody) { .p(.text($0)) }
                    ),
                    .pre(.class("tree"), .code(.text(strings.archiveTree)))
                )
            )
        )
    }

    static func filenameFigure(_ example: SiteStrings.FilenameExample) -> Node {
        .figure(
            .class("filename"),
            .div(
                .class("filename-line"),
                .filenamePart(value: example.date, label: example.dateLabel, kind: "date"),
                .span(.class("filename-sep"), .text("--")),
                .filenamePart(value: example.description, label: example.descriptionLabel, kind: "desc"),
                .span(.class("filename-sep"), .text("__")),
                .filenamePart(value: example.tags, label: example.tagsLabel, kind: "tags"),
                .span(.class("filename-sep"), .text(".pdf"))
            )
        )
    }

    static func filenamePart(value: String, label: String, kind: String) -> Node {
        .span(
            .class("filename-part part-\(kind)"),
            .span(.class("filename-value"), .text(value)),
            .span(.class("filename-label"), .text(label))
        )
    }

    static func promises(_ strings: SiteStrings) -> Node {
        .section(
            .class("promises-wrap"),
            .div(
                .class("wrap"),
                .h2(.class("section-title"), .text(strings.promisesTitle)),
                .ul(
                    .class("promises"),
                    .forEach(strings.promises) { promise in
                        .li(
                            .class("promise-item"),
                            .div(.class("promise-icon"), .attribute(named: "aria-hidden", value: "true"), .text("✓")),
                            .div(
                                .h3(.text(promise.title)),
                                .p(.text(promise.body))
                            )
                        )
                    }
                )
            )
        )
    }


    static func testimonials(_ strings: SiteStrings) -> Node {
        .section(
            .class("testimonials-wrap"),
            .div(
                .class("wrap"),
                .h2(.class("section-title"), .text(strings.testimonialsTitle)),
                .ul(
                    .class("testimonials"),
                    .forEach(strings.testimonials) { testimonial in
                        .li(.figure(
                            .div(
                                .class("t-head"),
                                .span(.class("avatar"), .attribute(named: "aria-hidden", value: "true"),
                                      .text(testimonial.initials))
                            ),
                            .blockquote(.p(.text(testimonial.statement))),
                            .figcaption(.text(testimonial.source))
                        ))
                    }
                )
            )
        )
    }

    static func trial(_ strings: SiteStrings) -> Node {
        .section(
            .class("trial-wrap"),
            .id("download"),
            .div(
                .class("wrap narrow"),
                .div(
                    .class("trial"),
                    .h2(.class("section-title"), .text(strings.trialTitle)),
                    .p(.text(strings.trialBody)),
                    .a(
                        .class("badge-appstore"),
                        .href(strings.appStoreURL),
                        .img(.src("/assets/img/appstore-badge.svg"), .alt(strings.downloadButton))
                    )
                )
            )
        )
    }

    static func help(in language: SiteLanguage, on site: PDFArchiverWebsite) -> Node {
        let strings = language.strings

        return .section(
            .class("help-wrap"),
            .div(
                .class("wrap narrow"),
                .h2(.class("section-title"), .text(strings.helpTitle)),
                .p(.class("section-lead"), .text(strings.helpBody)),
                .p(
                    .class("help-cta"),
                    .a(
                        .class("button button-ghost"),
                        .href(language.path(for: "faq").directoryPath),
                        .text(strings.helpFAQLink)
                    )
                ),
                .p(.class("help-fallback"), .text(strings.helpFallback)),
                .ul(
                    .class("help-links"),
                    .li(.a(.href(site.mastodonURL.absoluteString), .text("Mastodon"))),
                    .li(.a(.href("mailto:\(site.supportEmail)"), .text(site.supportEmail))),
                    .li(.a(.href(site.githubURL.absoluteString), .text("GitHub")))
                )
            )
        )
    }
}
