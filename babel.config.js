module.exports = {
  presets: ["module:metro-react-native-babel-preset"],
  plugins: [
    [
      "module-resolver",
      {
        alias: {
            "react-native-TabBarIOS": "./js/index.js"
        },
        cwd: "babelrc"
      }
    ]
  ]
}
