# RxSwift ReactorKit Sample App
- 프로젝트 개발 시, 샘플용 기본 구조가 될 만한 샘플 앱을 만들어 보려 합니다.

## 상세 설명 (Description)
ReactorKit 을 활용해서 기본이 되는 iOS Sample App을 만들어 보려고 합니다.

## 아키텍쳐 컨셉 (Architecture Concepts)
- [Reactive eXtensions(RX)](http://reactivex.io/) 
- [ReactorKit](https://github.com/ReactorKit/ReactorKit)
	- Flux + RX (Reactive eXtentsion)
- Data Binding (using [RxSwift](https://github.com/ReactiveX/RxSwift))
- Dependencies management (using [Cocoapods](https://cocoapods.org/))

## 아키텍처 패턴 (Architecture Design Patterns)
### 샘플 앱은 ReactorKit을 사용합니다.

- ReactorKit는 Flux와 반응형 프로그래밍의 조합입니다. <br /> 
사용자 Actions 및 View States는 관찰 가능한 스트림을 통해 각 계층으로 전달됩니다. 이러한 흐름은 단방향입니다. <br />View는 Actions를 보낼 수 만 있고, reactor는 states만 emit 할 수 있습니다.

<img src='https://cloud.githubusercontent.com/assets/931655/25073432/a91c1688-2321-11e7-8f04-bf91031a09dd.png' width="500">

- Action은 사용자 상호 작용을 나타내고 상태는 View State를 나타냅니다. <br /> Mutation은 action과 state 사이에서 브릿지 역활을 합니다. <br />reactor는 mutate() 및 reduce()의 두 단계로 Action 스트림을 State 스트림으로 변환 단계를 거칩니다.
<img src='https://cloud.githubusercontent.com/assets/931655/25098066/2de21a28-23e2-11e7-8a41-d33d199dd951.png' width="500">

* 상세한 내용은 [https://github.com/ReactorKit/ReactorKit](https://github.com/ReactorKit/ReactorKit) 에서 확인부탁드립니다.

	```
	ReactorKit은 반응형 단방향 앱을 위한 프레임워크로,
	StyleShare와 Kakao를 비롯한 여러 기업에서 
	사용하고 있는 기술입니다.
	```

## 컨셉 (Other concepts)
- SwiftGen 을 이용한 지역화 처리
- SwiftLint 를 이용하여 스타일 규칙 적용
- Storyboards 를 UI 구현으로 사용
- XIBs 공통 UI에 사용

## 요구사항 (Requirements)
- Cocoapods
- XCode 10.1+
- iOS 10.0+
	- 90% 이상이 최신 OS와 한단계 전 OS를 사용.
	- https://developer.apple.com/support/app-store/
- SwiftGen

## 옵션 (Optional)
- SwiftLint
- [FLEX](https://github.com/Flipboard/FLEX) : For Debugging
- [firebase](https://firebase.google.com/) : 셈플 소스에는 미적용
- [crashlytics](https://firebase.google.com/docs/crashlytics/) : 셈플 소스에는 미적용
- (검토중) Fastlane

## 사용한 라이브러리 (Used Libraries)    
- Installation
    - [CocoaPods](https://github.com/CocoaPods/CocoaPods)
    - [Carthage](https://github.com/Carthage/Carthage) 
    	- 현재 셈플 소스라서 반드시 필요할 경우에만 사용, 쉽게 셋팅할 수 있도록 pods만을 최대한 활용해서 적용해 두려고 합니다.
    
- Core
    - [RxSwift](https://github.com/ReactiveX/RxSwift)
    - [RxCocoa](https://cocoapods.org/pods/RxCocoa)

- Architecture
    - [ReactorKit](https://github.com/ReactorKit/ReactorKit)

- Network
	- RESTful
		- [Alamofire](https://github.com/Alamofire/Alamofire)
		- [Moya](https://github.com/Moya/Moya)
	- Socket
		- [Starscream](https://github.com/daltoniam/Starscream)

- UI
    - [SnapKit](https://github.com/SnapKit/SnapKit)
    
- Navigation
	- [RxFlow](https://github.com/RxSwiftCommunity/RxFlow)

- Log
    - [Reqres](https://github.com/AckeeCZ/Reqres)

- CI & Documentation
    - [SwiftLint](https://github.com/realm/SwiftLint)
    - [SwiftGen](https://github.com/SwiftGen/SwiftGen)
    - [Fastlane](https://github.com/fastlane/fastlane)

- Analytics
    - [Firebase](https://firebase.google.com/)
    - [Crashlytics](https://firebase.google.com/docs/crashlytics)
    
## 시작하기 (Getting started)
- 작성중

## 샘플 앱
- 작성중

## 주요 참조한 링크
> Rx 구현 방식, 폴더 구조, 소스활용, ReactorKit 활용, Moya 네트워크 처리 방법 등등 여러가지로 참고 하였습니다.

- [Drrrible](https://github.com/devxoul/Drrrible) : ReactorKit을 사용하는 비공식 Dribbble iOS 응용 프로그램입니다.
- [awesome-blogs-ios](https://github.com/tilltue/awesome-blogs-ios) : 어썸블로그 ・ 개발 블로그 모음 ・ 개발 잡덕들을 위한 본격 고퀄리티 개발 블로그 큐레이션 서비스 🕵️‍♀️ - iOS 버전.