Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cyrix.home.bogus (Taggart.cwx.net [216.17.176.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5AD3F482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 19 Aug 2001 13:49:51 -0600 (MDT)
To: Reinhard.Gimbel@freenet.de
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, matt@lackof.org,
	gcc@packages.debian.org, ossama@debian.org
In-Reply-To: Message from Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
   of "Sun, 19 Aug 2001 21:10:25 +0200." <01081921102500.00948@octopus>
References: <01081912061400.01092@octopus> <20010819111834.C14486@parcelfarce.linux.theplanet.co.uk>  <01081921102500.00948@octopus> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 19 Aug 2001 13:50:00 -0600
From: Matt Taggart <matt@lackof.org>
Message-Id: <20010819195001.180A612280B@cyrix.home.bogus>
Subject: [parisc-linux] Re: [palinux-0.9.2] Where are the compilers (c, c++) ?
List-ID: <linux-parisc.vger.kernel.org>

Reinhard Gimbel writes...

> The folder tree below  
> 'ftp://ftp.debian.org/debian/dists/sid/binary-hppa' holds only 
> a few deb-files (no C compilers as I would need to solve my 
> problem) which mainly are links to binary-all.

That's because everything lives in the pool now( see 
http://ftp.de.debian.org/debian/pool/ ). You need to add this line to your 
/etc/apt/sources.list,

deb http://ftp.de.debian.org/debian unstable main non-free contrib

Then run,

apt-get update
apt-get upgrade

That will get you everything you need in order to use the unofficial 
binutils-hppa64 and gcc-hppa64 debs that are on the CD so that you can build a 
64 bit kernel.

Eventually the hppa64 cross-compilers will be in the Debian archive, but not 
until they can be built in a clean/sane fashion. For now just keep using the 
ones on the CD also available at,

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/unofficial-debs/

HTH,

-- 
Matt Taggart
matt@lackof.org
