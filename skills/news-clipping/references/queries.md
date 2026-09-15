# 검색 쿼리 템플릿

이전 실행에서 "food agriculture supply chain" 한 가지 조합만 반복 검색했더니 후보가 넉넉히 안 모여서(약 30건 검토 중 1건만 확정) 결과가 빈약해졌다. 원인은 검색어 다양성 부족이었다 — 매체 홈페이지에는 실제로 식품/농산물 기사가 매일 여러 개 올라오지만, 검색어 조합이 좁으면 색인에서 안 걸린다.

그래서 카테고리별로 검색어를 나눠 **여러 조합을 시도**한다. 한 카테고리에서 후보가 안 나와도 다른 카테고리에서 나올 수 있다 — 최소 4~5개 카테고리는 각각 한 번씩 시도하고, 시간이 되면 더 넓힌다. WebSearch는 여러 개를 한 번에 병렬로 호출할 수 있으니, 한 턴에 카테고리별로 묶어서 호출한다.

## 카테고리

각 항목의 `{매체}` `{날짜}` 자리에 실제 매체명과 어제 날짜(YYYY-MM-DD, 자연어 둘 다)를 넣는다.

| 카테고리 | 쿼리 예시 |
|---|---|
| 관세·무역정책 | `{매체} food agriculture tariff trade {날짜}` |
| 리콜·식품안전 | `{매체} food recall outbreak FDA USDA {날짜}` |
| 기업실적·M&A | `{매체} food company earnings acquisition {날짜}` |
| 원자재·상품가격 | `{매체} coffee cocoa wheat corn soybean livestock price {날짜}` |
| 외식업·소매 | `{매체} restaurant chain grocery retail sales {날짜}` |
| 정책·규제 | `{매체} food policy regulation USDA FDA {날짜}` |

## URL 패턴으로 직접 저격하기

일반 키워드 검색이 부족하면, 매체의 URL 날짜 패턴을 검색어에 그대로 넣어서 그날 발행된 기사 전체를 훑는 방법이 꽤 잘 먹힌다 (실제로 이 방법으로 확정 기사를 찾은 적이 있다):

- `"cnbc.com/2026/09/09" food OR farm OR grocery OR restaurant OR dairy OR meat OR tariff OR recall`
- `"bloomberg.com/news/articles/2026-09-09" food OR farm OR grain OR livestock OR grocery`

날짜만 바꿔서 여러 카테고리 키워드로 반복하면 그날 두 매체가 실제로 낸 기사 목록에 가깝게 훑을 수 있다.

## 주의

- WebSearch가 반환하는 요약 문장(prose)은 가끔 실제로는 안 나온 매체를 "찾았다"고 서술하는 경우가 있었다(예: investing.com/seekingalpha 기사를 "CNBC 커버리지"라고 잘못 요약). **항상 `Links` 배열의 실제 URL만 근거로 삼는다** — 요약 문장을 그대로 믿지 않는다.
- 후보가 여전히 부족하면 [sources.md](sources.md)의 확장 후보(Fortune)까지 검색한다.
