module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/*.rb',
    './app/assets/stylesheets/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    fontFamily: {
      'tsuku': ['TsukuARdGothic-Regular','sans-serif'],
      'yuji': ['Yuji Syuku', 'serif'],
      'kurenaido': ['Zen Kurenaido', 'sans-serif'],
      'mono': ['PT Mono']
    },
    extend: {
      colors: {
        akane: '#b7282e',
        oribe: '#125115',
        syuiro: '#EA5506',
        miru: '#5B622E',
        momosio: '#724938',
        fishizome: '#B28C6E',
        chojizome: '#DDB87E',
        kinari: '#fbfaf5'
      },
    },
  },
  plugins: [require("daisyui")],
  daisyui: {
    themes: [
      {
        cupcake: {
          ...require("daisyui/src/colors/themes")["[data-theme=cupcake]"],
          accent: '#DDB87E',
          "accent-content": '#373C38', // btn-primaryなどの文字の色
          // btn-ghost: "blue",
          // "btn-ghost-content": "syuiro",
          // "neutral": "#EEAF3A",
          // // "base-100": "#", // 全体の背景色
          // "base-content": "#372f38", // 全体の文字の色
        }
      }
    ,"dark"]
  },
}
