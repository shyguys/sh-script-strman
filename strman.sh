#!/bin/bash
#
# String manipulation.

# ------------------------------------ BEGIN GLOBAL VARIABLES ------------------------------------ #

declare __NAME
declare __DIR

__NAME="$(basename "${0}")"
__DIR="$(cd "$(dirname "$(readlink -f "${0}")")" && pwd)"

# ------------------------------------- END GLOBAL VARIABLES ------------------------------------- #

# ################################################################################################ #

# --------------------------------------- BEGIN FUNCTIONS ---------------------------------------- #

display_usage() {
  echo "Usage: ${__NAME} <MANIPULATOR> string..."
  echo
  echo "Manipulators:"
  echo "  -u, --capitalize      converts the first character to uppercase."
  echo "  -U, --uppercase       converts every character to uppercase."
  echo "  -l, --uncapitalize    converts the first character to lowercase."
  echo "  -L, --lowercase       converts all characters to lowercase."
}

# ---------------------------------------- END FUNCTIONS ----------------------------------------- #

# ################################################################################################ #

# ------------------------------------------ BEGIN MAIN ------------------------------------------ #

main() {
  local MANIPULATOR
  local -a STRINGS
  local STRING

  MANIPULATOR="${1}"
  shift 1
  STRINGS=("$@")

  case "${MANIPULATOR}" in
    "-u" | "--capitalize")
      for STRING in "${STRINGS[@]}"; do
        echo "${STRING^}"
      done
    ;;

    "-U" | "uppercase")
      for STRING in "${STRINGS[@]}"; do
        echo "${STRING^^}"
      done
    ;;

    "-l" | "--uncapatalize")
      for STRING in "${STRINGS[@]}"; do
        echo "${STRING,}"
      done
    ;;

    "-L" | "--lowercase")
      for STRING in "${STRINGS[@]}"; do
        echo "${STRING,,}"
      done
    ;;

    "help")
      display_usage
    ;;

    *)
      echo "${__NAME}: command '${MANIPULATOR}' unknown."
      echo "${__NAME}: see '${__NAME} help' for more information."
      exit 1
    ;;
  esac
}

# ------------------------------------------- END MAIN ------------------------------------------- #

main "$@"
