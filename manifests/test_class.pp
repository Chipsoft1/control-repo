class my_tasks::test_class {

  # Ensure the script directory exists
  file { 'C:/Scripts':
    ensure => 'directory',
  }

  # Deploy the PowerShell script to the node
  file { 'C:/Scripts/ExampleScriptPuppet.ps1':
    ensure  => 'file',
    content => template('profile/ExampleScriptPuppet.ps1.erb'),
  }

  # Ensure the log directory exists
  file { 'C:/Scripts':
    ensure => 'directory',
  }

  # Execute the PowerShell script
  exec { 'run_example_script':
    command   => 'powershell.exe -ExecutionPolicy Bypass -File C:/Scripts/ExampleScriptPuppet.ps1',
    provider  => 'powershell',
    logoutput => true,
  }
}
