From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Multiple signals?
Date: Fri, 5 Nov 2004 10:28:40 -0800
Message-ID: <20041105182840.GA7666@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="5mCyUwZo2JvN/JJP"
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


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Found a problem while debugging gdb.. it looks like we don't correctly
handle multiple pending signals in the kernel?

For example, if a task has both a SIGTRAP and a SIGALRM pending, it
looks like we only deliver the SIGTRAP but not the SIGALRM. Argh...

Does anybody have an ideas how to debug/fix this? i thought it's just a
matter of making intr_do_signal and syscall_do_signal loop back to
recheck the SIGPENDING flags, but that doesn't seem to do it....

Test case:
compile the attached program with
    gcc -g -o sigstep sigstep.c

then do something like:

(gdb) b handler
Breakpoint 1 at 0x10608: file /home/tausq/gdb/gdb-cvs/gdb/testsuite/gdb.base/sigstep.c, line 31.
(gdb) b 66
Breakpoint 2 at 0x106f4: file /home/tausq/gdb/gdb-cvs/gdb/testsuite/gdb.base/sigstep.c, line 66.
(gdb) run
Starting program: /home/tausq/gdb/build-cvs/gdb/testsuite/gdb.base/sigstep

Breakpoint 2, main ()
    at /home/tausq/gdb/gdb-cvs/gdb/testsuite/gdb.base/sigstep.c:66
66            while (!done);
(gdb) step

Breakpoint 2, main ()
    at /home/tausq/gdb/gdb-cvs/gdb/testsuite/gdb.base/sigstep.c:66
66            while (!done);

notice that the printf in the signal handler never gets triggered, and
we never stop at the breakpoint on the signal handler....

i wonder if this might also explain some other "lost signals" problems
others are seeing?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

--5mCyUwZo2JvN/JJP
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="sigstep.c"

/* This testcase is part of GDB, the GNU debugger.

   Copyright 2004 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
 
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

*/

#include <stdio.h>
#include <string.h>
#include <signal.h>
#include <sys/time.h>

static volatile int done;

static void
handler (int sig)
{
  printf("in handler\n");
  done = 1;
} /* handler */

struct itimerval itime;
struct sigaction action;

/* The enum is so that GDB can easily see these macro values.  */
enum {
  itimer_real = ITIMER_REAL,
  itimer_virtual = ITIMER_VIRTUAL
} itimer = ITIMER_VIRTUAL;

main ()
{

  /* Set up the signal handler.  */
  memset (&action, 0, sizeof (action));
  action.sa_handler = handler;
  sigaction (SIGVTALRM, &action, NULL);
  sigaction (SIGALRM, &action, NULL);

  /* The values needed for the itimer.  This needs to be at least long
     enough for the setitimer() call to return.  */
  memset (&itime, 0, sizeof (itime));
  itime.it_value.tv_usec = 250 * 1000;

  /* Loop for ever, constantly taking an interrupt.  */
  while (1)
    {
      /* Set up a one-off timer.  A timer, rather than SIGSEGV, is
	 used as after a timer handler finishes the interrupted code
	 can safely resume.  */
      setitimer (itimer, &itime, NULL);
      /* Wait.  */
      while (!done);
      done = 0;
    }
}

--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--5mCyUwZo2JvN/JJP--
