#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/juju/mem_io_unit_testing/ip/mem_prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
