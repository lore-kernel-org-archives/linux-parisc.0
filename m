Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp9.xs4all.nl (smtp9.xs4all.nl [194.109.127.135])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0BB28482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Sep 2001 13:09:49 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp9.xs4all.nl (8.9.3/8.9.3) with ESMTP id VAA29012
	for <parisc-linux@lists.parisc-linux.org>; Sat, 1 Sep 2001 21:09:40 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Sat, 1 Sep 2001 20:32:32 +0200
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] What's a "Trace/breakpoint trap" and why does he crash my system?
Message-ID: <20010901203232.A5963@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010901155006.A4594@middle.of.nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010901155006.A4594@middle.of.nowhere>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Sep 01, 2001 at 03:50:06PM +0200, thunder7@xs4all.nl wrote:
> Well, I can boot 2.4.9-pa13 just fine on my C200, but trying to compile
> a kernel under that version never works, typing
> 
> make proper
> 
> in the source directory doesn't produce any output but
> 
> Trace/breakpoint error

should be 'Trace/breakpoint trap'
> 
> after one second or so.
> 
> I realize this is a worthless bug-report, but where does that message
> come from? The text is nowhere in the kernel-sources, so it must be
> something else.
> 
I tried running make under strace, and it ran fine. So I tried it again,
and I saw this:

--- SIGCHLD (Child exited) ---
rt_sigreturn(0)                         = -1 EINTR (Interrupted system call)
read(4, "", 193)                        = 0
close(4)                                = 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) == 0], 0, NULL) = 265
pipe([4, 5])                            = 0
fork()                                  = 268
close(5)                                = 0
read(4, "/bin/sh\n", 200)               = 8
read(4, "", 192)                        = -512
--- SIGCHLD (Child exited) ---
rt_sigreturn(0)                         = -1 EINTR (Interrupted system call)
read(4, "", 192)                        = 0
close(4)                                = 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) == 0], 0, NULL) = 268
pipe([4, 5])                            = 0
fork()                                  = 269
--- SIGCHLD (Child exited) ---
rt_sigreturn(0)                         = 269
close(5)                                = 0
read(4, "/home/jurriaan/source/linux-2001"..., 200) = 37
read(4, "", 163)                        = 0
close(4)                                = 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) == 0], 0, NULL) = 269
read(3, "+= drivers/scsi/scsidrv.o\nDRIVER"..., 4096) = 4096
brk(0x4b000)                            = 0x4b000
brk(0x4c000)                            = 0x4c000
open("arch/parisc/Makefile", O_RDONLY|O_LARGEFILE) = 4
idle()                                  = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001a000
read(4, "#\n# parisc/Makefile\n#\n# This fil"..., 4096) = 3156
pipe([5, 6])                            = 0
fork()                                  = 270
close(6)                                = 0
read(5, "", 200)                        = -512
--- SIGCHLD (Child exited) ---
rt_sigreturn(0

and then it hang. On reboot, it gave the same 'Trace/breakpoint trap'
error, but didn't hang. Next time I tried it, it did hang.

Jurriaan
-- 
`That right?' Hawk gave MacReady a long, thoughtful look.
`I'll have to remember that.'
	Simon R Green - Hawk & Fisher II Fear and Loathing in Haven
GNU/Linux 2.4.9-ac5 SMP/ReiserFS 2x1402 bogomips load av: 0.05 0.15 0.08
