Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id BD53B482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Aug 2001 04:45:32 -0600 (MDT)
Message-Id: <200108031045.MAA28589@sap-ag.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: "=?iso-8859-1?q?Jo=EBl?= Soete" <jso@europay.com>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] XFree86 on B180
Date: Fri, 3 Aug 2001 12:45:01 +0200
References: <OFCFD0268B.6552637A-ONC1256A9D.0025254D@LocalDomain>
In-Reply-To: <OFCFD0268B.6552637A-ONC1256A9D.0025254D@LocalDomain>
MIME-Version: 1.0
List-ID: <linux-parisc.vger.kernel.org>

> On the B180 I use the same XF86config as on 712/80, the one from  Thomas
> Bogendoerfer available at:
> http://lists.parisc-linux.org/pipermail/parisc-linux/2001-June/012928.html
> ......
>
> With kernels 2.4.0-32 and 2.4.6 xdm failed because:
> "(EE) No devices detected.
>
> Fatal server error:
> no screen found.
> ..."

Hi Joël,

The only way to get XFree86 running on parisc atm is to use the XFree86-fbgen (framebuffer) 
driver in conjunction with the kernel stifb driver. This means, that if you see the graphical 
pengiun (TUX) at bootup on your screen, XFree86 should  run. If you don't see it, you have a 
not yet by stifb supported graphic chip in your machine.
Currently stifb will run on most 712 and 715 machines, while B160, B180, C3000 and most
others won't.

Greetings,
Helge
-- 
_______________________________________________________________________

THE BEST RUN E-BUSINESSES RUN SAP
_______________________________________________________________________

Helge Deller                            email: helge.deller@sap.com
SAP AG Walldorf/Baden, Germany         
LinuxLab                               

SAP LinuxLab support address: linux@sap.com
