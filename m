Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mout0.freenet.de (mout0.freenet.de [194.97.50.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC739482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 19 Aug 2001 13:10:32 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
Reply-To: Reinhard.Gimbel@freenet.de
To: Matthew Wilcox <willy@debian.org>
Date: Sun, 19 Aug 2001 21:10:25 +0200
Cc: parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	matt@lackof.org, gcc@packages.debian.org, ossama@debian.org
References: <01081912061400.01092@octopus> <20010819111834.C14486@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20010819111834.C14486@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <01081921102500.00948@octopus>
Subject: [parisc-linux] Re: [palinux-0.9.2] Where are the compilers (c, c++) ?
List-ID: <linux-parisc.vger.kernel.org>

> > After successfully installing palinux-0.9.2 on my 715/64
> > I'm looking for the compilers (c, c++) ...
>
> It looks like you didn't add the debian apt sources to your
> /etc/apt/sources.list.  binutils is at 2.11.90.0.27-1
> currently, for example.  Make sure you have gcc-3.0 installed
> (from the archive; current version for hppa is
> 3.0.1-0pre010811).

/etc/apt/sources.list contains one line which point to my local 
CD-ROM drive

'man apt-get' and man 'sources.list' result in 'No manual entry 
for ...'

'apt-get install gcc' results in:

----- 8< ----- 8< ----- 8< ----- 8< ----- 8< -----

root@frog # apt-get install gcc
Reading Package Lists... Done
Building Dependency Tree... Done
Sorry, gcc is already the newest version.
You might want to run `apt-get -f install' to correct these:
Sorry, but the following packages have unmet dependencies:
  cpp: Depends: cpp-3.0 but it is not installable
  g++: Depends: g++-3.0 but it is not installable
       Depends: gcc-3.0 but it is not installable
  gcc: Depends: gcc-3.0 but it is not installable
       Depends: cpp-3.0 but it is not installable
  libstdc++3-dev: Depends: g++-3.0 (>= 1:3.0-1) but it is not 
installable
E: Unmet dependencies. Try 'apt-get -f install' with no 
packages (or specify a .

----- 8< ----- 8< ----- 8< ----- 8< ----- 8< -----

The output of apt-get says that there is something essential 
missing to install the C compiler environment or ot get a 
running C/C++ development environment ...

The only data I have got at present is from the CD-ROM image 
'palinux-0.9.2' (approx. 130 MB)

The folder tree below  
'ftp://ftp.debian.org/debian/dists/sid/binary-hppa' holds only 
a few deb-files (no C compilers as I would need to solve my 
problem) which mainly are links to binary-all.

So there seems to be no hppa-related stuff at least at the 
original debian server ...

Reinhard.
