Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D682482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jul 2001 02:47:07 -0600 (MDT)
Subject: Re: [parisc-linux] 2.4.6-pa20 question about modules
To: "Richard Hirst <rhirst" <rhirst%linuxcare.com%SMTP%EUROPAY@mastercard.com>
Cc: marteaut@esiee.fr, parisc-linux@lists.parisc-linux.org
Message-ID: <OFB91B1028.B293AC0E-ONC1256A8E.002F5D3A@LocalDomain>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Thu, 19 Jul 2001 10:48:20 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Hi Richard,

Just to clarify:
does it means that I have to (or I can) recompile my kernel from my
palinux-box?

Is it not possible from i386 linux box and the cross compiler?

Thanks again for support,
     Joel



                                                                           =
                                       =20
                    Richard Hirst                                          =
                                       =20
                    <rhirst@linux        To:     Jo=EBl Soete/BRU/MASTERCAR=
D@MASTERCARD                             =20
                    care.com>            cc:     marteaut@esiee.fr@SMTP@EUR=
OPAY,                                  =20
                                         parisc-linux@lists.parisc-linux.or=
g@SMTP@EUROPAY                         =20
                    19-07-01             Subject:     Re: [parisc-linux] 2.=
4.6-pa20 question about modules        =20
                    01:24 AM                                               =
                                       =20
                                                                           =
                                       =20
                                                                           =
                                       =20



On Wed, Jul 18, 2001 at 06:33:21PM +0200, Jo=EBl Soete wrote:
> Hi Thomas,
>
> With your tips
> (
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-July/013081.html)
>
> the cvs 20010717 seems to works fine.
> (for b180 still have to unplug re-plug kdb)
>
> I also try to recompile it with the .config file supply with
palinux-0.9.2.
> It also seems to works well but modules are not install naturally.
> Can you explain me how to compile it and install it?

If I understand correctly, you are rebuilding the kernel, and want
kernel modules installed correctly under /lib/modules?


cd /usr/src/linux   (or wherever your source tree is)
# save your .config file, if you want it
make distclean
cp <config file> .config
make oldconfig
make dep
make
make modules
make modules_install
cp vmlinux /boot/vmlinux   (or whereever you want it to go)


Richard





**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
