function __fish_hxenv_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'hxenv' ]
    return 0
  end
  return 1
end

function __fish_hxenv_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

complete -f -c hxenv -n '__fish_hxenv_needs_command' -a '(hxenv commands)'
for cmd in (hxenv commands)
  complete -f -c hxenv -n "__fish_hxenv_using_command $cmd" -a "(hxenv completions $cmd)"
end
