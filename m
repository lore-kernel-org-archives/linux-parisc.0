Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id A35B0482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Jul 2001 07:11:29 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 2158BB00C; Tue, 10 Jul 2001 14:10:16 +0100 (BST)
Date: Tue, 10 Jul 2001 14:10:16 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "Pedot, Wolfgang" <wpedot@harris.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Install on a 715/75 (wont boot)
Message-ID: <20010710141016.B23509@linuxcare.com>
References: <8D4C69676E66D511A1CB00508BBBB192162681@ranmx1.ran.harris.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <8D4C69676E66D511A1CB00508BBBB192162681@ranmx1.ran.harris.com>; from wpedot@harris.com on Tue, Jul 10, 2001 at 02:45:59AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jul 10, 2001 at 02:45:59AM -0400, Pedot, Wolfgang wrote:
> Hi,
> 
> I just dug out a 715/75 at work (64MB RAM, 2x1GB HD). Now I´ve cleaned it and
> brought it to live I want to install Linux but the problem is neither 0.9 nor
> 0.9.1 (downloaded yesterday) boots. I connected an external SCSI-CDRom (Toshiba
> 6401) and the 715 detects it and I can tell it to boot from this drive but I get
> an IPL Checksum Error with 0.9 (tried with two CDs) and "Wrong IPL Magic" with
> 0.9.1. Both Images were downloaded and burned correctly as far as I can tell.
> Now since this is my first experience with a PARISC-Machine I´m a little bit
> helpless, any hints?

For 0.9.1 it sounds like you picked up one of the broken versions
of the ISO.  A new image was posted yesterday, so if you downloaded
before that, please try again.

0.9 didn't work on 715/75 anyway, but I would not have expected your
particular error.

I have never booted my 715/75 from CD; I've always booted it from
the network.  The README on the CD should explain (briefly) how to
do that.

Richard
