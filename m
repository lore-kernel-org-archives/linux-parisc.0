Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id AAE604830
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 May 2003 23:48:23 -0600 (MDT)
Date: Tue, 13 May 2003 22:52:25 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030514055225.GJ548@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] more on canonicalize_funcptr_for_compare
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

The latest glibc on hppa (2.3.1-17) was compiled with a gcc-3.2 which
has the __canonicalize_funcptr_for_compare patch backported from gcc-3.3
... with this new version, some programs will die on startup (e.g. vim).
I traced to a segfault in __canonicalize_funcptr_for_compare. 

The testcase below illustrates the problem:

=====
typedef void (*func_t)(void);

#define N ((func_t)2)

void foo(void) {};

int main(int argc, char **argv)
{
        return (foo == N);
}
=====

this program segfaults when run with:

(gdb) run
Starting program: /home/tausq/sig

Program received signal SIGSEGV, Segmentation fault.
0x00010530 in __canonicalize_funcptr_for_compare ()
(gdb) bt
#0  0x00010530 in __canonicalize_funcptr_for_compare ()
#1  0x000104bc in main (argc=1, argv=0xfaf001b8) at sig.c:9

it seems like the 2 in the constant (N) confuses the comparision
routine. If I change it to 1, everything is ok.... I don't really
understand this tho, because the code for __c_f_f_c has something like:

if ((int) fptr == -1 || (unsigned int) fptr < 4096 || !((int) fptr & 2))
    return (unsigned int) fptr;

so, why doesn't that match the second || case and exit?  (gdb
disassmbly shows that the code tries to dereference the fptr argument
and segfaults)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
