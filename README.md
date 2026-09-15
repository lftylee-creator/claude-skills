# news-clipping-skill

Claude Code용 커스텀 스킬입니다. Tier 1 영어 매체(Bloomberg, CNBC 등)에서 어제자 식품·외식·농산물·공급망 뉴스를 모아 벤토 그리드 디자인의 HTML 클리핑으로 정리합니다.

## 무엇을 하는 스킬인가

- 매일/매주 반복되는 "업계 뉴스 정리" 업무를 자동화
- 신뢰할 수 있는 매체 화이트리스트만 사용 (역할: 정확도 우선)
- 날짜를 매번 스크립트로 실제 계산해 "어제" 기준을 보장
- 검색 결과 기반이라는 한계를 결과물에 명시(본문 미검증 사실을 숨기지 않음)
- 최종 결과물은 시각적으로 스캔하기 쉬운 벤토 그리드 HTML(Artifact)

자세한 동작 절차는 [SKILL.md](SKILL.md)를 참고하세요.

## 설치 방법

`~/.claude/skills/news-clipping/` 경로에 이 저장소 내용을 복사하면 Claude Code가 자동으로 인식합니다.

```bash
git clone https://github.com/<your-account>/news-clipping-skill.git ~/.claude/skills/news-clipping
```

## 사용 예시

Claude Code에서 다음과 같이 요청하면 이 스킬이 자동으로 트리거됩니다.

- "뉴스 클리핑 해줘"
- "어제 식품 업계 뉴스 정리해줘"
- "식품 업계 뉴스 모아줘"

## 구조

```
news-clipping/
├── SKILL.md              # 스킬 절차 정의 (핵심 파일)
├── references/
│   ├── sources.md        # 매체 화이트리스트와 선정 근거
│   └── queries.md        # 카테고리별 검색어 가이드
├── scripts/
│   └── get_dates.sh      # 날짜(어제) 계산 스크립트
└── evals/
    └── evals.json        # 스킬 검증용 테스트 케이스
```
