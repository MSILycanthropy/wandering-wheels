module.exports = {
  mode: "jit",
  content: [
    "./app/views/**/*.html.haml",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
    "./app/components/**/*.rb",
  ],
  plugins: [require("daisyui")],
}
