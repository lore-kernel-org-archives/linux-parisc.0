Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id C639F4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 18:23:29 -0700 (MST)
Date: Mon, 11 Nov 2002 20:23:38 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021112012338.GA14199@systemhalted>
References: <20021111232711.GB12433@systemhalted> <200211120022.gAC0MDQs003494@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211120022.gAC0MDQs003494@hiauly1.hia.nrc.ca>
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

 
 
> I don't believe "fcpy,dbl %%fr0,%%fr0" provides the barrier
> that you want.  The floating-point coprocessor is not required to
> execute instructions sequentially although they must appear
> sequential to software.  The above insn is a nop and the coprocessor
> could throw it away early in the pipeline.

That's what I was beggining to think.
I'll spill it onto the stack as Lamont suggested some time ago.

c.
