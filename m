Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63F82482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 Aug 2001 01:55:05 -0600 (MDT)
Message-Id: <200108060754.JAA00258@sap-ag.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [parisc-linux] XFree86 on B180
Date: Mon, 6 Aug 2001 09:54:35 +0200
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
References: <OFCFD0268B.6552637A-ONC1256A9D.0025254D@LocalDomain> <200108031045.MAA28589@sap-ag.de> <20010805164832.A4767@solo.franken.de>
In-Reply-To: <20010805164832.A4767@solo.franken.de>
MIME-Version: 1.0
List-ID: <linux-parisc.vger.kernel.org>

Hi Thomas

On Sunday 05 August 2001 16:48, Thomas Bogendoerfer wrote:
> On Fri, Aug 03, 2001 at 12:45:01PM +0200, Helge Deller wrote:
> > Currently stifb will run on most 712 and 715 machines, while B160, B180,
> > C3000 and most others won't.
>
> you saw X on the B180 I had at LinuxTag:-) Treating the EG VISULIZE as an
> artist graphics card did the trick.

... and including this patch/assumption would break too many other machines 
(esp. 64bit machines, e.g. the c3k) and make the kernel unusable for much 
more people.
But I now have contact to someone inside HP which has far more knowledge 
than me about STI and we're working on a cleaner solution (at least as far as 
my time permits me currently).

Greetings,
Helge
