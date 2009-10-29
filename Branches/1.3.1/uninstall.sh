#!/bin/sh

echo "Uninstalling Safari Cookies..."
rm -r "/Library/Application Support/SIMBL/Plugins/Safari Cookies.bundle"
rm -rf "$HOME/Library/Application Support/Safari Cookies"
rm -r "$HOME/Library/Preferences/com.sweetpproductions.SafariCookies.plist"

defaults delete com.apple.Safari SCremoveNonFavoritesWhenQuitting
defaults delete com.apple.Safari SCautomaticUpdating
defaults delete com.apple.Safari SCcookieAcceptPolicy
defaults delete com.apple.Safari SCtabState
defaults delete com.apple.Safari SCdontShowRemoveAllAlert
defaults delete com.apple.Safari SCdontShowExportAlert
defaults delete com.apple.Safari SCdontShowImportAlert
defaults delete com.apple.Safari SCdontShowImportFromBookmarksAlert
defaults delete com.apple.Safari SCdontShowImportFromTopSitesAlert
defaults delete com.apple.Safari SCdontShowImportFromHistoryAlert
defaults delete com.apple.Safari SCautomaticMode
defaults delete com.apple.Safari SCremoveFlashCookiesWhenQuitting
defaults delete com.apple.Safari SCremoveGoogleAnalyticsCookiesWhenQuitting