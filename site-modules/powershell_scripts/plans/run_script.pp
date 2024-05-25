plan powershell_scripts::run_script (
  TargetSpec $nodes
) {
  $results = run_task('powershell_scripts::script_one', $nodes)

  $results.each |$result| {
    # Log the entire result for debugging purposes
    notice("Result: ${result}")

    if $result['status'] == 'success' {
      # Access the nested output field correctly
      if $result['value']['_output'] =~ /Script 1 executed successfully/ {
        notice("script_one succeeded on ${result['target']} with the correct output.")
      } else {
        fail_plan("script_one succeeded on ${result['target']} but did not output the correct success message. Output was: ${result['value']['_output']}")
      }
    } else {
      if $result['_error'] {
        fail_plan("script_one failed on ${result['target']}: ${result['_error']['msg']}")
      } else {
        fail_plan("script_one failed on ${result['target']} with unknown error. Result was: ${result}")
      }
    }
  }

  run_task('powershell_scripts::script_two', $nodes)
}

