From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] missing system calls ?
Date: Sat, 17 Mar 2007 13:48:56 +0100
Message-ID: <200703171348.56311.deller__34071.5101840489$1416624328$gmane$org@gmx.de>
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

I just tested the patch "missing system calls" patch by David Woodhouse (http://thread.gmane.org/gmane.linux.ports.ppc64.devel/16991) 
and the additional patch by David Miller (http://thread.gmane.org/gmane.linux.ports.ppc64.devel/16991/focus=502554) on top of it.
I really liked the patches.

Here is the result for my parisc-linux tree:
init/missing_syscalls.h:68:3: warning: #warning syscall umount not implemented
init/missing_syscalls.h:203:3: warning: #warning syscall sigaction not implemented
init/missing_syscalls.h:218:3: warning: #warning syscall sigsuspend not implemented
init/missing_syscalls.h:248:3: warning: #warning syscall select not implemented
init/missing_syscalls.h:269:3: warning: #warning syscall readdir not implemented
init/missing_syscalls.h:308:3: warning: #warning syscall socketcall not implemented
init/missing_syscalls.h:353:3: warning: #warning syscall ipc not implemented
init/missing_syscalls.h:359:3: warning: #warning syscall sigreturn not implemented
init/missing_syscalls.h:749:3: warning: #warning syscall fadvise64 not implemented
init/missing_syscalls.h:800:3: warning: #warning syscall statfs64 not implemented
init/missing_syscalls.h:803:3: warning: #warning syscall fstatfs64 not implemented
init/missing_syscalls.h:809:3: warning: #warning syscall utimes not implemented
init/missing_syscalls.h:845:3: warning: #warning syscall kexec_load not implemented

Comments ?

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
