module.exports = {
  theme: {
    fontFamily: {
      futura: ['Futura', 'sans-serif'],
      georgia: ['Georgia', 'serif'],
    },
    extend: {
      colors: {
        "sky": "#10a3e0"
      },
      spacing: {
        "full": "100%"
      },
      tracking: {
        "extra-wide": "0.17em"
      }
    },
  },
  variants: {},
  plugins: [
    require('tailwindcss-alpha')({
     alpha: {
       '10': 0.1,
       '20': 0.2,
       '30': 0.3,
       '40': 0.4,
       '50': 0.5,
       '60': 0.6,
       '70': 0.7,
       '80': 0.8,
       '90': 0.9,
     }
   })
  ],
}
