# JLPT N1 TEST Firebase 설정

- Firebase 프로젝트: `jlpt-n1-test`
- iOS 번들 ID: `org.reactjs.native.example.N1TestApp`
- 설정 파일: `N1TestApp/GoogleService-Info.plist`

TopikOne의 구성을 참고해 Firebase Apple SDK 13.0.0의 Core, Analytics,
Crashlytics, Remote Config를 Swift Package Manager로 연결했습니다.
Xcode에서 프로젝트를 열어 패키지를 resolve한 후 빌드하세요.
`GoogleService-Info.plist`는 Xcode의 동기화된 앱 폴더를 통해 앱에 포함됩니다.
TopikOne의 Firebase 앱 ID나 설정 파일은 사용하지 않습니다.

Firebase는 SwiftUI 앱 delegate에서 한 번 초기화됩니다. 앱의 Info.plist에서
Analytics와 Crashlytics 수집을 활성화하고, SwiftUI 화면은 수동으로 기록합니다.
다운로드한 설정 파일의 `IS_ANALYTICS_ENABLED` 값은 그대로 보존했습니다.

## 콘솔에서 완료할 작업

1. Firebase 프로젝트 설정 → 통합에서 Google Analytics 연결을 확인합니다.
2. Firebase 콘솔에서 Crashlytics를 열고 초기 설정 안내가 있으면 완료합니다.
3. AdMob 설정 → 연결된 서비스에서 이 앱을 `jlpt-n1-test`의 iOS 앱에 연결합니다.
4. 광고 수익 보고를 사용할 경우 AdMob의 노출 수준 광고 수익 설정을 켭니다.

이 설정들은 SDK 설치와 별개이며 앱 코드 수정으로 완료되지 않습니다.

## Analytics 확인

공유 Debug 실행 scheme에 `-FIRDebugEnabled`를 추가했습니다.
앱을 실행하고 Firebase Analytics의 DebugView에서 이벤트를 확인하세요.
Run 인자는 App Store 배포 빌드에 포함되지 않습니다.

- `screen_view`: reading, listening, grammar, vocabulary, word_list,
  incorrect_notes, statistics, subscription.
- `study_start`: 비어 있지 않은 독해·청해 세트를 로드했을 때.
- `study_complete`: 정상 완료로 결과 화면을 열 때. 무료 문제 제한으로
  구독 화면을 여는 경우는 제외합니다.
- `subscription_screen_view`: 구독 화면을 열 때.
- `subscription_purchase_start`, `subscription_purchase_success`,
  `subscription_purchase_cancelled`, `subscription_purchase_pending`,
  `subscription_purchase_failed`: StoreKit 구매 흐름.

학습 이벤트에는 `section`, `set_number`, 구매 이벤트에는 `plan`
(`monthly` 또는 `yearly`)이 포함됩니다. 구매 흐름 이벤트는 추가 수익 이벤트가
아닙니다. 답안 내용, 음성 녹음, 사용자 식별자는 보내지 않습니다.

## Crashlytics 확인

상품 로드·구매·구매 검증 오류를 nonfatal 오류로 기록합니다.
Debug와 Release 모두 dSYM을 생성하고 마지막 빌드 단계에서 심볼을 업로드합니다.
시뮬레이터 빌드는 업로드를 건너뜁니다. Debug 입력 목록에는 debug dylib도 포함됩니다.

실기기에서 테스트하려면 Debug 실행 인자에
`-N1TestAppCrashlyticsTestCrash`를 임시로 추가하고 디버거를 연결하지 않은 상태로
실행하세요. 테스트 크래시 후 이 인자를 제거하고 앱을 다시 실행해 보고서와
스택을 확인하세요. 테스트 크래시 코드는 Release에 포함되지 않습니다.

## Remote Config

콘솔 → Remote Config에서 아래 키를 게시하세요. 새 프로젝트용 템플릿은
`firebase/remote-config.defaults.json`입니다. 기존 파라미터나 실험이 있다면
전체 템플릿을 덮어쓰지 말고 키를 추가하세요.

- `ads_enabled`: Boolean, `true`
- `banner_ads_enabled`: Boolean, `true`
- `interstitial_ads_enabled`: Boolean, `true`
- `app_open_ads_enabled`: Boolean, `true`
- `fullscreen_ad_min_interval_seconds`: Number, `120`

광고 간격은 앱 오픈·전면광고 사이의 공통 최소 간격입니다. 유효 범위는
60~3600초이며 잘못된 값은 120초로 복구됩니다. 구독자의 광고 제거 권한은
원격 설정보다 우선합니다. 기존 광고 표시 시점은 유지합니다.

앱 시작 시 캐시와 기본값을 사용하고 비동기로 새 값을 가져옵니다.
활성 상태로 돌아올 때도 갱신하며 실시간 변경 리스너를 등록합니다.
Release fetch 간격은 1시간, Debug는 0초입니다. 네트워크 실패 시 캐시나
기본값을 유지합니다. 서버에 아무 파라미터도 없어도 기존 광고 설정으로 동작합니다.

## 검증 범위

로컬 Swift 문법 검사, plist·프로젝트 참조 검사, 광고 정책 기본값 및 잘못된
원격 값 복구 테스트를 수행했습니다. 전체 Xcode가 설치되지 않은 환경에서는
iOS 빌드, 패키지 resolve, 실제 이벤트·크래시 수신을 검증할 수 없습니다.
Xcode 또는 Xcode Cloud에서 빌드하고 위 콘솔 확인을 완료하세요.

공식 문서:
- https://firebase.google.com/docs/ios/setup
- https://firebase.google.com/docs/crashlytics/get-started?platform=ios
- https://firebase.google.com/docs/remote-config/get-started?platform=ios
- https://support.google.com/admob/answer/6383165?hl=ko
