Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (d208.dhcp212-198-140.noos.fr [212.198.140.208])
	by dsl2.external.hp.com (Postfix) with ESMTP id 695494829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Oct 2002 09:05:44 -0600 (MDT)
Date: Fri, 11 Oct 2002 17:05:39 +0200
From: Thibaut VARENE <varenet@esiee.fr>
To: "Jeffo" <jeffo@pop.hsbc.com.br>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP Boot
Message-Id: <20021011170539.5d7a6558.varenet@esiee.fr>
In-Reply-To: <001001c27131$1fb6b900$db0b0aa7@pcaktel083>
References: <005901c27126$8d5132c0$db0b0aa7@pcaktel083>
	<20021011153008.69b217a7.varenet@esiee.fr>
	<001001c27131$1fb6b900$db0b0aa7@pcaktel083>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

On Fri, 11 Oct 2002 11:18:51 -0300
"Jeffo" <jeffo@pop.hsbc.com.br> wrote:

> Hello.
> 
> I read many docs and none of them explain it in detail how to exactly to
> change my boot rom settings.
> All mentions to ISL are to use serial connections only.....which is not my
> case... =(
Maybe you should re-read the HOWTO _from the beginning_:
It is clearly stated that we're talking about *console* operations, whatever your console is, see section 3.2:
http://pateam.esiee.fr/parisc-linux-boot/PA-RISC-Linux-Boot-HOWTO/consoles.html

About changing your Boot ROM setting:
this is pointless, since this is not what you want.
The boot ROM settings store the _hardware path_ to your boot device, see section 3.1.2.1:
http://pateam.esiee.fr/parisc-linux-boot/PA-RISC-Linux-Boot-HOWTO/bootadmin.html#AEN202

> 
> I just wanna change the boot path, that is, point to the Vmlinux guy.

This is done by changing your PALO settings, either in palo.conf for definitive changes, or at boot time. See section 4:
http://pateam.esiee.fr/parisc-linux-boot/PA-RISC-Linux-Boot-HOWTO/palo.html
for a complete description of PALO, and more specifically:
section 4.3.3 to learn how to change your config file options:
http://pateam.esiee.fr/parisc-linux-boot/PA-RISC-Linux-Boot-HOWTO/paloappusage.html#bootablepartition
and section 4.4 to learn how to use PALO during boot sequence:
http://pateam.esiee.fr/parisc-linux-boot/PA-RISC-Linux-Boot-HOWTO/paloearlyboot.html


> 
> Another thing: after concluding installation, when I go to the step "Make
> system bootable", the screen (installer) goes blue and returns to the very
> beggining of the process "Welcome to....blablabla..."
This is not normal.
What kind of installation are you using ? CD/Network ?
If cd, what ISO ? Have you checked the md5sum ?

Hope that helps.

One more thing: please do not mail me personnaly, this is not a private lesson, and this kind of questions may be useful for other people.



Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
> 
> Any hints?
> Thanks.
> Jeffo.
> 
> ----- Original Message -----
> From: Thibaut VARENE <varenet@esiee.fr>
> To: <parisc-linux@lists.parisc-linux.org>
> Cc: <jeffo@pop.hsbc.com.br>
> Sent: Friday, October 11, 2002 10:30 AM
> Subject: Re: [parisc-linux] HP Boot
> 
> 
> > On Fri, 11 Oct 2002 10:03:11 -0300
> > "Jeffo" <jeffo@pop.hsbc.com.br> wrote:
> >
> > >  Hi all.
> > >
> > >  How to properly configure my HP 712/60 for loading the right boot
> files?
> > >  (/target/boot/vmlinux)?
> > >  (Oh, by the way, the boot installer tried to look for the files in
> > >  /target/vmlinux, and on the CD we can see /target/boot/vmlinux)
> > >
> > >  I guess I have to play with the ISL...but I couldn´t find the right
> > > commands
> > >  for changing the default (/stand/hpux which don´t even exists anymore)
> to
> > > my
> > >  boot thing.
> > >
> >
> > Everything is explained on the PA-RISC/Linux Boot HOWTO, released as of
> > 2002-10-04 (sorry the release date hasn't been correctly set in the
> changelog) in its 1.0 version.
> > Please check:
> > http://pateam.esiee.fr/doc.html
> >
> > HTH,
> >
> >
> > Thibaut VARENE
> > The PA/Linux ESIEE Team
> > http://pateam.esiee.fr/
> >
> 
> 
