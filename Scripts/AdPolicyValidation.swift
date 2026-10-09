import Foundation

// swiftc N1TestApp/Models/AdPolicy.swift N1TestApp/Store/AdControlManager.swift Scripts/AdPolicyValidation.swift -o /tmp/ad-control-policy
@MainActor
final class AdRemoteConfig {
    static let shared = AdRemoteConfig()
    var policy = AdPolicy()
}

// Standalone collaborators for exercising the app's actual ad policy without
// loading StoreKit products or the Google Mobile Ads SDK.
@MainActor
final class StoreKitManager {
    static let shared = StoreKitManager()
    var shouldShowAds = true
    var isSubscribed = false
    var isPremium = false
}

@MainActor
final class AppOpenAdManager {
    static let shared = AppOpenAdManager()
    func clearAdsAfterPurchase() { }
}

extension Notification.Name {
    static let purchaseStatusChanged = Notification.Name("purchaseStatusChanged")
    static let adPolicyChanged = Notification.Name("adPolicyChanged")
}

@main
enum AdPolicyValidation {
    @MainActor
    static func main() {
        let policy = AdControlManager.shared
        precondition(policy.shouldShowInterstitialAds && policy.shouldShowAppOpenAds)
        precondition(policy.shouldShowBannerAds)
        StoreKitManager.shared.shouldShowAds = false
        policy.refresh()
        precondition(!policy.shouldShowBannerAds && !policy.shouldShowInterstitialAds && !policy.shouldShowAppOpenAds)
        StoreKitManager.shared.shouldShowAds = true
        policy.refresh()
        precondition(policy.shouldShowBannerAds && policy.shouldShowInterstitialAds && policy.shouldShowAppOpenAds)
        AdRemoteConfig.shared.policy = AdPolicy(values: ["banner_ads_enabled": "false"])
        policy.refresh()
        precondition(!policy.shouldShowBannerAds && policy.shouldShowInterstitialAds && policy.shouldShowAppOpenAds)
        AdRemoteConfig.shared.policy = AdPolicy(values: ["ads_enabled": "false"])
        policy.refresh()
        precondition(!policy.shouldShowBannerAds && !policy.shouldShowInterstitialAds && !policy.shouldShowAppOpenAds)
        StoreKitManager.shared.shouldShowAds = false
        AdRemoteConfig.shared.policy = AdPolicy()
        policy.refresh()
        precondition(!policy.shouldShowBannerAds && !policy.shouldShowInterstitialAds && !policy.shouldShowAppOpenAds)
        print("PASS: interstitial/app-open ads enabled; purchases disable all ads; restoring eligibility re-enables ads")
    }
}
