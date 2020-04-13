const purgecss = require('@fullhuman/postcss-purgecss')({
  content: [
    './source/**/*.erb',
  ],
  defaultExtractor: content => content.match(/[\w-/:]+(?<!:)/g) || []
})

module.exports = {
  plugins: [
    require('postcss-import'),
    require('tailwindcss'),
    require('autoprefixer'),
    require('postcss-hexrgba'),
    ...process.env.NODE_ENV === 'production'
      ? [purgecss]
      : []
  ]
}
