/* globals user_pref */

user_pref("browser.newtab.url", "http://putaindecode.io/tab/");

// remove warning when accessing about:config
user_pref("general.warnOnAboutConfig", false);

// disable zoom on cmd + mousewheel
user_pref("mousewheel.with_meta.action", 0);

// Firefox Dev Edition skin
user_pref("browser.devedition.theme.enabled", true);

// light skin
user_pref("devtools.theme", "light");

// devtools for the chrome & add-ons
user_pref("devtools.chrome.enabled", true);

// remote debugging
user_pref("devtools.debugger.remote-enabled", true);
