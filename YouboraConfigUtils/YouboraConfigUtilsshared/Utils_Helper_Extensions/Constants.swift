//
//  Constants.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation
#if os(iOS) || os(watchOS) || os(tvOS)
import UIKit
#elseif os(OSX)
import Cocoa
#endif

enum OptionType: Int {
    case string = 0
    case bool = 1
    case number = 2
    case unknown = 3
}

struct Option {
    let name: String
    let type: OptionType
}

struct Constants {
    static let youborasettings = "youborasettings"
    static let settingsNavTitle = "Youbora Settings"
    static let defaultCellId = "defaultCellId"
    static let boolCellId = "cellBoolIdentifier"
    static let stringCellId = "cellStringIdentifier"
    static let numberCellId = "cellNumberIdentifier"
    static let unknownCellId = "cellUnknownIdentifier"
    #if os(iOS) || os(watchOS) || os(tvOS)
    static let propCellHighlighted = UIColor(red: 116/255, green: 0/255, blue: 124/255, alpha: 1)
    #elseif os(OSX)
    static let propCellHighlighted = NSColor(red: 116/255, green: 0/255, blue: 124/255, alpha: 1)
    #endif
    static let numberOfColumnsInMacOS = 3
    static let spaceBetweenItemsInMacOS = 7
    static let maxItemHeightInMacOS = 200
}

extension Constants {
    static let options: [Option] = [
        Option(name: "enabled", type: .bool),
        Option(name: "httpSecure", type: .bool),
        Option(name: "host", type: .string),
        Option(name: "accountCode", type: .string),
        Option(name: "username", type: .string),
        Option(name: "userType", type: .string),
        Option(name: "userEmail", type: .string),
        Option(name: "parseHls", type: .bool),
        Option(name: "parseLocationHeader", type: .bool),
        Option(name: "parseCdnNameHeader", type: .string),
        Option(name: "parseCdnNode", type: .bool),
        Option(name: "parseCdnNodeList", type: .unknown),
        Option(name: "experimentIds", type: .unknown),
        Option(name: "networkIP", type: .string),
        Option(name: "networkIsp", type: .string),
        Option(name: "networkConnectionType", type: .string),
        Option(name: "userObfuscateIp", type: .unknown),
        Option(name: "deviceCode", type: .string),
        Option(name: "forceInit", type: .bool),
        Option(name: "deviceModel", type: .string),
        Option(name: "deviceBrand", type: .string),
        Option(name: "deviceType", type: .string),
        Option(name: "deviceName", type: .string),
        Option(name: "deviceOsName", type: .string),
        Option(name: "deviceOsVersion", type: .string),
        Option(name: "deviceIsAnonymous", type: .bool),
        Option(name: "contentResource", type: .string),
        Option(name: "contentIsLive", type: .unknown),
        Option(name: "contentTitle", type: .string),
        Option(name: "program", type: .string),
        Option(name: "contentDuration", type: .number),
        Option(name: "contentTransactionCode", type: .string),
        Option(name: "contentBitrate", type: .number),
        Option(name: "contentStreamingProtocol", type: .string),
        Option(name: "contentThroughput", type: .number),
        Option(name: "contentRendition", type: .string),
        Option(name: "contentCdn", type: .string),
        Option(name: "contentFps", type: .number),
        Option(name: "contentMetadata", type: .unknown),
        Option(name: "contentMetrics", type: .unknown),
        Option(name: "sessionMetrics", type: .unknown),
        Option(name: "contentIsLiveNoSeek", type: .bool),
        Option(name: "contentPackage", type: .string),
        Option(name: "contentSaga", type: .string),
        Option(name: "contentTvShow", type: .string),
        Option(name: "contentSeason", type: .string),
        Option(name: "contentEpisodeTitle", type: .string),
        Option(name: "contentChannel", type: .string),
        Option(name: "contentId", type: .string),
        Option(name: "contentImdbId", type: .string),
        Option(name: "contentGracenoteId", type: .string),
        Option(name: "contentType", type: .string),
        Option(name: "contentGenre", type: .string),
        Option(name: "contentLanguage", type: .string),
        Option(name: "contentSubtitles", type: .string),
        Option(name: "contentContractedResolution", type: .string),
        Option(name: "contentCost", type: .string),
        Option(name: "contentPrice", type: .string),
        Option(name: "contentPlaybackType", type: .string),
        Option(name: "contentDrm", type: .string),
        Option(name: "contentEncodingVideoCodec", type: .string),
        Option(name: "contentEncodingAudioCodec", type: .string),
        Option(name: "contentEncodingCodecSettings", type: .unknown),
        Option(name: "contentEncodingCodecProfile", type: .string),
        Option(name: "contentEncodingContainerFormat", type: .string),
        Option(name: "adMetadata", type: .unknown),
        Option(name: "adsAfterStop", type: .number),
        Option(name: "adCampaign", type: .string),
        Option(name: "adTitle", type: .string),
        Option(name: "adResource", type: .string),
        Option(name: "adGivenBreaks", type: .number),
        Option(name: "adExpectedBreaks", type: .number),
        Option(name: "adExpectedPattern", type: .unknown),
        Option(name: "adBreaksTime", type: .unknown),
        Option(name: "adGivenAds", type: .number),
        Option(name: "adCreativeId", type: .string),
        Option(name: "adProvider", type: .string),
        Option(name: "autoDetectBackground", type: .bool),
        Option(name: "offline", type: .bool),
        Option(name: "anonymousUser", type: .string),
        Option(name: "isInfinity", type: .bool),
        Option(name: "smartswitchConfigCode", type: .string),
        Option(name: "smartswitchGroupCode", type: .string),
        Option(name: "smartswitchContractCode", type: .string),
        //Deprecated
//        Option(name: "extraparam1", type: .string),
//        Option(name: "extraparam2", type: .string),
//        Option(name: "extraparam3", type: .string),
//        Option(name: "extraparam4", type: .string),
//        Option(name: "extraparam5", type: .string),
//        Option(name: "extraparam6", type: .string),
//        Option(name: "extraparam7", type: .string),
//        Option(name: "extraparam8", type: .string),
//        Option(name: "extraparam9", type: .string),
//        Option(name: "extraparam10", type: .string),
//        Option(name: "extraparam11", type: .string),
//        Option(name: "extraparam12", type: .string),
//        Option(name: "extraparam13", type: .string),
//        Option(name: "extraparam14", type: .string),
//        Option(name: "extraparam15", type: .string),
//        Option(name: "extraparam16", type: .string),
//        Option(name: "extraparam17", type: .string),
//        Option(name: "extraparam18", type: .string),
//        Option(name: "extraparam19", type: .string),
//        Option(name: "extraparam20", type: .string),
//        Option(name: "customDimension1", type: .string),
//        Option(name: "customDimension2", type: .string),
//        Option(name: "customDimension3", type: .string),
//        Option(name: "customDimension4", type: .string),
//        Option(name: "customDimension5", type: .string),
//        Option(name: "customDimension6", type: .string),
//        Option(name: "customDimension7", type: .string),
//        Option(name: "customDimension8", type: .string),
//        Option(name: "customDimension9", type: .string),
//        Option(name: "customDimension10", type: .string),
//        Option(name: "customDimension11", type: .string),
//        Option(name: "customDimension12", type: .string),
//        Option(name: "customDimension13", type: .string),
//        Option(name: "customDimension14", type: .string),
//        Option(name: "customDimension15", type: .string),
//        Option(name: "customDimension16", type: .string),
//        Option(name: "customDimension17", type: .string),
//        Option(name: "customDimension18", type: .string),
//        Option(name: "customDimension19", type: .string),
//        Option(name: "customDimension20", type: .string),
//        Option(name: "adExtraparam1", type: .string),
//        Option(name: "adExtraparam2", type: .string),
//        Option(name: "adExtraparam3", type: .string),
//        Option(name: "adExtraparam4", type: .string),
//        Option(name: "adExtraparam5", type: .string),
//        Option(name: "adExtraparam6", type: .string),
//        Option(name: "adExtraparam7", type: .string),
//        Option(name: "adExtraparam8", type: .string),
//        Option(name: "adExtraparam9", type: .string),
//        Option(name: "adExtraparam10", type: .string),
        Option(name: "contentCustomDimension1", type: .string),
        Option(name: "contentCustomDimension2", type: .string),
        Option(name: "contentCustomDimension3", type: .string),
        Option(name: "contentCustomDimension4", type: .string),
        Option(name: "contentCustomDimension5", type: .string),
        Option(name: "contentCustomDimension6", type: .string),
        Option(name: "contentCustomDimension7", type: .string),
        Option(name: "contentCustomDimension8", type: .string),
        Option(name: "contentCustomDimension9", type: .string),
        Option(name: "contentCustomDimension10", type: .string),
        Option(name: "contentCustomDimension11", type: .string),
        Option(name: "contentCustomDimension12", type: .string),
        Option(name: "contentCustomDimension13", type: .string),
        Option(name: "contentCustomDimension14", type: .string),
        Option(name: "contentCustomDimension15", type: .string),
        Option(name: "contentCustomDimension16", type: .string),
        Option(name: "contentCustomDimension17", type: .string),
        Option(name: "contentCustomDimension18", type: .string),
        Option(name: "contentCustomDimension19", type: .string),
        Option(name: "contentCustomDimension20", type: .string),
        Option(name: "adCustomDimension1", type: .string),
        Option(name: "adCustomDimension2", type: .string),
        Option(name: "adCustomDimension3", type: .string),
        Option(name: "adCustomDimension4", type: .string),
        Option(name: "adCustomDimension5", type: .string),
        Option(name: "adCustomDimension6", type: .string),
        Option(name: "adCustomDimension7", type: .string),
        Option(name: "adCustomDimension8", type: .string),
        Option(name: "adCustomDimension9", type: .string),
        Option(name: "adCustomDimension10", type: .string),
        Option(name: "appName", type: .string),
        Option(name: "appReleaseVersion", type: .string),
        Option(name: "waitForMetadata", type: .bool),
        Option(name: "pendingMetadata", type: .unknown)
    ]
}
