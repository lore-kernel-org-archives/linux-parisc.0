Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D2ECD4A19
	for <parisc-linux@parisc-linux.org>; Sat, 24 Feb 2001 14:22:41 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14WlWX-0006d0-00; Sat, 24 Feb 2001 20:42:37 +0000
Date: Sat, 24 Feb 2001 20:42:37 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org,
	grundler@milano.cup.hp.com
Subject: Re: [parisc-linux] parisc64 vs kernel64
Message-ID: <20010224204237.A22753@parcelfarce.linux.theplanet.co.uk>
References: <20010223085815.B16261@parcelfarce.linux.theplanet.co.uk> <200102232212.OAA21472@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200102232212.OAA21472@milano.cup.hp.com>; from grundler@cup.hp.com on Fri, Feb 23, 2001 at 02:12:22PM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Feb 23, 2001 at 02:12:22PM -0800, Grant Grundler wrote:
> How much is driven by how gcc/binutils/config.guess type stuff works?

Nothing.

> We've made an effort to keep them the same. That's why most of the
> files are common. The fact that PA2.0 cpus can run PA1.1 kernel bits
> makes it easy for us. I'm *know* the R4000 MIPs processor had
> good backwards compatibility between 32/64-bit - don't know about
> later ones or Sparc/Sparc64.

We had a discussion of this in the meeting, but it's worth mentioning for
the record.  Ralf had two teams of people pulling at him -- one was the embedded
MIPS people who wanted to keep everything simple and small, and the other
was SGI who wanted 64-bit, SMP, scalability.  So MIPS vs MIPS64 is also a
tradeoff between make-it-small and make-it-fast.

For both Sparc & MIPS there was also the opportunity to discard
backwards-compatibility stuff.  Compare the Sparc64 and Sparc32 atomic_t
operations.  The changes between PA-RISC and PA-RISC64 really aren't
as major.  There aren't many places we could remove cruft by guaranteeing
we're omitting certain types of processor.

It would almost certainly make sense to have a `parisc1.0' architecture
if someone were crazy enough to do that :-)

> The Processor family selection is a good idea regardless of
> how arch/parisc* source is organized.

Thanks.

-- 
Revolutions do not require corporate support.
