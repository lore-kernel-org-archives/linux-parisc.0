Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp8.xs4all.nl (smtp8.xs4all.nl [194.109.127.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 30016482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Sep 2001 23:00:15 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp8.xs4all.nl (8.9.3/8.9.3) with ESMTP id HAA26041
	for <parisc-linux@lists.parisc-linux.org>; Sun, 2 Sep 2001 07:00:10 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Sat, 1 Sep 2001 21:28:35 +0200
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] What's a "Trace/breakpoint trap" and why does he crash my system?
Message-ID: <20010901212835.A18546@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010901155006.A4594@middle.of.nowhere> <20010901203232.A5963@middle.of.nowhere> <20010901201455.M5126@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010901201455.M5126@parcelfarce.linux.theplanet.co.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Sep 01, 2001 at 08:14:55PM +0100, Matthew Wilcox wrote:
> On Sat, Sep 01, 2001 at 08:32:32PM +0200, thunder7@xs4all.nl wrote:
> > should be 'Trace/breakpoint trap'
> 
> hmm.. what version of glibc do you have installed?  something else you
> can do is run strace -ff which will attempt to follow fork/clone/vfork.
> 
2.2.3-9. 2.2.4 is out, I know.

strace -ff:

idle()                                  = 0
fcntl(8, F_SETFD, FD_CLOEXEC)           = 0
SYS_201(0x8, 0x555b0, 0x1000, 0x220e1407, 0) = 72
brk(0x58000)                            = 0x58000
read(4, "", 4096)                       = 0
close(4)                                = 0
munmap(0x4001a000, 4096)                = 0
read(3, "+= drivers/scsi/scsidrv.o\nDRIVER"..., 4096) = 4096
open("arch/parisc/Makefile", O_RDONLY|O_LARGEFILE) = 4
idle()                                  = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001a000
read(4, "#\n# parisc/Makefile\n#\n# This fil"..., 4096) = 3156
pipe([9, 10])                           = 0
fork()                                  = 163
[pid   157] close(10)                   = 0
[pid   157] read(9,  <unfinished ...>
[pid   163] dup2(10, 1)                 = 1
[pid   163] close(10)                   = 0
[pid   163] execve("/usr/local/bin/uname", ["uname", "-m"], [/* 17 vars */]) = -1 ENOENT (No such file or directory)
[pid   163] execve("/usr/bin/uname", ["uname", "-m"], [/* 17 vars */]) = -1074780648
[pid   163] execve("", [ptrace: umoven: Input/output error
0x2], [/* 2 vars */]) = 1073908880
[pid   163] brk(0)                      = 0x23000
[pid   163] open("/etc/ld.so.preload", O_RDONLY) = -1 ENOENT (No such file or directory)
[pid   163] open("/etc/ld.so.cache", O_RDONLY) = 5
[pid   163] idle()                      = 0
[pid   163] mmap(NULL, 6556, PROT_READ, MAP_PRIVATE, 5, 0) = 0x40019000
[pid   163] close(5)                    = 0
[pid   163] open("/lib/libc.so.6", O_RDONLY) = 5
[pid   163] read(5, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2\300"..., 1024) = 1024
[pid   163] idle()                      = 0
[pid   163] mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001b000
[pid   163] mmap(NULL, 1417616, PROT_READ|PROT_EXEC, MAP_PRIVATE, 5, 0) = 0x4002a000
[pid   163] mprotect(0x40167000, 119184, PROT_NONE) = 0
[pid   163] mmap(0x40176000, 45056, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 5, 0x13c000) = 0x40176000
[pid   163] mmap(0x40181000, 12688, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40181000
[pid   163] close(5)                    = 0
[pid   163] mprotect(0x10000, 12288, PROT_READ|PROT_WRITE) = 0
[pid   163] mprotect(0x10000, 12288, PROT_READ|PROT_EXEC) = 0
[pid   163] munmap(0x40019000, 6556)    = 0
[pid   163] getpid()                    = 163
[pid   163] brk(0)                      = 0x23000
[pid   163] brk(0x23030)                = 0x23030
[pid   163] brk(0x24000)                = 0x24000
[pid   163] newuname({sys="Linux", node="pa8200", ...}) = 0
[pid   163] idle()                      = 0
[pid   163] mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
[pid   163] write(1, "parisc\n", 7)     = 7
[pid   163] close(1)                    = 0
[pid   163] munmap(0x40019000, 4096)    = 0
[pid   163] exit(0)                     = ?
<... read resumed> "parisc\n", 200)     = 7
--- SIGCHLD (Child exited) ---
rt_sigreturn(0

Jurriaan
-- 
Treachery, treachery I fear; treachery of that miserable creature.
	JRR Tolkien - The Lord of the Rings.
GNU/Linux 2.4.9-ac5 SMP/ReiserFS 2x1402 bogomips load av: 0.09 0.09 0.02
