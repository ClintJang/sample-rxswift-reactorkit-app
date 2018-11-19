# RxSwift ReactorKit Sample App
- 프로젝트 개발 시, 셈플용 기본 구조가 될 만한 셈플 앱을 만들어 보려 합니다.

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

<img src='https://cloud.githubusercontent.com/assets/931655/25073432/a91c1688-2321-11e7-8f04-bf91031a09dd.png'>

- Action은 사용자 상호 작용을 나타내고 상태는 View State를 나타냅니다. <br /> Mutation은 action과 state 사이에서 브릿지 역활을 합니다. <br />reactor는 mutate() 및 reduce()의 두 단계로 Action 스트림을 State 스트림으로 변환 단계를 거칩니다.
<img src='https://cloud.githubusercontent.com/assets/931655/25098066/2de21a28-23e2-11e7-8a41-d33d199dd951.png'>

* 상세한 내용은 [https://github.com/ReactorKit/ReactorKit](https://github.com/ReactorKit/ReactorKit) 에서 확인부탁드립니다.

## 컨셉 (Other concepts)
- (검토중) SwiftGen 을 이용한 지역화 처리
- Storyboards 를 UI 구현으로 사용
- XIBs 공통 UI에 사용

## 요구사항 (Requirements)
- Cocoapods
- XCode 10.1+
- iOS 10.0+
	- 90% 이상이 최신 OS와 한단계 전 OS를 사용.
	- https://developer.apple.com/support/app-store/
- (검토중) SwiftGen

## 옵션 (Optional)
- SwifLint
- (검토중) Fastlane

## 사용한 라이브러리 (Used Libraries)
- 작성중

## 시작하기 (Getting started)
- 작성중

## 셈플 앱
- 작성중
