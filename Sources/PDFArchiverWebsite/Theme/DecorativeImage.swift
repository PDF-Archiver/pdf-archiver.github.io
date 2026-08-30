import Plot

extension Attribute where Context == HTML.ImageContext {
    /// Marks an image as decorative for screen readers. `.alt("")` cannot be used for this:
    /// Plot drops attributes whose value is empty, which would leave the image without an `alt`.
    static var decorative: Attribute {
        Attribute(name: "alt", value: "", ignoreIfValueIsEmpty: false)
    }
}
