Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2BB99482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  1 Aug 2001 02:25:22 -0600 (MDT)
Message-Id: <200108010825.KAA10220@sap-ag.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: Jurij Smakov <jurijus@theophys.kth.se>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 0.9.2 experiences
Date: Wed, 1 Aug 2001 10:25:19 +0200
References: <Pine.LNX.4.21.0108010957190.16366-100000@uranus.theophys.kth.se>
In-Reply-To: <Pine.LNX.4.21.0108010957190.16366-100000@uranus.theophys.kth.se>
MIME-Version: 1.0
List-ID: <linux-parisc.vger.kernel.org>

Hi Jurij,

On Wednesday 01 August 2001 10:04, Jurij Smakov wrote:
> Other questions: I am quite new to the list, I have only read the docs
> on parisc-linux.org. I noticed people on the list talking about compiling
> the kernel under parisc-linux - I've thought the only way to compile
> kernel is to use a cross compiler (that's what parisc-linux.org says,
> anyway). 

No, you may also compile a new kernel under parisc-linux.
All you need is to apt-get gcc and binutils (search the archive how to set
up apt).

> Also, since it already displays tux logo during boot, it should
> be able to run X, but no Xfree binaries are present on installation CD.
> Can I run X somehow?

Yes you can. After setting up apt do an 
apt-get install xserver-xfree86 xfonts xlibs xbase xutils
modify your /etc/XFree86config to use the fbdev driver and it should work.
Maybe you will need to modify some more things which I don't know right now 
out of my head, but you may also take a look at the thread
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-July/012972.html
and should ignore all things I mentioned about HIL (since I think you don't 
have a HIL keyboard or mouse).

> Cheers,
> Jurij.

Much fun,
Helge

-- 
_______________________________________________________________________

THE BEST RUN E-BUSINESSES RUN SAP
_______________________________________________________________________

Helge Deller                            email: helge.deller@sap.com
SAP AG Walldorf/Baden, Germany         
LinuxLab                               

SAP LinuxLab support address: linux@sap.com
