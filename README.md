# 38-SOPKATHON-iOS-iOS1

<div align="center">

## iOS Developer

| **신서연** | **임성환** | **장지인** |
| :---: | :---: | :---: |
| | | |

</div>

<br>

<div align="center">
  
## 기술 스택

<img src="https://img.shields.io/badge/uikit-2396F3?style=for-the-badge&logo=uikit&logoColor=white"> <img src="https://img.shields.io/badge/snapkit-FFFC00?style=for-the-badge&logo=snapchat&logoColor=white"> <img src="https://img.shields.io/badge/Then-000000?style=for-the-badge&logo=swift&logoColor=white">

<br>

<img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/notion-000000?style=for-the-badge&logo=notion&logoColor=white"> <img src="https://img.shields.io/badge/figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white">

</div>

<br>

## 코드 컨벤션

> [StyleShare 의 Swift Style Guide](https://github.com/StyleShare/swift-style-guide) 를 기본으로 따라갑니다.
1. 성능 최적화와 위해 더 이상 상속되지 않을 class 에는 final 키워드를 붙입니다.
2. 안전성을 위해 class 에서 사용되는 property는 모두 private로 선언합니다.
3. 명시성을 위해 약어와 생략을 지양합니다. VC -> ViewController TVC -> TableViewCell
4. 런타임 크래시를 방지하기 위해 강제 언래핑을 사용하지 않습니다.

<br>

## 브랜치 전략

### 브랜치명
`커밋타입/#이슈번호`

### 커밋타입
| 타입 | 설명 |
| --- | --- |
| `feat` | 새로운 기능 구현 |
| `add` | 폰트, 에셋, 의존성 등의 추가 |
| `fix` | 버그 및 오류 해결 |
| `chore` | feat 이외의 부수적인 작업 |
| `rename` | 파일, 폴더명을 수정하거나 옮기는 작업 |
| `docs` | README, .gitignore 등의 문서 작업 |
| `refactor` | 코드 리팩토링 |

### 깃 플로우

```
1. 작업할 내용에 대해서 이슈를 생성한다.
2. 나의 로컬에서 main 브랜치가 최신화 되어있는지 확인한다.
3. main 브랜치에서 새로운 이슈 브랜치를 생성한다. [커밋타입/#이슈번호]
4. 만든 브랜치에서 작업한다.
5. 커밋은 기능마다 쪼개서 작성한다.
6. 작업 완료 후, 에러가 없는지 확인한 후 push 한다.
7. 코드리뷰 후 수정사항 반영한 뒤, main 브랜치에 merge 한다.
```

<br>

## 폴더링

```
├── 📁 App
│   ├── 📃 AppDelegate.swift
│   └── 📃 SceneDelegate.swift
├── 📁 Global
│   ├── 📃 LaunchScreen.storyboard
│   ├── 📁 Components
│   ├── 📁 Extensions
│   └── 📁 Resources
│       ├── 📃 Assets.xcassets
│       └── 📁 Fonts
├── 📁 Features
├── 📁 Network
│   ├── 📁 Service
│   └── 📁 DTO
└── 📃 Info.plist
```

<br>

## 시연영상 

## 😴 솝커톤 비포앤애프터
