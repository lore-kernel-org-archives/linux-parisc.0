Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0729482B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  8 Apr 2001 07:25:17 -0600 (MDT)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id XAA10496;
	Sun, 8 Apr 2001 23:24:56 +1000
Date: Sun, 8 Apr 2001 23:24:56 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Wragg <dpw@doc.ic.ac.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Assembly language conventions
In-Reply-To: <y7rvgofo9wx.fsf@sytry.doc.ic.ac.uk>
Message-ID: <Pine.LNX.4.21.0104082301320.7887-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 8 Apr 2001, David Wragg wrote:

> Where should I look for details of the assembly language conventions
> used on linux/PARISC (calling conventions, register uses, sequences
> for putting a 32-bit constant into a register, PIC conventions, etc.)?
> 
> The nearest thing I have found is
> <http://devresource.hp.com/STK/toc_ref_details.html#32runtime11>, but
> I'm not sure how much of that carries over to the Linux port.

Most of it regarding register usage and calling conventions.  Some
differences that spring to mind:

o  pa-linux sets all space regs the same (so simpler import stubs for
   shared libs can be used, and export stubs aren't necessary)
o  pa-linux doesn't support argument relocation stubs.  Compile with
   prototypes!
o  section names follow standard ELF naming.

If you want to learn tricks of assembly language programming on parisc,
like loading a 32 bit constant into a reg, take a look at gcc -S
output.  gcc is useful for finding details of calling conventions too.

Alan
