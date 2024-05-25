plan run_scripts(
  TargetSpec $nodes,
  String $script_one,
  String $script_two
) {
  # Run script_one on the specified nodes
  $result_one = run_command("powershell.exe -File $script_one", $nodes)

  # Check if script_one was successful
  if $result_one.ok {
    # Run script_two if script_one succeeded
    run_command("powershell.exe -File $script_two", $nodes)
  } else {
    # Output an error message if script_one failed
    fail("script_one failed: ${result_one.message}")
  }
}
