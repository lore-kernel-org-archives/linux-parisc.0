Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id A38E84A19
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Feb 2001 04:18:23 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA09416
	for <parisc-linux@puffin.external.hp.com>; Wed, 7 Feb 2001 04:14:06 -0700
Received: from pc117-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.117)
  by mailserv2.iuinc.com with SMTP; 7 Feb 2001 11:18:21 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id E87D3B005; Wed,  7 Feb 2001 11:18:25 +0000 (GMT)
Date: Wed, 7 Feb 2001 11:18:25 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] parisc64 kernel and ret1 (gr29) setup
Message-ID: <20010207111825.B1374@linuxcare.com>
References: <20001221160006.W2554@linuxcare.com> <20010123134545.W3571@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010123134545.W3571@linuxcare.com>; from rhirst@linuxcare.com on Tue, Jan 23, 2001 at 01:45:45PM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jan 23, 2001 at 01:45:45PM +0000, Richard Hirst wrote:
> Presumably r29 needs initialising on every call from entry.S and syscall.S
> to C code, but I'm not over confident about that, so I thought I'd let
> others see my diff so far.  Comments?

So, I committed that diff, and have been looking at what happens
w.r.t. stack frame setup on interrupts.  All we seem to do is to
set sp to the top of task_struct (if in a user context), or move
sp up by a struct pt_regs if in kernel space.  In both cases,
those values are rounded up (TASK_SZ_ALGN and PT_SZ_ALIGN), so
there would probably be some space below sp, but should get_stack
be explicity allocating a stack frame really?

Richard
