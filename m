Return-Path: <alan@lxorguk.ukuu.org.uk>
Received: from dhcp23.swansea.linux.org.uk
	(cpc1-cwma1-5-0-cust4.swan.cable.ntl.com [80.5.120.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E6B2484B
	for <parisc-linux@parisc-linux.org>;
	Wed, 18 Feb 2004 17:55:34 -0700 (MST)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10) with ESMTP id
	i1J0qD0r032335
	for <parisc-linux@parisc-linux.org>; Thu, 19 Feb 2004 00:52:13 GMT
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10/Submit) id
	i1J0qCc2032333
	for parisc-linux@parisc-linux.org; Thu, 19 Feb 2004 00:52:12 GMT
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: HPPA List <parisc-linux@parisc-linux.org>
Content-Type: text/plain
Message-Id: <1077151931.32327.1.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: Thu, 19 Feb 2004 00:52:12 +0000
Cc: 
Subject: [parisc-linux] XFree86: Voodoo/Voodoo2 driver
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Wish you could do something with your old Voodoo or Voodoo2 graphics
cards ?
Unable to find tools old enough to build Glide2 ?
Unable to port Glide2 to your new system ?
Want to use the 2D accelerator on the Voodoo2 ?
Want render acceleration ?

The department of retro-optimisation(*) proudly presents the 1.0 Beta
release of a Voodoo and Voodoo2 driver for XFree86 4.3.

-	640x480, 800x600, 1024x768 - and custom non glide modes
-	1024x768 on non-SLI Voodoo2
-	DGA
-	2D acceleration of most operations on Voodoo2
-	Render acceleration (Voodoo2)
-	No glide library needed
-	Supports SLI configurations although it doesnt use SLI

No DRI (yet), although if the folks hacking Glide3 can get Voodoo1/2
working again that should be possible to do. No Xv (anyone know about
YAB texture formats so I can use them for YUV422/YCbCr ?) and no
pixcache at the moment.

It may also have endian issues so I'd love to hear from parisc hackers
how well it works.

And you thought it was just another old dead video card...

	ftp://people.redhat.com/alan/XFree86/Voodoo

including a compiled driver mode for Fedora Core 1 and 2T1.


Alan

(*) With more than a little help from Ghozlane Toumi's sstfb work
