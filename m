Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from femail31.sdc1.sfba.home.com (femail31.sdc1.sfba.home.com [24.254.60.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id DFB52482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Dec 2001 22:52:11 -0700 (MST)
Received: from w2kpro ([24.248.173.115]) by femail31.sdc1.sfba.home.com
          (InterMail vM.4.01.03.20 201-229-121-120-20010223) with ESMTP
          id <20011214055209.ORRC19480.femail31.sdc1.sfba.home.com@w2kpro>
          for <parisc-linux@lists.parisc-linux.org>;
          Thu, 13 Dec 2001 21:52:09 -0800
From: "Edward Alfert" <edward@alfert.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] What keywords should I use to find the answer? 
Date: Fri, 14 Dec 2001 00:53:15 -0500
Message-ID: <000001c18463$a054b820$0201a8c0@w2kpro>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <200112140525.WAA21618@puffin.external.hp.com>
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

Ok... So I'm experimenting with leaving the fx4 for booting and
interacting in text mode (/dev/tty0) and then I installed a PCI voodoo 3
in graphics pci slot number 1.   the fx4 is in slot 4.

I reran /usr/X11R6/bin/xf86config and entered the new information.

When executing startx, it probes the hardware and sees both the FX4
(which it doesn't know what it is), and it also sees the Voodoo 3 which
it identifies correctly.

But it still fails to start the server.  Same error messages:
       (EE) No devices detected.
       Fatal server error:
       no screens found

Any ideas if this is possible.. Have 2 video cards and use the supported
one for gui?

> 
> > The system is a C240 with FX4 video card (that's HP Visualize FX-4 
> > with 18mb RAM) ... The GRAPHICS(4) is set to 1280 x 1024 @ 72Hz.
> 
> I don't think FX-4 is supported yet. Helger Deller or Thomas 
> Bogendoerf should be able to confirm in a few hours if no one 
> else can. Looks like we could use a seperate table for 
> unsupported IO devices and supported gfx on:
> 	http://www.parisc-linux.org/release-0.9/systems-093.html
> 
