Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3EBA5482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Oct 2001 11:28:41 -0600 (MDT)
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m15vMOn-000OzIC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Oct 2001 11:28:33 -0600 (MDT)
Message-Id: <m15vMOn-000OzIC@bame.riverrock.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Steve.Grady@csiro.au, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Large SCSI disks on a 735/125 
In-Reply-To: Your message of "Sat, 20 Oct 2001 23:22:31 BST."
             <20011020232231.D31505@parcelfarce.linux.theplanet.co.uk>
References: <49AA3A3C863E5B4C911320AEF99E5DA3010CCBC0@wing-ep.tip.csiro.au>  <20011020232231.D31505@parcelfarce.linux.theplanet.co.uk> 
Date: Sun, 21 Oct 2001 11:28:33 -0600
From: Paul Bame <bame@riverrock.org>
List-ID: <linux-parisc.vger.kernel.org>

> The only thing to beware of is that palo can only access the first
> 2GB of the disc, so the kernel that it loads has to be in this area.
> It is possible to fix palo to work for >2GB partitions, but nobody's
> done that yet.

The firmware call which supports >2GB access may not be available
in that box -- I'm not sure when it became available.  Linux will
have no problem accessing the whole drive however.

	-P
