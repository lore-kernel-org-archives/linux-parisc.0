Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id C37DE482A
	for <parisc-linux@parisc-linux.org>; Fri,  1 Jun 2001 13:23:43 -0600 (MDT)
To: Andrew Shugg <andrew@neep.com.au>
Cc: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] Version 0.9 of PA-RISC Linux Released 
In-Reply-To: Your message of "Sat, 02 Jun 2001 02:03:02 +0800."
             <20010602020300.A20205@neep.com.au>
References: <20010601030203.EE8B937EF8@carmen.fc.hp.com>  <20010602020300.A20205@neep.com.au> 
Date: Fri, 01 Jun 2001 13:23:41 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E155uWL-0008H8-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= A couple of questions arose:
= 
= - what's the 142MB "gg" file dated "01-Jun-2001 10:23"?  I mean, I know
=   who gg is (hi grant) but as this file is of around the same vintage as
=   all the 0.9 compressed ISOs I thought I'd see if it was related

It was a temporary file I used while correcting the STI ISO.

= - are all the 0.9 ISOs identical except for which kernel is booted by
=   default?  eg does the 0.9-32bit-STI CD image also contain the kernels
=   for the 32bit-serial and 64bit-serial installs?

Yes.  the palinux-0.9-README (also in the ISOs) gives a clue how to use
the CD for other purposes.  There is a README in the cd-images directory
which tells how to turn one bootable image into another bootable image
by downloading only 512 bytes.
