# TGM Chat for iOS

Branded build of [Nextcloud Talk for iOS](https://github.com/nextcloud/talk-ios) (GPL-3.0-or-later)
for TGM, locked to `https://chat.tgmdental.net`.

## Branches

- `upstream/stable` - unmodified upstream release imports only (currently v25.0.2).
- `main` - upstream + TGM changes. Merge new upstream releases from `upstream/stable`.

## TGM changes

| Area | File |
| --- | --- |
| App name, bundle ID `net.tgmdental.chat`, app group `group.net.tgmdental.chat`, fixed server, single account, push proxy `https://chat.tgmdental.net/tgm-push`, brand colour `#f0c043` | `NextcloudTalk/Settings/NCAppBranding.m` |
| Bundle IDs of app and extensions, version 1.0.0 | `NextcloudTalk.xcodeproj/project.pbxproj` |
| App groups (shared Nextcloud apps group removed) | `*/*.entitlements` |
| Display name, URL name | `NextcloudTalk/Info.plist` |
| Icons and logo (TGM logo) | `NextcloudTalk/AppIcon.icon`, `Images.xcassets/AppIcon.appiconset`, `loginLogo.imageset`, `app-logo-callkit.imageset` |
| Vietnamese translation (upstream has none): strings, plurals, permission texts; `vi` added to project regions | `NextcloudTalk/vi.lproj/*`, `project.pbxproj` |
| API user agent keeps the upstream version (`upstreamTalkVersion`, update on upstream merge) so the Talk server does not answer 426 "app is outdated" | `Settings/NCAppBrandingExtensions.swift`, `ShareExtension/ShareConfirmationViewController.swift` |
| Same features as the web: `tgmHideAppOnlyAttachments` hides location and phone contact attachments | `Settings/NCAppBrandingExtensions.swift`, `Chat/BaseChatViewController.swift` |
| CI build | `.github/workflows/tgm-build.yml` (upstream workflows removed) |

## Still to do

- Web tabs (Danh bạ, Lịch, Tệp tin, Nhiệm vụ) like the Android app.
- Signed archive and TestFlight upload (needs Apple Developer account, App Store Connect API key).
- APNs key on the push proxy (`/tgm-push`).
- `DEVELOPMENT_TEAM` in the project is still the upstream team; set to the TGM/WAM team for signing.
- `privacyURL` in `NCAppBranding.m` still points to nextcloud.com; App Store needs a TGM privacy policy URL.
