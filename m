Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A2164A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Feb 2001 05:10:38 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA06598
	for <parisc-linux@puffin.external.hp.com>; Sun, 11 Feb 2001 05:06:14 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 11 Feb 2001 12:10:23 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id XAA24811;
	Sun, 11 Feb 2001 23:09:33 +1100
Date: Sun, 11 Feb 2001 23:09:32 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] parisc64 kernel and ret1 (gr29) setup
In-Reply-To: <20010207111825.B1374@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0102112156190.27808-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 7 Feb 2001, Richard Hirst wrote:

> On Tue, Jan 23, 2001 at 01:45:45PM +0000, Richard Hirst wrote:
> > Presumably r29 needs initialising on every call from entry.S and syscall.S
> > to C code, but I'm not over confident about that, so I thought I'd let
> > others see my diff so far.  Comments?
> 
> So, I committed that diff, and have been looking at what happens
> w.r.t. stack frame setup on interrupts.  All we seem to do is to
> set sp to the top of task_struct (if in a user context), or move
> sp up by a struct pt_regs if in kernel space.  In both cases,
> those values are rounded up (TASK_SZ_ALGN and PT_SZ_ALIGN), so
> there would probably be some space below sp, but should get_stack
> be explicity allocating a stack frame really?

This is a bit interesting.  A called procedure can write into certain
parts of the caller's stack frame, so we should certainly be allocating
space for these areas.

A 64 bit stack frame looks like:

	|----------------------------------|
psp ->	|       Register Spill Area        | variable size
	|----------------------------------|
	|       Local Storage Area         | variable size
	|----------------------------------|
	|      Dynamic Storage Area        | variable size
	|----------------------------------|
	| Outgoing Register Parameter Area | 64 bytes
        | arg word 0                       |
        | arg word 1                       |
        | arg word 2                       |
        | arg word 3                       |
	|----------------------------------|
ap ->	|  Outgoing Stack Parameter Area   | variable size
        | arg word 4                       |
        | .                                |
        | arg word n-1                     |
	|----------------------------------|
	|          Frame Marker            | 16 bytes
	| rp                               |
	| psp                              |
        |----------------------------------|
sp ->

Any of the variable size areas may be zero size.  ap (%r29) points to
first byte of outgoing stack param area, and sp (%r30) points to first
byte of free stack area.  Stack grows up to increasing memory addresses.
Actual arg locations are as shown for 64 bit and smaller args.  The
mapping from args to arg words gets a little tricky with larger argument
sizes.

The areas written by the called function are the frame marker (rp save),
and the outgoing register parameter area.  This means we ought to be
allocating 80 bytes past the end of struct pt_regs, although it's likely
the register parameter area is never written.


32-bit stack frames look like:

	|----------------------------------|
psp ->	|       Register Spill Area        | variable size
	|----------------------------------|
	|       Local Storage Area         | variable size
	|----------------------------------|
	|      Dynamic Storage Area        | variable size
	|----------------------------------|
	|  Outgoing Stack Parameter Area   | variable size
        | arg word n-1                     |
        | .                                |
        | arg word 4                       |
	|----------------------------------|
	| Outgoing Register Parameter Area | 32 bytes
        | arg word 3                       |
        | arg word 2                       |
        | arg word 1                       |
        | arg word 0                       |
	|----------------------------------|
	|          Frame Marker            | 32 bytes
	| External Data Pointer (DP)       |
	| External sr4                     |
	| External/stub RP (RP')           |
	| Current RP                       |
	| Static Link                      |
	| Clean up                         |
	| Calling Stub RP (RP'')           |
	| Previous SP                      |
        |----------------------------------|
sp ->

Again, it is the frame marker and outgoing register param area that may be
written by the called function, so here we should allocate 64 bytes past
the end of struct pt_regs.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
