class my_tasks::test_scripts {
  exec { 'test_example_script':
    command   => 'powershell.exe -ExecutionPolicy Bypass -File "C:/Scripts/test_example_script.ps1"',
    provider  => powershell,
    logoutput => true,
  }
