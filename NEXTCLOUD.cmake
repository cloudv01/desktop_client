# SPDX-FileCopyrightText: 2017 Nextcloud GmbH and Nextcloud contributors
# SPDX-FileCopyrightText: 2012 ownCloud GmbH
# SPDX-License-Identifier: GPL-2.0-or-later

# -------------------------------------------------
# Application identity
# -------------------------------------------------
if(NEXTCLOUD_DEV)
    set( APPLICATION_NAME       "DroptocloudDev" )
    set( APPLICATION_SHORTNAME  "DroptocloudDev" )
    set( APPLICATION_EXECUTABLE "droptoclouddev" )
    set( APPLICATION_ICON_NAME  "Nextcloud" )
else()
    set( APPLICATION_NAME       "Droptocloud" )
    set( APPLICATION_SHORTNAME  "Droptocloud" )
    set( APPLICATION_EXECUTABLE "droptocloud" )
    set( APPLICATION_ICON_NAME  "Nextcloud" )
endif()

set( APPLICATION_CONFIG_NAME "${APPLICATION_EXECUTABLE}" )

# -------------------------------------------------
# Vendor & URLs
# -------------------------------------------------
set( APPLICATION_DOMAIN     "droptocloud.com" )
set( APPLICATION_VENDOR     "Droptocloud" )
set( APPLICATION_UPDATE_URL "" CACHE STRING "URL for updater" )
set( APPLICATION_HELP_URL   "" CACHE STRING "URL for the help menu" )

# -------------------------------------------------
# macOS specific icon (safe even if unused)
# -------------------------------------------------
if(APPLE AND APPLICATION_NAME STREQUAL "Droptocloud"
   AND EXISTS "${CMAKE_SOURCE_DIR}/theme/colored/Nextcloud-macOS-icon.svg")
    set( APPLICATION_ICON_NAME "Nextcloud-macOS" )
endif()

# -------------------------------------------------
# Core identifiers (CRITICAL for side-by-side install)
# -------------------------------------------------
set( APPLICATION_ICON_SET   "SVG" )
set( APPLICATION_SERVER_URL "" CACHE STRING "Pre-filled server URL" )
set( APPLICATION_SERVER_URL_ENFORCE OFF )

set( APPLICATION_REV_DOMAIN "com.droptocloud.desktopclient" )
set( APPLICATION_VIRTUALFILE_SUFFIX "droptocloud" )

set( APPLICATION_OCSP_STAPLING_ENABLED OFF )
set( APPLICATION_FORBID_BAD_SSL OFF )

# -------------------------------------------------
# Linux identifiers
# -------------------------------------------------
set( LINUX_PACKAGE_SHORTNAME "droptocloud" )
set( LINUX_APPLICATION_ID "${APPLICATION_REV_DOMAIN}.${LINUX_PACKAGE_SHORTNAME}")

# -------------------------------------------------
# Theme
# -------------------------------------------------
set( THEME_CLASS "NextcloudTheme" )
set( WIN_SETUP_BITMAP_PATH "${CMAKE_SOURCE_DIR}/admin/win/nsi" )

# -------------------------------------------------
# Installer assets
# -------------------------------------------------
set(
    MAC_INSTALLER_BACKGROUND_FILE
    "${CMAKE_SOURCE_DIR}/admin/osx/installer-background.png"
    CACHE STRING "The MacOS installer background image"
)

# -------------------------------------------------
# Updater & features
# -------------------------------------------------
option( BUILD_UPDATER "Build updater" OFF )
option( WITH_PROVIDERS "Build with providers list" ON )

option( ENFORCE_VIRTUAL_FILES_SYNC_FOLDER OFF )
option( DISABLE_VIRTUAL_FILES_SYNC_FOLDER OFF )
option( ENFORCE_SINGLE_ACCOUNT OFF )
option( DO_NOT_USE_PROXY OFF )
option( WIN_DISABLE_USERNAME_PREFILL OFF )

# -------------------------------------------------
# Theming colors
# -------------------------------------------------
set( NEXTCLOUD_BACKGROUND_COLOR "#0082c9" CACHE STRING "Background color" )
set( APPLICATION_WIZARD_HEADER_BACKGROUND_COLOR ${NEXTCLOUD_BACKGROUND_COLOR} )
set( APPLICATION_WIZARD_HEADER_TITLE_COLOR "#ffffff" )

option(
    APPLICATION_WIZARD_USE_CUSTOM_LOGO
    "Use custom wizard logo"
    ON
)

# -------------------------------------------------
# Windows Shell Extensions & MSI (UNIQUE GUIDs)
# -------------------------------------------------
if(WIN32)
    set( WIN_SHELLEXT_CONTEXT_MENU_GUID      "{9D0D9C62-5A0C-4A1C-9D2A-9B1F4D8F8E11}" )

    set( WIN_SHELLEXT_OVERLAY_GUID_ERROR     "{A1F1A0A5-7C2B-4F35-9F7D-3F2C9C90D3A1}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_OK        "{B2C6B71C-1F02-4A9C-8A6A-6C9D9D1A7B22}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_OK_SHARED "{C3A72E1F-3D6B-4E28-B4E1-94D7A8A1F333}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_SYNC      "{D4B14A1E-0F6A-4D59-8E91-7F9C1A1C4444}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_WARNING   "{E5F0D5A3-3C4E-4F91-9C9B-1E8B2D2E5555}" )

    # MSI Upgrade Code (NO braces)
    set( WIN_MSI_UPGRADE_CODE "A9B83E4F-62D4-4D67-9E77-4C8F5C7D9AAA" )

    option( BUILD_WIN_MSI "Build MSI installer" ON )
    option( BUILD_WIN_TOOLS "Build Win32 migration tools" OFF )
endif()

# -------------------------------------------------
# macOS file provider
# -------------------------------------------------
if (APPLE AND CMAKE_OSX_DEPLOYMENT_TARGET VERSION_GREATER_EQUAL 11.0)
    option( BUILD_FILE_PROVIDER_MODULE OFF )
endif()
