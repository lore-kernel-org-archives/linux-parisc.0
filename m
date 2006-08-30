From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] Kernel crash while running glibc's make check
Date: Tue, 29 Aug 2006 18:07:46 -0700
Message-ID: <20060830010746.GA5917@titanium.v3.ca>
References: <20060827180534.GB28838@titanium.v3.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="/9DWx/yDrRhgMJTb"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060827180534.GB28838@titanium.v3.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 27, 2006 at 11:05:34AM -0700, Jeff Bailey wrote:
> Hi!  As an attempt to help the glibc/NPTL efforts, I've upgraded to a
> recent kernel in order to make sure problems I'm seeing that are
> triggered by kernel bugs haven't already been fixed.  However, I can no
> longer make it through a glibc make check pass.

Because reduced test cases are cuddly, I have produced one (attached).
=)

I found I could produce the same failure with the ltp testsuite, so I
reduced that instead.

And the failure message again:
root@test148:~/foo# ./adjtimex02
kernel BUG at mm/mmap.c:1970!
Backtrace:
 [<10160978>] exit_mmap+0x16c/0x18c
 [<10124160>] mmput+0x4c/0xc0
 [<101290c0>] do_exit+0x130/0x840
 [<10129860>] do_group_exit+0x6c/0xcc
 [<1010c134>] syscall_exit+0x0/0x14
Kernel panic - not syncing: BUG!
 <3>BUG: scheduling while atomic: adjtimex02/0x00000100/2627
Backtrace:
 [<1010262c>] schedule+0x6d0/0x6f4
 [<10139c54>] flush_cpu_workqueue+0xb8/0x110
 [<1013a164>] cancel_rearming_delayed_workqueue+0x58/0x5c
 [<10238ce4>] lcd_print+0x54/0x1b0
 [<1023a270>] process_shutdown+0x3c/0x6c
 [<1012cf78>] tasklet_action+0x64/0xec
 [<1012cb68>] __do_softirq+0xd8/0x114
 [<10104918>] __lock_text_end+0x48/0x54
 [<1010b068>] intr_return+0x0/0xc

I have updated the system map at
http://people.ubuntu.com/~jbailey/System.map-2.6.18-rc4-pa4
with the one for the kernel recompiled with gcc-3.4.6.

Tks,
Jeff Bailey

-- 
I do not agree with a word you say, but I will defend to the death your
right to say it. 
 - Voltaire

--/9DWx/yDrRhgMJTb
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="mmaptstcase.c"

/*
 * Testcase reduced from ltp, adjtimex02
 *
 * 1) adjtimex(2) fails with errno set to EFAULT if buf does
 *	   not point to writable memory
 */

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/timex.h>

int
main()
{
	struct timex *buffp = (struct timex *) -1;

	/* Check whether we are root */
	if (geteuid() != 0) {
		fprintf(stderr, "This needs to run as root.\n");
		return(-1);
	}
	
	/* Call adjtimex(2) */
	adjtimex(buffp);

	return 0;
}



--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--/9DWx/yDrRhgMJTb--
