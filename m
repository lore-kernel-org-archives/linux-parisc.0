Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.frii.net (deimos.frii.com [216.17.128.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC5BE482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 May 2001 12:28:25 -0600 (MDT)
Message-Id: <m154RjN-001VltC@bame.riverrock.org>
To: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@EUROPAY.COM>
Cc: "'Matthew Wilcox'" <matthew@wil.cx>,
	parisc-linux@lists.parisc-linux.org, bame@www.riverrock.org
Subject: Re: [parisc-linux] Palo: how-to reinstall 
In-Reply-To: Message from =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@EUROPAY.COM>
   of "Mon, 28 May 2001 20:01:13 +0200." <A4A5E4C468B5D11190220001FA6835DD04DD8942@EPIXCH003>
References: <A4A5E4C468B5D11190220001FA6835DD04DD8942@EPIXCH003> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 28 May 2001 12:27:05 -0600
From: Paul Bame <bame@riverrock.org>
List-ID: <linux-parisc.vger.kernel.org>

> Dear Matt,
> 
> I have to reinstall my root fs after some fatal mistakes. And I discover a
> may25-3-wide raw and try it.
> 
> Just a problem when it try to reinstall palo (a had also this problem
> before).
> My system disk was already made bootable with palo and I do not want
> re-format the all disk because of some other fs containing some packages and
> test I do not want to loose.
> 
> Is there any tips to re-install palo on a working disk (writing 512 null
> char at the beginning of the disk with dd?)?

The palo Debian package does nothing to your disk when it is installed.  This
will eventually change I think but not soon.

Palo does not modify the disk partition table, only the contents of the F0
partition and some parameters needed by the HP boot ROM.

I do not understand your problem -- can you give more details?

	-Paul Bame
