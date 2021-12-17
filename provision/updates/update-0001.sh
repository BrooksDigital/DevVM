#!/bin/bash

# Dummy file that does nothing, and servs the initial provision iteration.
# Further additions of update-xxxx.sh files will be executed in order after
# each re --provision of the VM.
#
# The install.sh should always reflect the state of the latest update
#
# Similar to how hook_install() and hook_update_N() works with Drupal.
#
