From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] fstatat64 and newfstatat syscalls
Date: Sat, 23 Dec 2006 00:49:41 +0100
Message-ID: <200612230049.41484.deller__10694.0290461809$1416624239$gmane$org@gmx.de>
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

Hi Grant,

I think we have some wrong assignments with above $TOPIC syscalls.

I found this mail and CVS patch from you:
http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2006-February/036543.html
http://cvs.parisc-linux.org/linux-2.6/arch/parisc/kernel/syscall_table.S.diff?cvsroot=&r1=1.22&r2=1.23

but currently we have:
arch/parisc/kernel/syscall_table.S:		ENTRY_SAME(fstatat64)           /* 280 */
while in:
include/asm-parisc/unistd.h:			#define __NR_newfstatat         (__NR_Linux + 280)

Helge

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
