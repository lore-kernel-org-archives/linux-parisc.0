Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9BB37482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Jul 2001 15:36:58 -0600 (MDT)
Message-Id: <200107182135.PAA08428@puffin.external.hp.com>
To: "Laubrock, Ulrich" <Ulrich.Laubrock@t-systems.de>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from "Laubrock, Ulrich" <Ulrich.Laubrock@t-systems.de>
   of "Wed, 18 Jul 2001 21:17:26 +0200." <BB6FA1C61CD5D411ACF800D0B7DBBAFF13812B@G8DJW>
Date: Wed, 18 Jul 2001 15:35:58 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Subject: [parisc-linux] Re: Problems with Release 0.9 for PA-RISC
List-ID: <linux-parisc.vger.kernel.org>

"Laubrock, Ulrich" wrote:
> Hallo Mr. Grundler,
> 
> i have tested the 0.9 Release for PA-RISC on a HP 712/80 with 128 MB RAM and 
>   2 GB drive.
> I have installed STI sid.
> 
> After the installation i have reboot the system and then the kernel crashed. 
>   I have tested an reboot again but it has no effect. Then i have get an univ
>   ersal kernel from your website. With this kernel the system is running good
>   .
> Is there a known problem with the kernel?

Hi Ulrich,

hmm...at times...but the install kernel should work fine on a 712.
You could download the 0.92 version and steal the right kernel from that.

The team at ESIEE (http://mkhppa1.esiee.fr/) put the ISO's together.
AFAIK it was tested on 712's, 715's, B180, B132, C3000, J5000 and A500.

> At the installation i have set the keyboard to german layout, but after reboo
>   t the system has lost this setting, it was only temporary for the installat
>   ion. Then i have set "loadkey german" in the /etc/profile.
> Now i have a german keyboard, but this keysetting has no ">,<,|". Using UNIX 
>   without "|" is not very good.
> What can i do to set german keyboard with all characters?

I don't know since I haven't needed to change keyboard settings.
Can any other german keyboard user help?

The parisc-linux mailing list probably has the answer if you look for it.
(http://lists.parisc-linux.org/)

> My greatest problem is that i have no ftpd, no telnetd and no rlogind. 
> As ftpd i think i can get wu_ftp, but where can i get an telnetd and an rlogi
>   nd?

Right.  As root:
	apt-get update 
	apt-get install ftpd
	apt-get install telnetd

I didn't see a rlogind package available.
The evil-minded debian developers I consort with have brainwashed
me into only using ssh and sshd.

> Is there a tool for administration the system after reboot the installation
>  like "dbootstrap" ?

Sorry - I don't know dbootstrap.

	debian:~# dpkg -S dbootstrap
	base-config: /usr/lib/base-config/0dbootstrap_settings

Might just need to apt-get the right package.

> Is the XServer running on this System?
> If yes, how can i start it?

On 712's I think so..  I have to refer you to the parisc-linux Mail archive:
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-June/012927.html

> 
> Mit freundlichen Grüßen
> Ulrich Laubrock


Mit freundlichen Grüßen
grant

> _____________________________________________
> T-Systems
> T-Nova Deutsche Telekom Innovationsgesellschaft mbH
> > EZ Rhein-Ruhr, EA 23-6 
> Tel:   	+49 521 5259 921
> Fax: 	+49 521 5259 694
> Email:	mailto:Ulrich.Laubrock@t-systems.de

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
