Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mout0.freenet.de (mout0.freenet.de [194.97.50.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 75E2D482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Jul 2001 10:55:15 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
Reply-To: Reinhard.Gimbel@freenet.de
To: parisc-linux@lists.parisc-linux.org
Date: Thu, 26 Jul 2001 18:48:42 +0200
References: <20010726124024.1EB23482B@dsl2.external.hp.com>
In-Reply-To: <20010726124024.1EB23482B@dsl2.external.hp.com>
Cc: sanaya@gr.hp.com
MIME-Version: 1.0
Message-Id: <01072618484200.01103@octopus>
Subject: [parisc-linux] Re: Help on install
List-ID: <linux-parisc.vger.kernel.org>

> I'm attempting to to install HP Linux on a C180XP
> Has anyone had success install V0.9 on this type
> of machine?

I'm still trying to install 0.9.2 on a C180, too.
 
> The problem I'm having is that when booting from
> a CD, created with the current CD image on the
> web site, the system just hangs in the boot
> process after Serial driver has been enabled.

My expirence is that the DINO I/O chip seems to be the key 
element for that problem. Version 1.x of this chip crashes the 
system like you describe it (crash during boot ... :-( ) My 
DINO version (2.1) allows at least boot the system but the 
system crashes when I try to do the next steps within the 
installation procedure.

One tip i got in this mailing list was to try to install over 
network / NFS.

My problem at present is that the TP port of my C180 box seems 
to be broken, because i can't get a connection to my Intel 
Linux box. I tried to use either 100 Mbps as well as 10 Mbps on 
my Intel Linux box. The AUI-Ethernet port I can't test because 
I've not glue box from my Intel Linux TP ethernet adaptor to 
the AUI ethernet port of my C180 ...

Anybody outthere with an idea in this area ?

Thanks a lot !

Reinhard.
