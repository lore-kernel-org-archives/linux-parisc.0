Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2069B482B
	for <parisc-linux@parisc-linux.org>; Fri, 28 Dec 2001 03:23:40 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Date: Fri, 28 Dec 2001 11:23:37 +0100
Cc: parisc-linux@parisc-linux.org
References: <200112272023.fBRKN4g21408@localhost.localdomain>
In-Reply-To: <200112272023.fBRKN4g21408@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <E16JuAr-0001w8-00@linuxlab.wdf.sap-ag.de>
Subject: [parisc-linux] Re: rmmod lasi700 hangs the machine
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

Hi James,

After adding the disable_irq(host->irq); to the lasi700 driver
the kernel no longer crashes, but the rmmod command now
hangs and doesn't return. The good thing is, that I now could
log in on anther terminal and get some (hopefully) useful info
for you:

All info below are taken after the "rmmod lasi700" command:

hw1306:d036493> lsmod
Module                  Size  Used by   
lasi700                 1908   0 (deleted)
53c700                 28396   0 [lasi700]

d036493@hw1306:/ > pstree -ap
init,1)
  |-atd,312)
  |-(keventd,2)
  |-(kjournald,7)
  |-..........
  |-(scsi_eh_1,402)     <- is this normal ??
  |-sshd,298)
  |   |-sshd,367)
  |   |   `-csh,368)
  |   |       `-bash,391)
  |   |           `-rmmod,404) lasi700


hw1306:~# strace rmmod lasi700
execve("/sbin/rmmod", ["rmmod", "lasi700"], [/* 14 vars */]) = 0
newuname({sys="Linux", node="hw1306", ...}) = 0
brk(0)                                  = 0x45000
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 34267, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40019000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2?@"..., 1024) = 1024
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40022000
mmap(NULL, 1404268, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4002a000
mprotect(0x40164000, 118124, PROT_NONE) = 0
mmap(0x40173000, 45056, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0x139000) = 0x40173000
mmap(0x4017e000, 11628, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4017e000
close(3)                                = 0
munmap(0x40019000, 34267)               = 0
query_module(NULL, 0, NULL, 0)          = 0
brk(0)                                  = 0x45000
brk(0x45120)                            = 0x45120
brk(0x46000)                            = 0x46000
query_module(NULL, QM_MODULES, { /* 6 entries */ }, 6) = 0
query_module("lasi700", QM_INFO, {address=0x870000, size=1908, flags=MOD_RUNNING, usecount=0}, 16) = 0
query_module("lasi700", QM_SYMBOLS, { /* 5 entries */ }, 5) = 0
query_module("53c700", QM_INFO, {address=0x868000, size=28396, flags=MOD_RUNNING|MOD_USED_ONCE, usecount=0}, 16) = 0
query_module("53c700", QM_SYMBOLS, { /* 7 entries */ }, 7) = 0
query_module("nfsd", QM_INFO, {address=0x854000, size=75216, flags=MOD_RUNNING|MOD_AUTOCLEAN|MOD_VISITED|MOD_USED_ONCE, usecount=8}, 16) = 0
query_module("nfsd", QM_SYMBOLS, { /* 4 entries */ }, 4) = 0
query_module("lockd", QM_INFO, {address=0x846000, size=51400, flags=MOD_RUNNING|MOD_AUTOCLEAN|MOD_VISITED|MOD_USED_ONCE, usecount=1}, 16) = 0
brk(0x47000)                            = 0x47000
query_module("lockd", QM_SYMBOLS, { /* 9 entries */ }, 9) = 0
query_module("sunrpc", QM_INFO, {address=0x834000, size=66284, flags=MOD_RUNNING|MOD_AUTOCLEAN|MOD_VISITED|MOD_USED_ONCE, usecount=1}, 16) = 0
query_module("sunrpc", QM_SYMBOLS, 0x46270, 1024, 1719) = -1 ENOSPC (No space left on device)
query_module("sunrpc", QM_SYMBOLS, { /* 68 entries */ }, 68) = 0
query_module("autofs", QM_INFO, {address=0x830000, size=11508, flags=MOD_RUNNING|MOD_AUTOCLEAN|MOD_VISITED|MOD_USED_ONCE, usecount=2}, 16) = 0
query_module("autofs", QM_SYMBOLS, { /* 22 entries */ }, 22) = 0
brk(0x4c000)                            = 0x4c000
query_module(NULL, QM_SYMBOLS, 0x46d40, 16384, 22587) = -1 ENOSPC (No space left on device)
brk(0x52000)                            = 0x52000
query_module(NULL, QM_SYMBOLS, { /* 984 entries */ }, 984) = 0
delete_module("lasi700"
<here it hangs>

Sadly I don't have a gdb here...

Helge


On Thursday 27 December 2001 21:23, James Bottomley wrote:
> As Grant says, its hard to debug this type of thing.  However, I do have a
> theory:  The free_irq() call in parisc doesn't do an irq shutdown (which
> disables the irq).  This looks like an omission, since I thought the
> behaviours of the arch irq.c's were all converging.  It is possible that an
> unhandled interrupt would cause the type of problem you describe
>
> A simple test of the theory is to try the attached patch and see if that
> fixes the problem.  If that doesn't work, I'll try to reproduce (although
> this will take a while since I'll have to construct an NFS boot
> environment).
>
> James
