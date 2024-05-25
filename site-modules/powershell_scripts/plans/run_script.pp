plan powershell_scripts::run_script(
  TargetSpec $nodes
) {
  $results = run_task('powershell_scripts::script_one', $nodes)
  $results.each |$result| {
    if $result['status'] == 'success' {
      if $result['value'] && $result['value']['_output'] {
        notice("script_one succeeded on ${result['target']}. Output: ${result['value']['_output']}")
      } else {
        notice("script_one succeeded on ${result['target']} but no output was returned.")
      }
    } else {
      if $result.dig('_error', 'msg') {
        fail_plan("script_one failed on ${result['target']}: ${result['_error']['msg']}. Full error: ${result['_error']}")
      } else {
        fail_plan("script_one failed on ${result['target']} with unknown error. Full result: ${result}")
      }
    }
  }

  run_task('powershell_scripts::script_two', $nodes)
}
