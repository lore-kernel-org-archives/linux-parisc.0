Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id ADE3A482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Jul 2001 00:18:40 -0600 (MDT)
Received: from mcnbru01 (unverified) by epirel991.europay.com
 (Content Technologies SMTPRS 4.1.5) with ESMTP id <Tac10592d548e90acd8@epirel991.europay.com> for <parisc-linux@lists.parisc-linux.org>;
 Thu, 5 Jul 2001 08:18:18 +0200
Subject: Re: [parisc-linux] How to access the second serial port on a B180 with
 PALINUX
To: "Richard Hirst <rhirst" <rhirst%linuxcare.com%SMTP%EUROPAY@mastercard.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <OF3D27F1D3.35C57203-ONC1256A80.00214005@LocalDomain>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Thu, 5 Jul 2001 08:11:05 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Richard,

I well find it but there is a problem with ps2 keyboard (on B180) with this
kernel.
Awaiting the patch I am instaling 0.9.1 with a serial console which will
help me for the second serial port.

Thanks a lot
     Joel



                                                                           =
                                  =20
                    Richard Hirst                                          =
                                  =20
                    <rhirst@linux        To:     Jo=EBl Soete/BRU/MASTERCAR=
D@MASTERCARD                        =20
                    care.com>            cc:     parisc-linux@lists.parisc-=
linux.org@SMTP@EUROPAY            =20
                                         Subject:     Re: [parisc-linux] Ho=
w to access the second serial port=20
                    04-07-01             on a B180 with PALINUX            =
                                  =20
                    11:57 PM                                               =
                                  =20
                                                                           =
                                  =20
                                                                           =
                                  =20



On Wed, Jul 04, 2001 at 08:59:39AM +0200, Jo=EBl Soete wrote:
> Hio,
>
> I just re-install my B180 with the last palinux-0.9 CD.
>
> With STI console gpm also works excepted that it do not highlight a
> double-click selection (but selection works)?
>
> I would also like to test the second serial port available on this model.
> Is any have tips or idea?

Support has recently been added to the kernel for the second serial
port.  Either grab a new kernel from puffin.external.hp.com, I think
Matt Taggart posted some recently, or build your own.

Richard





**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
