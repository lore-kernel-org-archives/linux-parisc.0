Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id D87CB482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Jul 2002 09:02:26 -0600 (MDT)
From: Helge Deller <helge.deller@sap.com>
To: "Stephan Trajkoff" <stephan@itp.bg>
Subject: Re: [parisc-linux] XFree86 on STI 819/K210
Date: Fri, 12 Jul 2002 17:00:26 +0200
References: <200207121244.OAA16127@smtpde02.sap-ag.de>
In-Reply-To: <200207121244.OAA16127@smtpde02.sap-ag.de>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200207121700.26113.helge.deller@sap.com>
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

Hi Stepham

CC'ed to the list...

1. Yes:
ii  xfree86-common 4.1.0-17       X Window System (XFree86) infrastructure
ii  xserver-xfree8 4.1.0-17       the XFree86 X server

2. Did you checheck the "Mode"- line ? 
What does "dmesg | grep stifb" says ?

Helge

On Friday 12 July 2002 14:39, Stephan Trajkoff wrote:
> I get the same error again,
> can I run XFRee with only installed xserver-common and
> xserver-xfree86?
>
> -------- Original Message --------
>
> ==> From: Helge Deller <helge.deller@sap.com>
> ==> Date: Fri, 12 Jul 2002 14:10:49  0200
>
> On Friday 12 July 2002 14:06, Stephan Trajkoff wrote: > do anyone
> runs XFREE86 on STI? I have K210/819 HP > the error is
> FBIOPUT_VSCREENINFO: invalid argument > can anyone send me
> configuration file for X with STI working...?
>
> I think you should check the screen resolutions in your XF86Config-4.
>
> ftp://ftp.parisc-linux.org/XFree86/XF86Config-4 is one example and
> you should change it to have the correct Modelines as described at
> the top in this file.
>
> Greetings, Helge
