Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B463482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Aug 2001 05:18:47 -0600 (MDT)
Subject: Re: [parisc-linux] XFree86 on B180
To: "Helge Deller <helge.deller" <helge.deller%sap.com%SMTP%EUROPAY@mastercard.com>
Cc: debian-hppa@lists.debian.org, parisc-linux@lists.parisc-linux.org
Message-ID: <OFDE09A728.E76CFFEA-ONC1256A9D.003E3924@LocalDomain>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Fri, 3 Aug 2001 13:21:23 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Hello Helge,

Thanks a lot for information,
     Joel



                                                                           =
                                       =20
                    Helge Deller                                           =
                                       =20
                    <helge.deller        To:     Jo=EBl Soete/BRU/MASTERCAR=
D@MASTERCARD,                            =20
                    @sap.com>            parisc-linux@lists.parisc-linux.or=
g@SMTP@EUROPAY,                        =20
                                         debian-hppa@lists.debian.org@SMTP@=
EUROPAY                                =20
                    03-08-01             cc:                               =
                                       =20
                    12:45 PM             Subject:     Re: [parisc-linux] XF=
ree86 on B180                          =20
                                                                           =
                                       =20
                                                                           =
                                       =20



> On the B180 I use the same XF86config as on 712/80, the one from  Thomas
> Bogendoerfer available at:
>
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-June/012928.html
> ......
>
> With kernels 2.4.0-32 and 2.4.6 xdm failed because:
> "(EE) No devices detected.
>
> Fatal server error:
> no screen found.
> ..."

Hi Jo=EBl,

The only way to get XFree86 running on parisc atm is to use the
XFree86-fbgen (framebuffer)
driver in conjunction with the kernel stifb driver. This means, that if you
see the graphical
pengiun (TUX) at bootup on your screen, XFree86 should  run. If you don't
see it, you have a
not yet by stifb supported graphic chip in your machine.
Currently stifb will run on most 712 and 715 machines, while B160, B180,
C3000 and most
others won't.

Greetings,
Helge
--
_______________________________________________________________________

THE BEST RUN E-BUSINESSES RUN SAP
_______________________________________________________________________

Helge Deller                            email: helge.deller@sap.com
SAP AG Walldorf/Baden, Germany
LinuxLab

SAP LinuxLab support address: linux@sap.com





**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
