Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 20E93482A
	for <parisc-linux@parisc-linux.org>; Tue,  1 May 2001 00:06:00 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14uTI8-0004iv-00; Tue, 01 May 2001 07:05:44 +0100
Date: Tue, 1 May 2001 07:05:44 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: amodra@one.net.au
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] pt-initfini.c
Message-ID: <20010501070544.G18144@parcelfarce.linux.theplanet.co.uk>
References: <20010428234019.D15328@parcelfarce.linux.theplanet.co.uk> <20010430235755.E2487@squeak.one.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010430235755.E2487@squeak.one.net.au>; from amodra@one.net.au on Mon, Apr 30, 2001 at 11:57:55PM +0930
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Apr 30, 2001 at 11:57:55PM +0930, amodra@one.net.au wrote:
> I've checked in a new file to pehc glibc CVS, merge_GLIBC_CVS_20010424
> branch.  If anyone wants to try it,
> 
>  ** YOU'LL NEED NEW BINUTILS **
> 
> from any of the usual CVS repositories, because I got rid of a wart
> in initfini.c as well.  Don't say you haven't been warned.

I built new binutils, but this new initfini seems to make ld.so crash
earlier, and it takes gdb with it.  Reverting to the older initfini
makes ld.so get as far as it did before, and it doesn't take gdb with it.

-- 
Revolutions do not require corporate support.
