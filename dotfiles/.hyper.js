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

    // Atom like One Dark theme
    // // https://www.npmjs.com/package/hyper-one-dark
    // "hyper-one-dark",
    "hyper-snazzy",

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

  config: {
    tabIcons: {
      disableColors: true
    },

    workingDirectory: "~/Sync/Development",

    // default font size in pixels for all tabs
    fontSize: 16,

    // font family with optional fallbacks
    fontFamily: "Operator Mono, monospace",

    // terminal cursor background color (hex)
    cursorColor: "#F81CE5",

    // color of the text
    foregroundColor: "#fff",

    // terminal background color
    backgroundColor: "rgba(0,0,0, 0.1)",

    // border color (window, tabs)
    borderColor: "#333",

    // custom css to embed in the main window
    css: "",

    // custom css to embed in the terminal window
    termCSS: "",

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: "1.5rem",

    // some color overrides. see http://bit.ly/29k1iU2 for
    // the full list
    colors: [
      "#000000",
      "#ff0000",
      "#33ff00",
      "#ffff00",
      "#0066ff",
      "#cc00ff",
      "#00ffff",
      "#d0d0d0",
      "#808080",
      "#ff0000",
      "#33ff00",
      "#ffff00",
      "#0066ff",
      "#cc00ff",
      "#00ffff",
      "#ffffff"
    ]
  }
};
