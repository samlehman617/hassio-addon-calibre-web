# Calibre-Web Hass.io Addon
[![Build Status](https://travis-ci.org/samlehman617/calibre-web-hassio-addon.svg?branch=master)](https://travis-ci.org/samlehman617/calibre-web-hassio-addon)[![](https://images.microbadger.com/badges/version/samlehman617/armhf-calibreweb.svg)](https://microbadger.com/images/samlehman617/armhf-calibreweb "Get your own version badge on microbadger.com")

## Description

Read your eBooks from anywhere! This addon provides a web interface: [calibre-web](https://github.com/janeczku/calibre-web) for your Calibre eBook library. Packaged as a Docker container for using with Hass.io. 

## Configuration

No configuration is needed to get started; simply install and run to get going! For documentation on additional configuration, follow the [Quick Start Guide](https://github.com/janeczku/calibre-web#quick-start) from calibreweb. 

Upon first boot, you will need to:

- Retrieve a database file. You can obtain this by installing the Calibre desktop client and right-clicking the library icon, then clicking 'Export/import all calibre data', and saving the metadata.db file. Put this file in the directory where you want to store your library.
- Set the path to the database in Calibre-Web by using the UI to go to `Settings->Basic Configuration` and point it to your calibre database: (i.e. `/share` or `/share/books`). 
- Login with the default username and password: (Username: admin, Password: admin123). Please be sure to change the default if you plan on exposing your instance outside your local network.


## Credits

This project is a fork of the hass.io addon originally created by [bestlibre](https://github.com/bestlibre/hassio-addons/tree/master/calibreweb). All credit should go to GitHub user [bestlibre](https://github.com/bestlibre).

Here is what I have done to extend the [original project](https://github.com/bestlibre/hassio-addons/tree/master/calibreweb):

- Added the ability to use hass.io's ingress functionality. This will allow you to use the Calibre-Web interface from within the Home Assistant UI without having to open up any new ports, manually enable SSL, or require additional configuration.
- Included most of the optional features documented in the [calibre-web](https://github.com/janeczku/calibre-web) repository. This opens up the ability to: 
  - Retrieve author information and additional metadata using the GoodReads API.
  - Sync, update, and store your library using Google Drive.
  - Authenticate with LDAP.
  - Authenticate with Google or GitHub OAuth for sign-in/registration.
  - Automatically extract metadata from uploaded books.
- Allowed reading the /ssl directory to provide HTTPS encryption using the certs in the default location for Home Assistant.
- Added automatic metadata extraction (*WIP*)
- Added services that Home Assistant can call to manage your library. (*WIP*)
- Added [calibre-web](https://github.com/janeczku/calibre-web)'s icon to the repository so it shows up nicely in the hass.io addon pages.
- Spruced up the original addon documentation.

## Forewarning

Consider this project to be experimental, at least for the time being. If you need reliability, please opt to use the [original addon](https://github.com/bestlibre/hassio-addons/tree/master/calibreweb). I am not responsible for lost, stolen, or corrupted data.

## To-Do

[x] Update documentation.
[x] Add the Calibre-Web icon to the hass.io addon.
[ ] Add this project as git submodule in my hassio-addons repository for distribution.
[ ] Add a 'download book' Home Assistant service.
[ ] Add a 'upload book' Home Assistant service.
[ ] Add a 'convert book' Home Assistant service.
[ ] Add a 'send book to TTS service' Home Assistant service.
[ ] Allow configuring as much as possible from within the Hass.io Supervisor and populating the webapp configuration with this information.
[ ] Allow submitting a robots.txt file to manage web crawlers parsing your public library.


## Upstream plans

If I can implement all of the features detailed above, I plan on contributing to the [upstream repository](https://github.com/janeczku/calibre-web) in the following ways: 

[ ] Convert existing webapp into an installable PWA.
[ ] Add browser push notifications for certain events (e.g. new books uploaded, new user registered)
[ ] Automatically upload, convert, and grab metadata for new books in certain directory.
[ ] Create a more minimalist dark theme.
[ ] Create a more minimalist light theme.
[ ] Support automatically toggling between light/dark themes. (based on one of: time-of-day, sunrise/sunset, or upon API call.)

If you have functionality you would like implemented, feel free to drop suggestions.
