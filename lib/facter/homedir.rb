# homedir.rb

require 'etc'

Facter.add(:homedir) do
  confine :kernel => 'Linux'
  setcode do
    user = `whoami`
    Etc.getpwnam(user.chomp).dir
  end
end
