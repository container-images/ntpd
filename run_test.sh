#!/bin/bash
sudo ntpdate localhost

result=$?
if [ $result -eq 0 ]; then
  echo "ntpd seems to work"
else
  echo "Something went wrong, please make sure ntpd runs on this machine."
  echo "check the output above for any hints"
fi
exit $result
