Jobadmin. A jobs manager for the Linux O/S.

Jobadmin is an application to manage system jobs in IBM/AS400 style. Is 
intended for a single computer with multiple users; the users can be 
connected locally or remotelly via vnc or an ssh terminal.

Jobadmin controls system jobs using interactive commands. Some commands 
display dialog forms representing the actual status of the objects that 
are part of the jobadmin application, and allowing the user to take 
actions.

The subsystem is the job processing unit, runs according to one kernel 
defined cgroup. Each subsystem executes a maximum number of concurrent 
jobs. Some job queues are connected to each subsystem, each job queue 
will run a maximum number or jobs.

Is configurable via text files located in directory /etc/jobadmin.d. We 
can create multiple job queues, subsystems, jobs, and other objects 
that define the jobadmin system.

Priority, nice and processor timeslice are managed via kernel's cgroups,

Re-executes a job easily, simply releasing an already finished job.

Jobadmin saves separate log files for every job run,

Displays the screen of a batch job interactively
using the "screen" utility.

A system power off can be enabled to halt, restart, hibernate or 
suspend the system, will watch until the running jobs have finished.

Using some "cron" type utility we may create a time execution layout 
that releases the job at the scheduled time.
.
-------------------------------------------
Please try it and notify me about any problems, bugs, improvements or 
success.

.
-------------------------------------------
It works in conjunction with modified packages:

For a Debian's O/S with libcgroup:

- start-stop-daemon in package dpkg
added a option "--cgroup"
we can find the code in ftp/debian/cgroups-daemon

- libcgroup, the following has been modified:
returns an error if a corresponding kernel's cgroup
is not found when looking in the rules
of the configuration file /etc/cgconfig.
We can find the modified code in ftp/debian/cgroups-daemon

For a Debian's O/S with libcgroup or systemd:

- dialog, (mod has been accepted in upstream from 20130523):
prints the code of the last key pressed.
We can find the patch code in ftp/debian/dialog

- Also we should install the custom package getopt-sh.