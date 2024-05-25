plan powershell_scripts::run_script (
  TargetSpec $nodes
) {
  $results = run_task('powershell_scripts::script_one', $nodes)

  $success_nodes = $results.filter |$result| {
    if $result['status'] == 'success' {
      if $result['value'] && $result['value']['_output'] == 'Script 1 executed successfully' {
        notice("script_one succeeded on ${result['target']}.")
        true
      } else {
        notice("script_one did not return the expected output on ${result['target']}.")
        false
      }
    } else {
      if $result.dig('_error', 'msg') {
        fail_plan("script_one failed on ${result['target']}: ${result['_error']['msg']}")
      } else {
        fail_plan("script_one failed on ${result['target']} with unknown error.")
      }
    }
  }.map |$result| { $result['target'] }

  if $success_nodes.empty? {
    fail_plan("No nodes succeeded with the expected output from script_one.")
  }

  run_task('powershell_scripts::script_two', $success_nodes)
}

