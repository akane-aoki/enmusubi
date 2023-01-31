module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [require("daisyui")],
  daisyui: {
    themes: [
      {
        mytheme: {
          "primary": "#8C0327",
          "secondary": "#D85251",
          "accent": "#D59B6A",
          "neutral": "#826A5C",
          "base-100": "#F1F1F1",
          "info": "#42ADBB",
          "success": "#499380",
          "warning": "#E97F14",
          "error": "#DF1A2F",
        },
      },
      "dark",
      "cupcake",
    ],
  },
}
