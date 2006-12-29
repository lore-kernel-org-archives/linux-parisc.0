From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] timing bug in clone() ?
Date: Fri, 29 Dec 2006 17:21:53 +0100
Message-ID: <200612291721.53961.deller__34556.6398268149$1416624242$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Help !

I'm trying to find the reason, why the program below segfaults on parisc.
if you change the "#if 0" to "#if 1", then it works without segfaulting.

To me it seems we have some kind of race in the linux kernel, e.g.
thread exits, wants to notify parent, but parent hasn't returned from clone() call... ?!?

Any ideas ?

Helge


"strace -f ./clonebug" gives:
....
brk(0)                                  = 0x21000
brk(0x42000)                            = 0x42000
clone(Process 7980 attached
child_stack=0x21090, flags=|SIGCHLD) = 7980
[pid  7979] wait4(-1, Process 7979 suspended
 <unfinished ...>
[pid  7980] --- SIGSEGV (Segmentation fault) @ 0 (0) ---
Process 7979 resumed
Process 7980 detached
<... wait4 resumed> NULL, 0, NULL)      = 7980
--- SIGCHLD (Child exited) @ 0 (0) ---
exit_group(0)                           = ?
Process 7979 detached




---------------------------------------------------------------------------
clonebug.c:
---------------------------------------------------------------------------
/* excerpt of clone07.c from Linux Test Project */
#include <sched.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <unistd.h>

/* This test (clone07) checks, if a "return 0" in a child process suceeds without crashing */
/* Unfortunately, we crash not because of the "return 0", but due to some timimig/signalling problems ?? */

static int do_child(void *arg)
{
#if 0  /* program SIGSEGVs if you turn this to "0" */
	sleep(1);
#endif
	return 0; /* clone07 checks, if a "return 0" in a child process suceeds without crashing */
}

int main(int ac, char **av)
{
	int child_pid;
	void *child_stack = (void*)malloc(1000);	/* stack for child */
    	
	child_pid = clone(do_child, child_stack, SIGCHLD, NULL);
	wait(NULL);

	return 0;
}
---------------------------------------------------------------------------
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
