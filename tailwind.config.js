module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/*.rb',
    './app/assets/stylesheets/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        // 'カラー名': 'カラーコード'
        'akane': '#b7282e',
        'oribe': '#125115',
        'syuiro': '#EA5506',
      },
    },
  },
  plugins: [require("daisyui")],
  daisyui: {
    themes: [
      {
        mytheme: {
          "primary": "#b7282e",
          "secondary": "#D85251",
          "accent": "#D59B6A",
          "neutral": "#D59B6A",
          "base-100": "#F1F1F1",
          "info": "#42ADBB",
          "success": "#499380",
          "warning": "#E97F14",
          "error": "#DF1A2F",
        },
      },
      "dark"
    ],
  },
}
