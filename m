Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id A8428482B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Jul 2001 09:35:12 -0600 (MDT)
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, lamont@hp.com
Subject: B132 dies too (was Re: [parisc-linux] 2.4.6-pa5 crashes on B160L)
In-reply-to: Your message of "Sun, 08 Jul 2001 17:31:25 MDT."
             <200107082331.RAA09058@puffin.external.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Mon, 09 Jul 2001 09:34:38 -0600
From: LaMont Jones <lamont@hp.com>
Message-Id: <20010709153451.4D2731872C@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

My B132 (which works 2.4.0) crashes sometime between palo launching the
kernel, and it having a working console (serial).  That is to say, no info
at all.  If someone wants the machine in order to debug it, just holler...

> If one is really good (like jsm) and has a matching vmlinux and System.map,
> one can backtrace the stack by hand by looking at stack frame (return pointer
> is in the stack frame) and seeing how much each subroutine grows the stack
> (look at code around subroutine call, iirc). I think the mail archives
> have a concise desription of exactly how to use the stack dump.
> But I am too lazy to look for it now.

Backtracing is extremely straight-forward, and can be automated, AFAIK.
Walking the stack forward is a bit more challenging, but not entirely
beyond possibility most of the time...

lamont
