Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id B08E04829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 12 Jan 2003 02:00:38 -0700 (MST)
Date: Sun, 12 Jan 2003 00:57:50 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030112085750.GG1177@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] problem with our syscall() implementation
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

glibc provides an interface to call a system call from userspace
directly using the syscall() function.  The glibc exported interface for
syscall() is variadic (int syscall(int sysno, ...))

for hppa, the implementation has this prototype:

int syscall (int sysnum, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5)

one problem with this is that one cannot reliably pass 64-bit values
into the kernel. for example, if i want to call a syscall with this
signature:

sys_foo(uint64_t x, int y, int z)
(let's say sys_foo has syscall number 300)

the x argument does not end up in arg0... instead it seems to be spread
across arg1 and arg2 (because of register alignment, i suppose)

is there any way to write syscall() so that we can pass 64-bit values
reliably?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
