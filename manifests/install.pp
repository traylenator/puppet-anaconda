# == Class: conda::install
#
# Internal class that does the installation work
class conda::install (
  $url = conda::url,

) inherits conda {

    # Light install uses the miniconda installer
    if $conda::light_install {
        $source    = $conda::url
        $installer = $conda::installer
    }
    else {
        # Full Anaconda install
        $source    = $conda::anaconda_url
        $installer = $conda::anaconda_installer
    }

    $dl_dir         = '/tmp'
    $installer_path = "${dl_dir}/conda/${installer}"
    $install_dir    = $conda::install_dir

    class {'staging':
        path  => $dl_dir,
        owner => 'puppet',
        group => 'puppet',
    }

    # Only download once
    staging::file {$installer:
        source  => $source,
        timeout => $conda::download_timeout
    }

    # Only install if downloaded file changed
    exec { 'conda_install':
        command   => "/bin/bash ${installer_path} -b -p ${install_dir}",
        creates   => $install_dir,
        subscribe => Staging::File[$installer],
    }
}
