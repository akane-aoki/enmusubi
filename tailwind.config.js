module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/*.rb',
    './app/assets/stylesheets/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    fontFamily: {
      'tsuku': ['TsukuARdGothic-Regular','sans-serif']
    },
    extend: {
      colors: {
        akane: '#b7282e',
        oribe: '#125115',
        syuiro: '#EA5506'
      },
    },
  },
  plugins: [require("daisyui")],
  daisyui: {
    themes: ["cupcake"
      // {
        // cupcake: {
          // ...require("daisyui/src/colors/themes")["[data-theme=cupcake]"],
          // btn-ghost: "blue",
          // "btn-ghost-content": "syuiro",
          // primary: "#EEAF3A",
      //     // "primary-content": "#ffffff", // btn-primaryなどの文字の色
      //     // "neutral": "#EEAF3A",
      //     // // "base-100": "#", // 全体の背景色
      //     // "base-content": "#372f38", // 全体の文字の色
        // },
      // },
    ,"dark"],
  },
}
