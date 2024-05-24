class powershell_scripts {
  exec { 'run_script_one':
    command   => 'powershell.exe -ExecutionPolicy Bypass -File "C:/path/to/script_one.ps1"',
    provider  => powershell,
    logoutput => true,
  }

  exec { 'run_script_two':
    command   => 'powershell.exe -ExecutionPolicy Bypass -File "C:/path/to/script_two.ps1"',
    provider  => powershell,
    logoutput => true,
    require   => Exec['run_script_one'],
  }
}
