Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F9724904
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 09:59:35 -0600 (MDT)
Message-Id: <200110051556.JAA04331@puffin.external.hp.com>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sti broken in pa32 on B180 
In-Reply-To: Message from Thomas Marteau <marteaut@esiee.fr>
   of "Fri, 05 Oct 2001 12:53:32 +0200." <3BBD912C.9DA840E2@esiee.fr>
Date: Fri, 05 Oct 2001 09:56:31 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Thomas Marteau wrote:
> I have two things to say but I need an Hardware HP guy to answer those:
> 	-1) Page 69 of LASI_ers.ps, note 2 is mentionned but I can see only the
> note 1. Why?

Hacked reformatting?
Here are two notes from "Table 4: PS2 Interface registers":
Note 1: Each PS2 device returns a unique hardwired ID code in bits 3:0 of ID.
Note 2: Resetting the block disables it (see Table 6).

> 	-2) On my B132, in boot_admin, when you press Escape Key too much (more
> than 2 times), you can't type anything!
> you need to press enter and then you can type. This is reproductible! Is
> it a normal behaviour?

Could this be a firmware bug?

grant
