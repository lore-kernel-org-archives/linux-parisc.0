Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe13.law4.hotmail.com [216.33.148.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 28C064829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Sep 2002 09:46:33 -0600 (MDT)
From: "kenneth westelinck" <kennywest1@hotmail.com>
To: "Thibaut VARENE" <varenet@esiee.fr>,
	"Stephen J de Vries" <paulhill20@juno.com>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <20020925.090915.-178139.3.paulhill20@juno.com> <3D91BB4F.5090205@esiee.fr>
Subject: Re: [parisc-linux] hardware newbie question...
Date: Wed, 25 Sep 2002 17:44:17 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Message-ID: <OE132K4xDh9vXsFFsAi00001718@hotmail.com>
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

I have a 712 with the following peripherals:
- monitor from NCD
- mouse from IBM
- keyboard from Phillips
Works just fine.

----- Original Message -----
From: "Thibaut VARENE" <varenet@esiee.fr>
To: "Stephen J de Vries" <paulhill20@juno.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Wednesday, September 25, 2002 3:34 PM
Subject: Re: [parisc-linux] hardware newbie question...


> Stephen J de Vries wrote:
> > I have a HP 712 that I'd purchased recently.
> >
> > My question is:
> >
> > Can I use a PC monitor, keyboard, and mouse to boot the thing up?  If
so,
> > does the monitor have to be a multisync or something special?
> OK for the PC monitor. Use 'Tab' at boot time to switch 712's resolution
> NO for the PC keyboard (pc kbd is 75mA iirc, 712 is 500mA)
> I don't know for the mouse.
> >
> > In addition, HP-UX is on the hard drive but is locked down.  I was
> > thinking of buying an external CD drive and attempting to load debian
> > 0.93.  Can anyone recommend a place to buy the CD drive that they have
> > dealt with?  I also have a network so I could attempt a network install
> > but I am not sure what minimum requirements I'd need to fulfill for
that.
> You can unlock HP/UX pretty easily if the box isn't in secure mode.
> Just stop the boot sequence and at the BOOT_ADMIN prompt type 'bo pri ipl'
>
> Then answer 'y' to the 'interract with...' question, and then type (i
> don't know if we can say this here ;o)
>
> hpux -iS
>
> If the box is in secure mode there is a workaround:
> Open it, unplug the HD, boot it, wait for timeout, and then deactivate
> the secure mode ;)
> then reboot again.
>
>
> You can definitly use network to install.
> Check the palinux boot howto.
> I recommend you use the latest version (still under review, that's why
> it's not yet available on tldp):
> http://testpa.esiee.fr/.test/parisc-linux-boot.html
>
> You will find all useful info there.
>
>
> Thibaut VARENE
> PA/Linux ESIEE Team
> http://pateam.esiee.fr/
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
