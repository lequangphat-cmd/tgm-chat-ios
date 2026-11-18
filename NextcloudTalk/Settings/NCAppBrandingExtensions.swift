//
// SPDX-FileCopyrightText: 2025 Nextcloud GmbH and Nextcloud contributors
// SPDX-License-Identifier: GPL-3.0-or-later
//

import Foundation
import SwiftUI

extension NCAppBranding {

    @objc
    static func elementColorBackground() -> UIColor {
        var lightColor: UIColor
        var darkColor: UIColor

        if #available(iOS 18.0, *) {
            lightColor = NCAppBranding.elementColor().withProminence(.quaternary)
            darkColor = NCAppBranding.elementColor().withProminence(.secondary)
        } else {
            lightColor = NCAppBranding.elementColor().withAlphaComponent(0.1)
            darkColor = NCAppBranding.elementColor().withAlphaComponent(0.2)
        }

        return NCAppBranding.getDynamicColor(lightColor, withDarkMode: darkColor)
    }

    // TGM: the Talk server rejects clients below its minimum version, so the user agent
    // carries the upstream Talk iOS version, not the TGM Chat store version.
    // Bump on every upstream merge.
    static let upstreamTalkVersion = "25.0.2"

    @objc
    static func userAgent() -> String {
        return "Mozilla/5.0 (iOS) Nextcloud-Talk v\(upstreamTalkVersion)"
    }

    @objc
    static func userAgentForLogin() -> String {
        let appDisplayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] ?? "Unknown app"
        let deviceName = UIDevice.current.name

        return "\(deviceName) (\(appDisplayName))"
    }

}

// TGM: hide attachment types that exist only in the mobile app (location, contact), to match the web
let tgmHideAppOnlyAttachments = true
