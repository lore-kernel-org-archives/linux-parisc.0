Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E85A4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Aug 2002 07:24:33 -0600 (MDT)
Date: Tue, 20 Aug 2002 09:22:13 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Christophe Rhodes <csr21@cam.ac.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] mcontext registers on parisc64 
Message-ID: <20020820132213.GA4865@systemhalted>
References: <20020817220545.GF16532@systemhalted> <20020820114935.GA27316@cam.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020820114935.GA27316@cam.ac.uk>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> 
> Inspecting the sigcontext that I get on a parisc64 machine gives
> register contents looking a bit like
>     [...]
>     0xffffffff, 0xdeadbeef, 0x0, 0xf00d, 0x0, 0xfaf00380, 0x0, 0x2097a, 0x0, 
>     0xfaf001a4, 0x0, 0x2096a, 0x0, 0x1, 0x0, 0x20972, 0x0, 0x1, 0x0, 0x0, 0x0, 
>     [...]
> 
> and the alternation of data, 0/-1 is what leads me to believe that
> 64-bit quantities are being delivered; userland only seems to know about
> 32-bits, though.
> 
> Please don't hesitate to get back to me with comments and/or criticisms,
> 
> Cheers,
> Christophe

This might be a kernel bug. We should always return 32-bit quantities to 
userspace (until we get a 64-bit userspace :).

Once we straighten out the sigcontext->mcontext_t issue in glibc, we can
take a look at this. I might just patch glibc on my box tonight... and go
forward with hacking on the kernel bits.

c.
