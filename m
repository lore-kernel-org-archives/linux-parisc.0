Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5ABE34A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Feb 2001 01:48:56 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9B2F7B005; Fri, 16 Feb 2001 08:48:30 +0000 (GMT)
Date: Fri, 16 Feb 2001 08:48:30 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Kevin Read <obsidian@panokratie.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Test on 705
Message-ID: <20010216084830.K1374@linuxcare.com>
References: <Pine.LNX.4.31.0102160013480.22670-100000@kiste.innnet.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.31.0102160013480.22670-100000@kiste.innnet.de>; from obsidian@panokratie.de on Fri, Feb 16, 2001 at 12:18:53AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Feb 16, 2001 at 12:18:53AM +0100, Kevin Read wrote:
> 
> Hi folks,
> 
> first a little praise: It only took me 2 hours to get up and running and
> starting to build me own kernel with palinux! I like your informative
> homepage and FAQs! Keep it up!
> 
> I booted it up on my 705 (Flounder), further below is the output I got.
> 
> It seems it can't get consistent with the memory my ether and SCSI
> controller use, and its muttering about DMA too. It didn't find any SCSI
> devices and I couldn't find any packets from the box on the net.

This looks to me very much like the problems with 710(bushmaster),
where things basically work, but interrupts from the scsi and ethernet
chips just never get seen by the cpu.

We need info from someone with access to hp documentation to fix
these systems, I think.

Richard
