Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA01007
	for <parisc-linux@puffin.external.hp.com>; Sat, 6 Nov 1999 12:49:23 -0700
Date: Sat, 6 Nov 1999 19:20:23 +0100
From: Philipp Rumpf <prumpf@mathe.stud.uni-erlangen.de>
To: Alex deVries <adevries@thepuffingroup.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Recent changes
Message-Id: <19991106192023.F11609@mathe.stud.uni-erlangen.de>
References: <199911030250.TAA16563@puffin.external.hp.com> <Pine.LNX.4.10.9911022309430.5997-100000@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.9911022309430.5997-100000@vodka.thepuffingroup.com>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Nov 02, 1999 at 11:14:33PM -0500, Alex deVries wrote:
> ld: Unsatisfied symbols:
>    hpux_brk (code)

Why did the definition of hpux_brk (in kernel/sys_hpux.c) ever vanish ?  Some
time ago, it looked like this:

unsigned long sys_brk(unsigned long addr);

unsigned long hpux_brk(unsigned long addr)
{
        /* Sigh.  Looks like HP/UX libc relies on kernel bugs. */
        return sys_brk(addr + PAGE_SIZE);
}

	Philipp Rumpf
