Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4AE85482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Aug 2001 14:24:43 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Bjorn Helgaas <bjorn_helgaas@hp.com>
To: Grant Grundler <grundler@puffin.external.hp.com>,
	"'Richard Hirst'" <rhirst@linuxcare.com>
Subject: Re: [parisc-linux] Fwd: [Linux-ia64] [RFC] /proc/ksyms change for IA64 (fwd)
Date: Thu, 2 Aug 2001 14:24:05 -0600
References: <200108021632.KAA20911@puffin.external.hp.com>
In-Reply-To: <200108021632.KAA20911@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Message-Id: <01080214240502.05959@eeyore>
List-ID: <linux-parisc.vger.kernel.org>

> > Is this an issue for parisc as well?
>
> I'm pretty sure parisc port has already addressed this since insmod
> works. Talk to Richard Hirst since he's done most of the kernel modules
> support.

insmod works fine on ia64 as well.  The problem they tripped over was that 
ksymoops running native on ia64 and using /proc/ksyms failed, while a 
running ksymoops on ia32 (cross debug mode) with ia64 debug info and 
System.map worked fine.

ismod uses the descriptor address (which ia64 currently puts in 
/proc/ksyms), while ksymoops requires the code address.
