# all.pp
class puppet_vim_env::all {

  puppet_vim_env::install { 'all':
    owner           => $::id,
    homedir         => $::homedir,
    colorscheme     => 'solarized',
    clobber_vimrc   => true,
    remap_esc_jk    => true,
    use_vim_airline => true,
  }

}
