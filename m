Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A302482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Apr 2001 15:53:50 -0600 (MDT)
Message-Id: <200104092147.PAA29161@puffin.external.hp.com>
To: Bjorn Helgaas <bjorn_helgaas@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] PDC cleanup and encapsulation 
In-Reply-To: Your message of "Wed, 04 Apr 2001 16:04:22 PDT."
             <0104041450480D.19560@eeyore.fc.hp.com>
Date: Mon, 09 Apr 2001 15:47:20 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Bjorn Helgaas wrote:
> CONFIG_PARISC64 =>
> 	Only possible when CONFIG_PA20 selected
> 	Build 64-bit kernel by using $(CROSS_COMPILE) = hppa64-linux.

rhirst and I don't modify linux/Makefile for CROSS_COMPILE.
Now automagically based on the .config options selected.

> 	cpp predefines __LP64__.
> 
> So is there a reason for testing __LP64__ rather than CONFIG_PARISC64 in 
> the code?  There are a zillion tests for the former and none for the 
> latter, even though the latter seems more direct and obvious.

CONFIG_PARISC64 wasn't available when I wrote my code.
Most of my code uses __LP64__ though I think including linux./config.h
is better since when it changes, the .o's get rebuilt.

> It seems to me that __LP64__ is overloaded for several things.  
> Fundamentally, it is a property of the kernel, i.e., it is compiled to run 
> in wide mode. But we also use it to decide whether to use PDC PAT, which 
> seems like a slightly different question.  If you run a narrow kernel on a 
> C3000, the firmware still supports PDC PAT

I didn't think so. A narrow kernel won't have PDC PAT *calls*
 (eg do_inventory) in it.

>  (although I suppose we would have to do some work to call it in wide mode).

We considered doing this but decided it wasn't worth the effort.
Others are welcome to make this work if they have time to though...

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
