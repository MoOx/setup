/* globals user_pref */

// Fx 41+ doesn't handle this value anymore
//user_pref("browser.newtab.url", "http://localhost/tab/");
// use https://addons.mozilla.org/en-US/firefox/addon/new-tab-override/ instead

// enable file:// link on my homepage
user_pref("capability.policy.policynames", "localfilelinks");
user_pref("capability.policy.localfilelinks.sites", "http://localhost/");
user_pref("capability.policy.localfilelinks.checkloaduri.enabled", "allAccess");

// remove warning when accessing about:config
user_pref("general.warnOnAboutConfig", false);

// disable zoom on cmd + mousewheel
user_pref("mousewheel.with_meta.action", 0);

// Firefox Dev Edition theme
// user_pref("lightweightThemes.selectedThemeID", "firefox-devedition@mozilla.org");

// Allow unsigned add-ons
user_pref("xpinstall.signatures.required", false);


// Dev Tools //

// light skin
user_pref("devtools.theme", "light");

// enable for the chrome & add-ons
user_pref("devtools.chrome.enabled", true);

user_pref("devtools.debugger.remote-enabled", true);
user_pref("devtools.debugger.workers", true);
