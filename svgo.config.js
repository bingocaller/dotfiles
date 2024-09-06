module.exports = {
    floatPrecision: '2',
    gzip: true,
    multipass: true,
    plugins: [
        {
            // https://svgo.dev/docs/preset-default
            name: 'preset-default',
            params: {
                overrides: {
                    // We want to keep the `viewBox` attribute in favour of
                    // dimensions (`width` and `height`).
                    // https://svgo.dev/docs/plugins/remove-viewbox
                    removeViewBox: false,
                },
            },
        },
        // https://svgo.dev/docs/plugins/remove-dimensions
        'removeDimensions',
        // https://svgo.dev/docs/plugins/cleanup-list-of-values
        'cleanupListOfValues',
        // https://svgo.dev/docs/plugins/convert-style-to-attrs
        'convertStyleToAttrs',
        // https://svgo.dev/docs/plugins/remove-raster-images
        // 'removeRasterImages',
        // https://svgo.dev/docs/plugins/remove-scripts
        'removeScriptElement',
        // https://svgo.dev/docs/plugins/remove-style-element
        'removeStyleElement',
        // https://svgo.dev/docs/plugins/reuse-paths
        'reusePaths',
        {
            name: "removeAttributesBySelector",
            params: {
                selectors: [{
                    selector: 'svg',
                    attributes: [
                        'xml.space',
                        // 'xmlns.xlink',
                    ],
                }],
            }
        },
    ],
};
