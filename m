Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 988506122
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Nov 2001 02:36:32 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: Grant Grundler <grundler@puffin.external.hp.com>,
	"Craig D. Lansing" <lansing@beldar.com>
Subject: Re: [parisc-linux] J2240 - It Runs!
Date: Mon, 26 Nov 2001 10:36:29 +0100
Cc: parisc-linux@lists.parisc-linux.org
References: <200111260357.UAA02910@puffin.external.hp.com>
In-Reply-To: <200111260357.UAA02910@puffin.external.hp.com>
MIME-Version: 1.0
Message-Id: <E168IBh-00034H-00@linuxlab.wdf.sap-ag.de>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> >  So far, I've only been able
> > to connect to the serial port via a Reflection session to login to the =
> > system after getting through the boot path & IPL on the attached =
> > graphics terminal.
>
> You probably have the palo param "console=ttyS0" and that's why
> it's switching to serial console. Palo documentation suggests
> using "console=tty" for auto-detecting the console.

IIRC you should prefer to *NOT* add any "console=xxx"  param
in which case palo will automatically detect if you boot your machine 
via serial cable or from the graphics prompt and will add the right 
param for you during boot.

> >   Does anyone know how to use the graphics terminal =
> > exclusively?  I assume that I need to change some of the IPL parms, e.g.
> > = sti=3D or console=3D, but I do not know what values to use.  Any help =
> > would be appreciated.
>
> With 0.9.2, if the graphics head were recognized and has a working
> STI ROM, I would expect the console to remain on the graphics head.

The "sti=x" param will let you select which STI graphics device to use 
for the initial console in case you have multiple STI graphic devices
in your machine. It does not switch between serial and graphic console.

Don't touch those params and instead install a newer kernel with sticon/stifb 
compiled in, boot your machine and you'll see if your STI graphic is detected.
If it's not detected, then we don't support it yet.

Helge
