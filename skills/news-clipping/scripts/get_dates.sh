#!/usr/bin/env bash
# 1단계 보조 스크립트: "어제" 날짜를 여러 형식으로 한 번에 계산한다.
# 매번 개별 date 명령을 다시 조합하지 않도록 묶어 놓은 것뿐이다 — 로직 자체는
# SKILL.md 1단계와 동일하다 (오늘 날짜를 절대 짐작하지 않고 매번 실제로 계산).

set -e

today=$(date +%Y-%m-%d)

# GNU date (git bash / linux) 우선 시도, 실패하면 BSD/macOS date로 재시도
yesterday=$(date -d yesterday +%Y-%m-%d 2>/dev/null || date -v-1d +%Y-%m-%d)
weekday=$(date -d "$yesterday" +%A 2>/dev/null || date -j -f %Y-%m-%d "$yesterday" +%A 2>/dev/null || echo "")
natural=$(date -d "$yesterday" "+%B %-d, %Y" 2>/dev/null || echo "$yesterday")

echo "TODAY=$today"
echo "YESTERDAY=$yesterday"
echo "YESTERDAY_WEEKDAY=$weekday"
echo "YESTERDAY_NATURAL=$natural"

case "$weekday" in
  Saturday|Sunday)
    echo "NOTE=주말입니다. 미국 시장이 닫혀 있어 Bloomberg/CNBC의 시황·실적 기사가 평소보다 적을 수 있습니다. 정책·리콜 뉴스 위주로 검색하세요."
    ;;
esac
