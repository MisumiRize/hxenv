if [[ ! -o interactive ]]; then
    return
fi

compctl -K _hxenv hxenv

_hxenv() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(hxenv commands)"
  else
    completions="$(hxenv completions ${words[2,-2]})"
  fi

  reply=("${(ps:\n:)completions}")
}
