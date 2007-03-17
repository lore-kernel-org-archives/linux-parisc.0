From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] missing system calls ?
Date: Sat, 17 Mar 2007 11:01:18 -0400
Message-ID: <20070317150117.GA10950__47374.9995734126$1416624328$gmane$org@athena.road.mcmartin.ca>
References: <200703171348.56311.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <kyle@athena.road.mcmartin.ca>
In-Reply-To: <200703171348.56311.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Mar 17, 2007 at 01:48:56PM +0100, Helge Deller wrote:

> init/missing_syscalls.h:203:3: warning: #warning syscall sigaction not implemented
> init/missing_syscalls.h:218:3: warning: #warning syscall sigsuspend not implemented
> init/missing_syscalls.h:359:3: warning: #warning syscall sigreturn not implemented

We don't support non-realtime signals (the syscalls are rt_*)

> init/missing_syscalls.h:68:3: warning: #warning syscall umount not implemented

umount2

> init/missing_syscalls.h:248:3: warning: #warning syscall select not implemented

newselect

> init/missing_syscalls.h:269:3: warning: #warning syscall readdir not implemented

obsolete

> init/missing_syscalls.h:308:3: warning: #warning syscall socketcall not implemented

we don't use the socketcall multiplexer (presumably because we don't need
to put the args on the stack) for socket/bind/connect/ etc...

> init/missing_syscalls.h:353:3: warning: #warning syscall ipc not implemented

same story as socketcall, obsolete multiplexed syscall

> init/missing_syscalls.h:749:3: warning: #warning syscall fadvise64 not implemented

sys_fadvise64_64 versus fadvise64 is a reordering of syscall args, presumably
because loff_t is 64bit and needs to be passed in pairs.

> init/missing_syscalls.h:800:3: warning: #warning syscall statfs64 not implemented
> init/missing_syscalls.h:803:3: warning: #warning syscall fstatfs64 not implemented

Your kernel is too old. 2.6.21-rc3 has this.

> init/missing_syscalls.h:809:3: warning: #warning syscall utimes not implemented

Dunno about this one. sys_utimes seems to just call futimesat anyways.

> init/missing_syscalls.h:845:3: warning: #warning syscall kexec_load not implemented

nobody's implemented kexec yet. :)

Cheers,
	Kyle
