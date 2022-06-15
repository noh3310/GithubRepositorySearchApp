# GithubRepositorySearchApp
깃허브 레포지토리를 검색 API를 활용한 어플리케이션

# Description
- 최소 타겟: 12.1
- MVVM - ReactorKit 적용
- Storyboard를 사용하지않고 코드로만 UI 구현(SnapKit)

## Feature
- 홈 화면
  - GoogleAPI 검색 기능
- Detail화면
  - WebView로 확인 가능

## Skill
Swift, RxSwift, RxCocoa
MVVM + ReactorKit
UIKit, AutoLayout
SnapKit

## Architecture
- MVVM + ReactorKit
  - MVVM의 경우 사람마다 개발하는 방식이 달라 다른사람의 코드를 보고 이해하는 데 더 오랜 시간이 걸렸던 경험이 있습니다. ReactorKit은 틀이 정해져 있고, 코드를 통일성 있게 구현할 수 있을 것 같아 이 아키텍처를 사용해 보았습니다.
  
## Issue
- 마지막 셀에서 다음 페이지 API 호출
  - API 명세서를 확인해봤을 때 별도로 명세하지 않는다면 30개의 리포지토리만 응답받을 수 있다는것을 확인후 테이블뷰의 마지막 셀에 도달했을 때 다음 페이지의 API를 호출해 다음 페이지의 결과값을 확인할 수 있도록 했습니다.
- WebView Reachabilith 적용
  - WebView를 화면에 보여줄 때 인터넷 통신이 되지않는 경우를 고려해 Reachabilith를 적용했습니다.

## ScreenShot
<img src="https://user-images.githubusercontent.com/26789278/173942391-d1e9084f-4d98-4c2a-9a2f-6c9edef142c9.png"  width="200" height="410"> <img src="https://user-images.githubusercontent.com/26789278/173942394-ffc091f7-0c7a-482f-a56c-41412a3415f6.png"  width="200" height="410"> <img src="https://user-images.githubusercontent.com/26789278/173942633-03a5ac60-12f1-40dd-b649-5bcd730775bd.png"  width="200" height="410">

