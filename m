Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id D7A88482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 22 Aug 2001 08:24:32 -0600 (MDT)
Subject: Re: [parisc-linux] Kernel 2.4.9-pa2?
To: "Matthew Wilcox <willy" <willy%debian.org%SMTP%EUROPAY@mastercard.com>
Cc: Helge Deller <deller@gmx.de>, parisc-linux@lists.parisc-linux.org
Message-ID: <OF30E9B335.EAAF4124-ONC1256AB0.004DDCBB@LocalDomain>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Wed, 22 Aug 2001 16:27:24 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Hi Matthew,

I just try to investigate a little bit:
a) I do not encountered the problem with an IA32 (not exactly the same
config file but I thing it should be independent)
b) the problem was not present on kernel-2,4,6-pa22 but appears in fact
with kernel-2.4.7-pa1 (sorry to not have reported at this time)

The problem seems to dependent of pa-risc (and only some one as the 715
model do not seems to affected)

Kind regards,
     Joel

PS: If it could help you, I can also test on a sparc20 to be sure.



                                                                           =
                                       =20
                    Matthew                                                =
                                       =20
                    Wilcox               To:     Helge Deller <deller@gmx.d=
e>@SMTP@EUROPAY                        =20
                    <willy@debian        cc:     Jo=EBl Soete/BRU/MASTERCAR=
D@MASTERCARD,                            =20
                    .org>                parisc-linux@lists.parisc-linux.or=
g@SMTP@EUROPAY                         =20
                                         Subject:     Re: [parisc-linux] Ke=
rnel 2.4.9-pa2?                        =20
                    21-08-01                                               =
                                       =20
                    08:46 AM                                               =
                                       =20
                                                                           =
                                       =20
                                                                           =
                                       =20



On Tue, Aug 21, 2001 at 08:36:56AM +0200, Helge Deller wrote:
> Oops, I think you found a bug in the kernel. Don't know yet if it's
> only pa-risc specific or a general linux-kernel issue.

I think you're right.  Richard saw it on an A500 with 2.4.8 too.
I've seen a few scattered reports from people on other architectures
that they're seeing the same thing.

I went over the softirqd code this morning, and nothing jumped out at
me and said `this is something parisc is doing wrong'.  Maybe more eyes..

--
Revolutions do not require corporate support.





**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
