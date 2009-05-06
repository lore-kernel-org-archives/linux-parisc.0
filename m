From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Random memory corruption with 64-bit SMP 2.6.30-rc4
Date: Tue, 5 May 2009 21:51:35 -0400 (EDT)
Message-ID: <20090506015136.A36034FAF@hiauly1.hia.nrc.ca>
References: <49FFEA3A.4080902@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49FFEA3A.4080902@gmx.de> from "Helge Deller" at May 5, 2009 09:26:50 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Could it be, that always r21 and r22 are involved?
> Maybe we don't restore them correctly after some syscalls like fork / getpwnam...?
> Esp. the comment for r21-r22 in arch/parisc/kernel/entry.S:1708 seems interesting:
> 
>         /* Register saving semantics for system calls:
> 
>            %r1             clobbered by system call macro in userspace
>            %r2             saved in PT_REGS by gateway page
>            %r3  - %r18     preserved by C code (saved by signal code)
>            %r19 - %r20     saved in PT_REGS by gateway page
>            %r21 - %r22     non-standard syscall args
>                            stored in kernel stack by gateway page

This is only true for r21 and r22 with a 32-bit kernel (see syscall.S:176).
However, the argument locations might get mixed up if one wasn't careful.
The getpwent bug occurs with both 32 and 64-bit kernels on the c3750.

I guess I should test a UP kernel on the rp3440.  I have never seen
the getpwent bug on the rp3440.  I don't see the memory corruption
on the c3750 (gcc builds without problems using 2.6.30-rc4).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
