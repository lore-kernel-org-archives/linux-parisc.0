Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [192.151.27.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8FE80482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 09:14:21 -0600 (MDT)
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Users staying up to date. 
In-Reply-To: Message from "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
   of "Tue, 28 Aug 2001 00:22:51 EDT." <20010828002251.L28978@megatonmonkey.net>
References: <20010814154037.I25258@megatonmonkey.net>
 <20010815010034.K22144@parcelfarce.linux.theplanet.co.uk>
 <20010814215030.A26703@megatonmonkey.net> <20010815041610.M22144@parcelfarce.linux.theplanet.co.uk> <20010817155340.C8649@megatonmonkey.net> <20010828000748.G7064@linuxcare.com>  <20010828002251.L28978@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 28 Aug 2001 09:14:17 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010828151417.CADE037DAD@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Carlos O'Donell Jr." writes...

> I think the main issue was that we were using a _really_ old kernel.
> Which didn't have a lot of the later patches for the older 715 boxes.
> 
> I'm currently trying to roll the toolchain from start to end, and 
> automate the process a little. BTW, is there any automation setup for
> building the toolchain?

For an x86 -> hppa/hppa64 cross toolchain I use the palinux-autobuilder script 
in the build-tools section of pehc cvs.

For a native hppa toolchain use the debian packages(which several people 
worked very hard on in order to get working so we didn't have to deal with 
building by hand).

For hppa -> hppa64 cross compilers I still do it by hand.

Are you rolling your own toolchain for fun, or is the stuff on pehc not 
meeting your needs?

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
