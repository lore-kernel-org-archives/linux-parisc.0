Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E8A93482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 19 Aug 2001 04:18:43 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15YPf8-0002zf-00; Sun, 19 Aug 2001 11:18:34 +0100
Date: Sun, 19 Aug 2001 11:18:34 +0100
From: Matthew Wilcox <willy@debian.org>
To: Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
Cc: parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	matt@lackof.org, gcc@packages.debian.org, ossama@debian.org
Message-ID: <20010819111834.C14486@parcelfarce.linux.theplanet.co.uk>
References: <01081912061400.01092@octopus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01081912061400.01092@octopus>; from Reinhard.Gimbel@freenet.de on Sun, Aug 19, 2001 at 12:07:27PM +0200
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Re: [palinux-0.9.2] Where are the compilers (c, c++) ?
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Aug 19, 2001 at 12:07:27PM +0200, Reinhard Gimbel wrote:
> After successfully installing palinux-0.9.2 on my 715/64
> I'm looking for the compilers (c, c++) ...

It looks like you didn't add the debian apt sources to your
/etc/apt/sources.list.  binutils is at 2.11.90.0.27-1 currently,
for example.  Make sure you have gcc-3.0 installed (from the archive;
current version for hppa is 3.0.1-0pre010811).

-- 
Revolutions do not require corporate support.
