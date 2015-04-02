/* globals user_pref */

user_pref("browser.newtab.url", "http://localhost/tab/");
// enable file:// link on my homepage
user_pref("capability.policy.policynames", "localfilelinks");
user_pref("capability.policy.localfilelinks.sites", "http://localhost/");
user_pref("capability.policy.localfilelinks.checkloaduri.enabled", "allAccess");


// remove warning when accessing about:config
user_pref("general.warnOnAboutConfig", false);

// disable zoom on cmd + mousewheel
user_pref("mousewheel.with_meta.action", 0);

// Firefox Dev Edition theme
user_pref("lightweightThemes.selectedThemeID", "firefox-devedition@mozilla.org");

// light skin
user_pref("devtools.theme", "light");

// devtools for the chrome & add-ons
user_pref("devtools.chrome.enabled", true);

// remote debugging
user_pref("devtools.debugger.remote-enabled", true);
