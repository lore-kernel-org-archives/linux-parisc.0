Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E87AC4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Feb 2001 08:59:25 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14SLNn-0002Rd-00; Mon, 12 Feb 2001 15:59:19 +0000
Date: Mon, 12 Feb 2001 15:59:19 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: "M. Grabert" <xam@deathsdoor.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ASP Parallel port driver broken on HP9000/730
Message-ID: <20010212155919.B7969@parcelfarce.linux.theplanet.co.uk>
References: <200102090338.TAA07555@milano.cup.hp.com> <Pine.LNX.4.21.0102112112310.9410-100000@sgate.charlysworld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0102112112310.9410-100000@sgate.charlysworld.de>; from xam@deathsdoor.com on Sun, Feb 11, 2001 at 09:16:39PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Feb 11, 2001 at 09:16:39PM +0100, M. Grabert wrote:
> On Thu, 8 Feb 2001, Grant Grundler wrote:
> 
> > echo 0xe840c000=i | adb   says:
> > 		BV              r0(r2)
> > 
> > GR02 is the most recent subroutine call return addr.
> > (Typically the caller).
> > 
> > So look up c026e458 and c0246328 in your System.map.
> > You can at least figure out about where it's crashing.
> 
> done that (I also checked that is is the correct System.map),
> but there is no entry for c026e458 and c0246328 !!!

no, there wouldn't be.  the addresses in System.map are the start of
each function.  so the address below c026e458 will be the address of
the function which made the call.

Matthew `Give a man a match and you warm him for an hour; dose him in
petrol first and you warm him for the rest of his life'

-- 
Revolutions do not require corporate support.
