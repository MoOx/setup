// duotone colors
var foregroundColor = "#eff0eb";
var backgroundColor = "#1d262f";
var black = backgroundColor;
var slate = "#495f79";
var lightSlate = "#56708f";
var blue = "#7cb5f9";
var green = "#0acd93";
var lightGreen = "#52ffc8";
var gray = "#8ca59d";
var brightBlack = "#8ca59d";
var white = "#f1f1f0";
var lightBlack = "#686868";
var brightWhite = foregroundColor;

// snazzy colors
// var foregroundColor = "#eff0eb";
// var backgroundColor = "#282a36";
var red = "#ff5c57";
var green = "#5af78e";
var yellow = "#f3f99d";
var blue = "#57c7ff";
var magenta = "#ff6ac1";
var cyan = "#9aedfe";

const theme = {
  // default font size in pixels for all tabs
  fontSize: 16,
  // font family with optional fallbacks
  fontFamily: "Operator Mono, monospace",

  // terminal cursor background color (hex)
  cursorColor: lightGreen,
  // color of the text
  foregroundColor,
  // terminal background color
  backgroundColor,
  // border color (window, tabs)
  borderColor: "#171E26",
  // custom css to embed in the main window
  css: "",
  // custom css to embed in the terminal window
  termCSS: "",
  // custom padding (css format, i.e.: `top right bottom left`)
  padding: "1.5rem",
  // some color overrides. see http://bit.ly/29k1iU2 for
  // the full list
  colors: {
    black: backgroundColor,
    red,
    green,
    yellow,
    blue,
    magenta,
    cyan,
    white,
    lightBlack,
    lightRed: red,
    lightGreen: green,
    lightYellow: yellow,
    lightBlue: blue,
    lightMagenta: magenta,
    lightCyan: cyan,
    lightWhite: foregroundColor
  }
};

module.exports = {
  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    // auto links on url
    // https://www.npmjs.com/package/hyperlinks
    "hyperlinks",

    // Open a tab with the same directory as the current tab
    // https://www.npmjs.com/package/hypercwd
    "hypercwd",

    // Icons!
    // https://www.npmjs.com/package/hyper-tab-icons
    "hyper-tab-icons",

    // status line
    // https://www.npmjs.com/package/hyper-statusline
    "hyper-statusline"
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  config: Object.assign(
    {},
    {
      tabIcons: {
        disableColors: true
      },

      workingDirectory: "~/Sync/Development"
    },
    theme
  )
};
