Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 267824A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Feb 2001 16:04:12 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA07910
	for <parisc-linux@puffin.external.hp.com>; Sun, 11 Feb 2001 15:59:47 -0700
Received: from pc117-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.117)
  by mailserv2.iuinc.com with SMTP; 11 Feb 2001 23:03:58 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 699A1B005; Sun, 11 Feb 2001 23:03:30 +0000 (GMT)
Date: Sun, 11 Feb 2001 23:03:30 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] parisc64 kernel and ret1 (gr29) setup
Message-ID: <20010211230330.E1374@linuxcare.com>
References: <20010207111825.B1374@linuxcare.com> <Pine.LNX.4.21.0102112156190.27808-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0102112156190.27808-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Sun, Feb 11, 2001 at 11:09:32PM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Feb 11, 2001 at 11:09:32PM +1100, Alan Modra wrote:
> On Wed, 7 Feb 2001, Richard Hirst wrote:
> 
> > On Tue, Jan 23, 2001 at 01:45:45PM +0000, Richard Hirst wrote:
> > > Presumably r29 needs initialising on every call from entry.S and syscall.S
> > > to C code, but I'm not over confident about that, so I thought I'd let
> > > others see my diff so far.  Comments?
> > 
> > So, I committed that diff, and have been looking at what happens
> > w.r.t. stack frame setup on interrupts.  All we seem to do is to
> > set sp to the top of task_struct (if in a user context), or move
> > sp up by a struct pt_regs if in kernel space.  In both cases,
> > those values are rounded up (TASK_SZ_ALGN and PT_SZ_ALIGN), so
> > there would probably be some space below sp, but should get_stack
> > be explicity allocating a stack frame really?
> 
> This is a bit interesting.  A called procedure can write into certain
> parts of the caller's stack frame, so we should certainly be allocating
> space for these areas.

We now allocate 64 bytes for 32 bit kernels and 128 bytes for 64 bit
kernels.  In fact, (as jsm pointed out to me) the align macro in
arch/parisc/tools/offset.c allowed for a stack frame in its rounding
up already.  It used to always allow only 64 bytes, but I've changed that
to allow 64 or 128 bytes as required.

Richard
