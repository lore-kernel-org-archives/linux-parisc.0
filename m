From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] bug in arg checking in clone.S ?
Date: Sun, 8 Jan 2006 02:41:07 -0500
Message-ID: <200601080241.07960.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_TIMwDehoF7TKqnn"
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

--Boundary-00=_TIMwDehoF7TKqnn
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

for some reason the attached test case (originally from LTP) segfaults on 
glibc/hppa systems ... every other arch ive tested on works fine ...

for example, a good run would be:
$ gcc errno.c -o errno ; ./errno ; echo $?
0

on hppa, i get:
$ gcc errno.c -o errno ; ./errno ; echo $?
Segmentation fault

tested on Debian (glibc 2.3.5-11) and Gentoo (glibc 2.3.4.20040808-r1), both 
fail in the same way:
Program received signal SIGSEGV, Segmentation fault.
0x40538990 in __errno_location () from /lib/libc.so.6
(gdb) bt
#0  0x40538990 in __errno_location () from /lib/libc.so.6
#1  0x40538748 in __libc_start_main () from /lib/libc.so.6
#2  0x00010644 in main ()
-mike

--Boundary-00=_TIMwDehoF7TKqnn
Content-Type: text/x-csrc;
  charset="us-ascii";
  name="errno.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="errno.c"

/* based originally on one the clone tests in the LTP */

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sched.h>

int child_fn(void *arg)
{
	fprintf(stderr, "in child_fn\n");
	exit(1);
}

int main(void)
{
	int r_clone, ret_errno;

	r_clone = clone(child_fn, NULL, (int) NULL, NULL);
	ret_errno = errno;
	if (ret_errno != EINVAL || r_clone != -1) {
		fprintf(stderr, "clone: res=%d (wanted -1) errno=%d (wanted %d)\n",
			r_clone, errno, EINVAL);
		return 1;
	}

	return 0;
}

--Boundary-00=_TIMwDehoF7TKqnn
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_TIMwDehoF7TKqnn--
