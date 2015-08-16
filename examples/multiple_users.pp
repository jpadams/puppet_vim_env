$users = {
  'jeremy' => 'elflord',
  'crab'   => 'darkblue',
  'salad'  => 'delek',
}

$users.each |$user, $colorscheme| {
  puppet_vim_env::install { "test vim setup for ${user}":
    homedir     => "/Users/${user}",
    owner       => $user,
    colorscheme => $colorscheme,
  }
}
