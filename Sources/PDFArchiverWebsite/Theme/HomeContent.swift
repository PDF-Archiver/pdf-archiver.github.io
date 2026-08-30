import Plot
import Publish

extension Node where Context == HTML.BodyContext {
    /// The home page, built entirely from the translated strings.
    ///
    /// It alternates dark and light bands: the hero and the "Keep it." payoff sit on deep navy,
    /// the workflow and the supporting sections on paper.
    static func homeContent(in language: SiteLanguage, on site: PDFArchiverWebsite) -> Node {
        let strings = language.strings

        return .group(
            .hero(in: language, on: site),
            .workflow(in: language),
            .keepBand(in: language),
            .promises(strings),
            .trial(strings),
            .platforms(strings),
            .testimonials(strings),
            .help(in: language, on: site)
        )
    }
}

private extension Node where Context == HTML.BodyContext {
    static func hero(in language: SiteLanguage, on site: PDFArchiverWebsite) -> Node {
        let strings = language.strings

        return .section(
            .class("band band-dark hero"),
            .div(
                .class("wrap hero-inner"),
                .h1(.class("hero-title"), .text(strings.heroHeadline)),
                .p(.class("hero-lead"), .text(strings.heroLead)),
                .appStoreButton(strings),
                .p(.class("trust-line"), .text(strings.trustLine)),
                // Mastodon only verifies a profile link if the linked page answers with `rel="me"`.
                .a(
                    .class("verify-link"),
                    .attribute(named: "rel", value: "me"),
                    .href(site.mastodonURL.absoluteString),
                    .text("Mastodon")
                )
            )
        )
    }

    static func workflow(in language: SiteLanguage) -> Node {
        let strings = language.strings

        return .section(
            .class("band band-paper"),
            .id("features"),
            .div(
                .class("wrap steps"),
                .forEach(strings.workflowSteps.indices) { index in
                    let step = strings.workflowSteps[index]
                    let isFindStep = index == strings.workflowSteps.count - 1

                    return .article(
                        .class("step"),
                        .h2(.class("step-title"), .text(step.title)),
                        .p(.class("step-lead"), .text(step.lead)),
                        .forEach(step.body) { .p(.text($0)) },
                        .if(isFindStep, .searchChips(strings.searchChips))
                    )
                }
            )
        )
    }

    /// The payoff: the filename taken apart, then the archive it produces.
    static func keepBand(in language: SiteLanguage) -> Node {
        let strings = language.strings
        let step = strings.keepStep

        return .section(
            .class("band band-dark keep"),
            .div(
                .class("wrap keep-inner"),
                .h2(.class("step-title"), .text(step.title)),
                .p(.class("step-lead"), .text(step.lead)),
                .filenameBreakdown(strings.filenameExample),
                .div(
                    .class("keep-body"),
                    .forEach(step.body) { .p(.text($0)) }
                ),
                .pre(.class("tree"), .code(.text(strings.archiveTree)))
            )
        )
    }

    /// The signature element: the example filename with its three parts named underneath.
    static func filenameBreakdown(_ example: SiteStrings.FilenameExample) -> Node {
        .figure(
            .class("filename"),
            .div(
                .class("filename-line"),
                .filenamePart(value: example.date, label: example.dateLabel, kind: "date"),
                .span(.class("filename-sep"), .text("--")),
                .filenamePart(value: example.description, label: example.descriptionLabel, kind: "desc"),
                .span(.class("filename-sep"), .text("__")),
                .filenamePart(value: example.tags, label: example.tagsLabel, kind: "tags"),
                .span(.class("filename-sep filename-ext"), .text(".pdf"))
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

    static func searchChips(_ chips: [String]) -> Node {
        .ul(
            .class("chips"),
            .forEach(chips) { .li(.code(.text($0))) }
        )
    }

    static func promises(_ strings: SiteStrings) -> Node {
        .section(
            .class("band band-paper"),
            .div(
                .class("wrap"),
                .h2(.class("section-title"), .text(strings.promisesTitle)),
                .ul(
                    .class("promises"),
                    .forEach(strings.promises) { promise in
                        .li(
                            .h3(.text(promise.title)),
                            .p(.text(promise.body))
                        )
                    }
                )
            )
        )
    }

    static func trial(_ strings: SiteStrings) -> Node {
        .section(
            .class("band band-paper"),
            .id("download"),
            .div(
                .class("wrap"),
                .div(
                    .class("trial"),
                    .h2(.class("section-title"), .text(strings.trialTitle)),
                    .p(.class("trial-lead"), .text(strings.trialLead)),
                    .p(.text(strings.trialBody)),
                    .appStoreButton(strings),
                    .p(.class("trial-note"), .text(strings.trialNote))
                )
            )
        )
    }

    static func platforms(_ strings: SiteStrings) -> Node {
        .section(
            .class("band band-paper"),
            .div(
                .class("wrap narrow"),
                .h2(.class("section-title"), .text(strings.platformsTitle)),
                .p(.text(strings.platformsBody))
            )
        )
    }

    static func testimonials(_ strings: SiteStrings) -> Node {
        .section(
            .class("band band-paper"),
            .div(
                .class("wrap"),
                .h2(.class("section-title"), .text(strings.testimonialsTitle)),
                .ul(
                    .class("testimonials"),
                    .forEach(strings.testimonials) { testimonial in
                        .li(
                            .figure(
                                .blockquote(.p(.text(testimonial.statement))),
                                .figcaption(.text(testimonial.source))
                            )
                        )
                    }
                )
            )
        )
    }

    static func help(in language: SiteLanguage, on site: PDFArchiverWebsite) -> Node {
        let strings = language.strings

        return .section(
            .class("band band-dark help"),
            .div(
                .class("wrap narrow"),
                .h2(.class("section-title"), .text(strings.helpTitle)),
                .p(.text(strings.helpBody)),
                .p(.a(
                    .class("button button-ghost"),
                    .href(language.path(for: "faq").absoluteString),
                    .text(strings.helpFAQLink)
                )),
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

    static func appStoreButton(_ strings: SiteStrings) -> Node {
        .p(.a(
            .class("button"),
            .href(strings.appStoreURL),
            .text(strings.downloadButton)
        ))
    }
}
