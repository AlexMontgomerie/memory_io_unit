#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/juju/mem_test_rw_seperate/ip/mem_prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
