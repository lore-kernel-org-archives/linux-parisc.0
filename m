Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sjcexsbb1.sanmina.com (dummy.sanmina-sci.com [12.30.36.125])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B5794829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Sep 2002 02:14:14 -0600 (MDT)
From: "Jorge GOMEZ CABELLO" <jorge.gomez@sanmina-sci.com>
To: "Richard Hirst" <rhirst@linuxcare.com>,
	"Thibaut VARENE" <varenet@esiee.fr>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Re: PALO-text
Date: Wed, 4 Sep 2002 10:13:56 +0200
Message-ID: <CFEDIBFJEHPLIGPIJNKAEENFCAAA.jorge.gomez@sanmina-sci.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20020904062110.GJ21440@sleepie.demon.co.uk>
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

	The keyboard works with this lifimage.

	Thanks a lot for your colaboration.

	Jorge.


-----Mensaje original-----
De: Richard Hirst [mailto:rhirst@linuxcare.com]
Enviado el: miercoles, 04 de septiembre de 2002 8:21
Para: Thibaut VARENE
CC: Jorge GOMEZ CABELLO; parisc-linux@lists.parisc-linux.org
Asunto: Re: [parisc-linux] Re: PALO-text


On Tue, Sep 03, 2002 at 12:51:43PM +0200, Thibaut VARENE wrote:
> On Tue, 3 Sep 2002 10:43:18 +0200
> "Jorge GOMEZ CABELLO" <jorge.gomez@sanmina-sci.com> wrote:
>
> > Dear Puffin,
> >
> >     We are trying to install Debian 3.0 on our HP B2000/785 and it is
impossible to recognize the usb keyboard. is there a special commando to
introduced in the command line of the palo 1.0 ?
>
> - This reply has been CC'd to the parisc-linux mailing list -
>
> Hi Jorge,
>
> If I remember correctly, the USB support is not enabled by default in the
install kernel for Debian 3.0, and B2000 does use a USB keyboard.
> We had such a problem here, and there is a solution: boot and install the
box using the following lifimage:
>
http://pateam.esiee.fr/cd-images/lifimages/lifimage-2.4.18-pa46-USBSTI64-200
20704.gz
> This one has support for USB in both 32/64bit kernels, and what's more,
STI console is supported in 64bit kernel. This will allow you to install the
box directly with a 64bit kernel.
>
> We may build a more recent lifimage with such USB/STI support soon.
>
> Maybe we can also consider adding at least USB support to the default
kernel configuration ? Richard, any comment ? :)

I think we should add usb and 64 bit sti to default and debian configs.
I guess we'll find out soon enough if it casues problems on other
systems.

Maybe it's time we considered an initrd boot process and kernel modules
for some of this stuff.  May not be worth the effort in 2.4 though.

Richard
