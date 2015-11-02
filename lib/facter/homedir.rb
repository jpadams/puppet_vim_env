# homedir.rb

require 'etc'

Facter.add(:homedir) do
  confine :kernel => /^(?!windows$)/
  setcode do
    user = `whoami`
    Etc.getpwnam(user.chomp).dir
  end
end
