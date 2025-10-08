#!/usr/bin/env bash
set -euo pipefail

# 메뉴에 보여줄 서비스들 (docker-compose.yml의 서비스명과 동일)
SERVICES=("frontend" "real-time-server" "api-server")

print_menu() {
  cat >&2 <<'EOF'
-------------------------------
빌드+실행(실시간 로그) 대상 선택:
  1) frontend
  2) real-time-server
  3) api-server
  a) all (전체)
  q) quit (종료)
-------------------------------
EOF
}

pick_service() {
  local choice
  print_menu
  # make/파이프 상황에서도 안전하게 입력 받기
  read -rp "번호를 선택하세요: " choice </dev/tty

  case "$choice" in
    q) echo "종료합니다." >&2; exit 0 ;;
    a) printf '%s\n' "all" ;;
    ''|*[!0-9]*) echo "잘못된 선택입니다." >&2; exit 1 ;;
    *)
      if (( choice>=1 && choice<=${#SERVICES[@]} )); then
        printf '%s\n' "${SERVICES[$((choice-1))]}"
      else
        echo "잘못된 선택입니다." >&2; exit 1
      fi
      ;;
  esac
}

main() {
  local selected
  selected="$(pick_service)"

  if [[ "$selected" == "all" ]]; then
    # 여러 서비스 동시 실행 + 실시간 로그
    echo "🚀 docker compose up --build ${SERVICES[*]}"
    exec docker compose up --build "${SERVICES[@]}"
  else
    echo "🚀 docker compose up --build $selected"
    exec docker compose up --build "$selected"
  fi
}

main "$@"