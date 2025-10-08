#!/usr/bin/env bash
set -euo pipefail

# Services to display in the menu (must match service names in docker-compose.yml)
SERVICES=("frontend" "real-time-server" "api-server")

print_menu() {
  cat >&2 <<'EOF'
-------------------------------
Select target to build and run (with real-time logs):
  1) frontend
  2) real-time-server
  3) api-server
  a) all
  q) quit
-------------------------------
EOF
}

pick_service() {
  local choice
  print_menu
  # Safely read input, even when running via make or pipes
  read -rp "Select a number: " choice </dev/tty

  case "$choice" in
    q) echo "Exiting." >&2; exit 0 ;;
    a) printf '%s\n' "all" ;;
    ''|*[!0-9]*) echo "Invalid selection." >&2; exit 1 ;;
    *)
      if (( choice>=1 && choice<=${#SERVICES[@]} )); then
        printf '%s\n' "${SERVICES[$((choice-1))]}"
      else
        echo "Invalid selection." >&2; exit 1
      fi
      ;;
  esac
}

main() {
  local selected
  selected="$(pick_service)"

  if [[ "$selected" == "all" ]]; then
    # Run multiple services simultaneously + real-time logs
    echo "🚀 docker compose up --build ${SERVICES[*]}"
    exec docker compose up --build "${SERVICES[@]}"
  else
    echo "🚀 docker compose up --build $selected"
    exec docker compose up --build "$selected"
  fi
}

main "$@"