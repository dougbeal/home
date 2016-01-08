# -*- mode: ruby -*-

Pry.editor = 'ec'

# == Pry-Nav - Using pry as a debugger ==
Pry.commands.alias_command 'c', 'continue' rescue nil
Pry.commands.alias_command 's', 'step' rescue nil
Pry.commands.alias_command 'n', 'next' rescue nil
Pry.commands.alias_command 'r!', 'reload!' rescue nil
Pry.commands.alias_command 'fi', 'finish' rescue nil
Pry.commands.alias_command 'bt', 'show-stack' rescue nil
Pry.commands.alias_command 'ss', 'show-source' rescue nil
Pry.commands.alias_command 'w', 'watch' rescue nil
