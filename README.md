# claude-skills

Claude Code용 커스텀 스킬 모음입니다. 인생푸드 실무에 바로 쓰는 반복 업무를 자동화합니다.

## 스킬 목록

| 스킬 | 설명 |
|---|---|
| [skills/news-clipping](skills/news-clipping/SKILL.md) | 어제자 식품·외식·농산물·공급망 뉴스를 Tier 1 매체(Bloomberg, CNBC)에서 모아 벤토 그리드 HTML로 정리 |
| [skills/vendor-reply-draft](skills/vendor-reply-draft/SKILL.md) | 원육 등 단가 인상 통보를 받았을 때 우리 쪽 거래 데이터(단가 이력·물량·계약조건)를 근거로 방어 협상 메일 초안 작성 (일반 거래처/경쟁사 답장에도 사용) |

## 두 스킬의 연결

1. `news-clipping`이 "원육 가격 상승" 같은 업계 이슈를 먼저 캐치한다.
2. 그 이슈가 실제로 거래처의 단가 인상 통보로 이어지면, `vendor-reply-draft`가 우리 쪽 거래 데이터를 근거로 방어적 협상 메일 초안을 만든다.

## 설치 방법

원하는 스킬 폴더를 `~/.claude/skills/<스킬명>/`에 복사하면 Claude Code가 자동으로 인식합니다.

```bash
git clone https://github.com/lftylee-creator/claude-skills.git
cp -r claude-skills/skills/news-clipping ~/.claude/skills/
cp -r claude-skills/skills/vendor-reply-draft ~/.claude/skills/
```

## 사용 예시

- "뉴스 클리핑 해줘" / "어제 식품 업계 뉴스 정리해줘" → `news-clipping` 스킬 자동 실행
- "이 메일 답장 초안 써줘" / "거래처 메일에 답장" → `vendor-reply-draft` 스킬 자동 실행

## 구조

```
skills/
├── news-clipping/
│   ├── SKILL.md
│   ├── references/    # 매체 화이트리스트, 검색어 가이드
│   ├── scripts/        # 날짜 계산 스크립트
│   └── evals/          # 테스트 케이스
└── vendor-reply-draft/
    ├── SKILL.md
    └── references/     # 톤 가이드, 상황별 문구
```
