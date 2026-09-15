# Tier 1 소스 목록

이 파일은 "Tier 1 영어 매체" 화이트리스트다. 검색어에 매체명을 넣을 때, 그리고 후보 URL의 도메인을 검증할 때 이 목록만 사용한다 — 목록에 없는 매체는 검색 결과에 섞여 있어도 채택하지 않는다.

| 매체 | 도메인 | 비고 |
|---|---|---|
| Bloomberg | bloomberg.com | URL에 발행일이 `/news/articles/YYYY-MM-DD/...` 형식으로 들어 있어 날짜 검증이 쉽다 |
| CNBC | cnbc.com | URL에 발행일이 `/YYYY/MM/DD/...` 형식으로 들어 있어 날짜 검증이 쉽다 |
| Fortune (보조) | fortune.com | 검색에서 확인됨. URL에 날짜가 없는 기사가 섞여 있어 날짜 검증이 스니펫에 더 의존적이다. Bloomberg·CNBC만으로 10개가 안 채워질 때 추가로 검색한다 |

## 왜 The Economist·The New York Times가 아닌가

원래 요청은 The Economist, The New York Times였다. 하지만 실제로 스킬을 돌려본 결과, 이 환경의 WebFetch·인앱 브라우저는 물론 WebSearch 색인 자체에서도 `nytimes.com`, `economist.com`, 그리고 `reuters.com`, `wsj.com`, `ft.com`, `theguardian.com`, `washingtonpost.com`이 전혀 나오지 않았다(다양한 조합으로 여러 번 검색해도 0건 — 아마 이 매체들이 Anthropic 크롤러를 robots.txt로 차단하고 있어서 색인 자체가 없는 것으로 보인다). 같은 방식으로 검색했을 때 Bloomberg, CNBC, Fortune은 실제 기사 URL과 날짜가 꾸준히 잡혔다. 그래서 "검색 자체가 되는" 이 세 매체로 화이트리스트를 바꿨다.

나중에 다시 The Economist나 NYT를 시도해보고 싶다면(예: 이 환경의 정책이 바뀌었거나 다른 검색 도구를 쓰게 된 경우), 위와 같은 방식으로 먼저 몇 번 검색해서 실제 URL이 잡히는지부터 확인하고 나서 화이트리스트에 추가한다 — 잡히지 않으면 스킬 전체가 매번 빈손으로 끝난다.

## 확장 후보

- 다른 매체를 요청받으면, 먼저 이 파일의 "왜 The Economist·NYT가 아닌가" 절과 같은 방식으로 검색이 실제로 되는지 테스트한 뒤 추가한다.

## 검색 팁

- `site:` 필터나 `allowed_domains`는 Tier 1 매체 상대로 거부되는 경우가 있으므로 쓰지 않는다. 매체명을 검색어 텍스트에 그대로 넣는다 (예: `Bloomberg food agriculture September 9 2026`).
- 검색 결과 URL의 도메인이 위 표에 있는지 항상 확인한다.
- URL에 박힌 날짜(`/2026/09/09/`, `/news/articles/2026-09-09/`)를 발행일 검증의 1순위 근거로 쓴다.
