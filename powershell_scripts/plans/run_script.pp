plan powershell_scripts::run_scripts(
  TargetSpec $nodes
) {
  $results = run_task('powershell_scripts::script_one', $nodes)
  $results.each |$result| {
    if $result['status'] != 'success' {
      fail_plan("script_one failed on ${result['target']}")
    }
  }

  run_task('powershell_scripts::script_two', $nodes)
}
