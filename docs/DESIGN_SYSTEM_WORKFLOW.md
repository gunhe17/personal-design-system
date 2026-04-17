# Design System Workflow (Atomic Edition)

이 문서는 HTML/Tailwind 레퍼런스를 **Atomic Design** 구조의 Flutter 위젯으로 이식하는 표준 절차를 정의합니다.

---

## 0. 디자인 원칙 (Core Pillars)

1.  **Strict Color System**: 무채색(Neutral Gray 050-950)과 포인트 컬러 2종(`Orange #F94001`, `Gold #ED9D0B`)만 사용합니다.
2.  **Intelligent Typography**: 영문은 시스템 폰트(가로폭 최적화), 한국어는 `Pretendard` 폴백을 적용하여 인위적인 자간 조정 없이 최적의 가독성을 구현합니다.
3.  **Achromatic Interaction**: 모든 인터랙티브 요소의 활성화(Active/Focus) 상태는 주황색 대신 **무채색(Gray 400~800)**을 사용하여 차분하게 강조합니다.
4.  **Optical Precision**: 텍스트와 커서의 수직 정렬은 `Alignment(0, -0.2)` 등 광학적 보정을 통해 인간의 눈에 가장 완벽한 정중앙을 구현합니다.
5.  **Standard Durations**: 모든 애니메이션은 `AppAnimations` 토큰(`fast`, `normal`)을 준수하여 시스템 전체의 리듬을 통일합니다.

---

## 1. 단계별 작업 절차 (The Atomic Workflow)

### Step 1. 부품 추출 및 원자화 (Atomization)
*   레퍼런스에서 가장 작은 단위(Button, Input, Checkbox, Avatar 등)를 찾아 원자로 정의합니다.
*   **Location**: `lib/widgets/atoms/`
*   **Rule**: 원자는 스스로 정밀한 정렬과 시스템 원칙을 내포해야 합니다.

### Step 2. 원자 기반 조립 (Combination)
*   정의된 원자 위젯들을 가져와 레퍼런스의 복합 레이아웃을 조립합니다.
*   **Location**: `lib/widgets/clones/`
*   **Rule**: 클론 위젯 내부에 로우 레벨 코드를 직접 작성하지 않고, 반드시 원자 위젯의 프로퍼티를 통해 스타일을 결정합니다.

### Step 3. 문서화 및 계층적 배치 (Showcase)
*   `lib/pages/showcase_page.dart`에 다음의 3단계 계층으로 등록합니다.
    1.  **01. Atoms**: 부품들의 모든 변형(Variants) 나열.
    2.  **02. Functional Combinations**: 드롭다운, 셀렉트 메뉴 등 기능 위주 조합.
    3.  **03. Full Layouts**: `AppFrame`을 활용한 페이지 단위 완성형 예시.

---

## 2. 표준 코드 패턴 (Implementation Standards)

### Button Atom
*   텍스트 길이에 맞는 `Intrinsic Width`를 가져야 함 (`UnconstrainedBox` 활용).
*   텍스트 버튼도 반드시 40px 높이의 인터랙션 영역을 포함해야 함.

### Input Atom
*   커서 높이는 16px로 고정.
*   `filled: false`와 외부 패딩 고정을 통해 입력 시 텍스트 점핑 현상을 원천 차단.

### Checkbox Atom
*   `StatefulWidget`으로 구현하여 쇼케이스에서 즉시 테스트 가능해야 함.
*   체크 아이콘 등장 시 `Scale & Fade` 애니메이션 필수 적용.
