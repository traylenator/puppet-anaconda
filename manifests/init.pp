# == Class: conda
#
# Conda installs either the full install of Anaconda or the bootstrapped
# version using Miniconda.
#
# === Parameters
#
# Document parameters here.
#
# [*light_install*]
#   Defaults to false.  If set to true, a bare-bones python
#   distribution will be installed using miniconda.
#
# [*download_timeout*]
#   Defaults to 30 minutes.  The time to wait for the installer to download
#
# === Examples
#
#  include conda
#
#  class { conda:
#  }
#
# === Authors
#
# Author Name bkreider@continuum.io
#
# === Copyright
#
# Copyright 2013 Continuum Analytics
#
class conda (
    $light_install    = false,
    $download_timeout = 1800,
    $url = $conda::params::url,
    $installer = $conda::params::installer,
    $anaconda_url = $conda::params::anaconda_url,
    $anaconda_installer = $conda::params::anaconda_installer,
    $install_dir = $conda::params::install_dir,
    
) inherits conda::params {
    include conda::install
}
