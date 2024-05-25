plan powershell_scripts::run_script(
  TargetSpec $nodes
) {
  $results = run_task('powershell_scripts::script_one', $nodes)
  $results.each |$result| {
    if $result.ok {
      if $result['status'] != 'success' {
        if $result.dig('_error', 'msg') {
          fail_plan("script_one failed on ${result['target']}: ${result.dig('_error', 'msg')}")
        } else {
          fail_plan("script_one failed on ${result['target']} with unknown error.")
        }
      }
    } else {
      fail_plan("script_one failed on ${result['target']} with unknown error.")
    }
  }

  run_task('powershell_scripts::script_two', $nodes)
}
