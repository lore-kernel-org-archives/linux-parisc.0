Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA26657
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jul 2000 13:43:17 -0600
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] untested but building 64-bit toolchain,
 issues/questions
Reply-To: law@cygnus.com
In-reply-to: Your message of Thu, 06 Jul 2000 12:01:30 PDT.
             <200007061901.MAA10121@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 06 Jul 2000 13:19:09 -0600
Message-ID: <12042.962911149@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <200007061901.MAA10121@milano.cup.hp.com>you write:
  > Jeffrey A Law wrote:
  > > ie, when the "w" is included we have a system that is 
  > > capable of running 64bit binaries -- not all hppa2.0 systems can run
  > > 64bit binaries.
  > 
  > My brain isn't working that well today...I had the think about this for
  > a minute...let me make it obvious to others.
  > 
  > The limiting factor would be the OS.
  > Eg hppa2.0n-linux (or HPUX 10.20) on a system with PA2.0 CPU.
Yup.  There are even versions of hpux11 that are not 64bit capable even
on PA2.0 hardware.  For example, unpatched hpux11.00 wouldn't run 64bit
code on a D/R 390.

jeff
