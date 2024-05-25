plan powershell_scripts::run_script(
  TargetSpec $nodes
) {
  $results = run_task('powershell_scripts::script_one', $nodes)
  $results.each |$result| {
    if $result['status'] != 'success' {
      if $result['_error'] {
        fail_plan("script_one failed on ${result['target']}: ${result['_error']['msg']}")
      } else {
        fail_plan("script_one failed on ${result['target']} with unknown error.")
      }
    }
  }

  run_task('powershell_scripts::script_two', $nodes)
}
