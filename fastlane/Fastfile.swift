// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
//     https://docs.fastlane.tools/actions
//

import Foundation

class Fastfile: LaneFile {
    func betaLane() {
        desc("Push a new beta build to TestFlight")

        guard let appStoreConnectKey = ProcessInfo.processInfo.environment["APP_STORE_CONNECT_KEY"] else {
            fatalError("Failed to find environment variable APP_STORE_CONNECT_KEY")
        }

        appStoreConnectApiKey(keyId: "4AZFT748Q5",
                              issuerId: "a9a4951e-e867-4485-ab82-ea0601249137",
                              keyContent: appStoreConnectKey, isKeyContentBase64: false, inHouse: false)

        let projectFile = "Rove.xcodeproj"
        let target = "Rove"
        let username = "theshopcbg@gmail.com"
        let identifier = "com.rove.app"
        let version = getVersionNumber(xcodeproj: projectFile, target: target)
        let buildNumber = latestTestflightBuildNumber(live: false, appIdentifier: identifier,
                                                            username: username,
                                                            version: version,
                                                            initialBuildNumber: 0) + 1

        automaticCodeSigning(path: projectFile, useAutomaticSigning: false, teamId: "3U5XRWGSB9",
                             targets: [target], codeSignIdentity: "iPhone Distribution: Ana Duque (3U5XRWGSB9)",
                             profileName: "Rove Distribution", bundleIdentifier: identifier)

        incrementBuildNumber(buildNumber: buildNumber)

        buildApp(scheme: "Rove")

        automaticCodeSigning(path: projectFile, useAutomaticSigning: false, teamId: "$(inherited)",
                             targets: [target], codeSignIdentity: "Apple Development", profileName: "")
        automaticCodeSigning(path: projectFile, useAutomaticSigning: true)

        uploadToTestflight(username: username, skipWaitingForBuildProcessing: true)

        let tag = "beta/\(version)/\(buildNumber)"
        addGitTag(tag: tag, force: true, sign: false)
        pushGitTags(force: false, tag: tag)
    }
}
