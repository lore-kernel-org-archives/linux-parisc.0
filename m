Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id CDB02485D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Feb 2002 23:51:06 -0700 (MST)
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <OFCD5822D4.246FA364-ONC1256B61.0024B267@com>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Fri, 15 Feb 2002 07:46:19 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Re: kernel-2.4.17-pa22 boot problem B132L+ with serial
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

Hi Grant,

> Disappointed?! are you kidding?! This is great! :^)

Nice ("disapointing" was just a joke) :-) )

>> ...
>> RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
>> loop: loaded (max 8 devices)
>> Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
>> tulip0: no phy info, aborting mtable build
>> tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
>> eth0: Digital DS21143 Tulip rev 65 at 0xf0fff000, 00:10:83:65:09:4B, IRQ
>> 96.

> Is this output from B132L with card-mode Dino?
> or with built-in 21143 on B180L?

It was "built-in 21143 on B180L" (is there a difference here between b180
and b132?)

Joel




                                                                           =
                                               =20
                    Grant Grundler                                         =
                                               =20
                    <grundler@dsl2.extern        To:     "Jo=EBl Soete" <js=
o@europay.com>                                   =20
                    al.hp.com>                   cc:     parisc-linux@lists=
.parisc-linux.org                              =20
                                                 Subject:     Re: kernel-2.=
4.17-pa22 boot problem B132L+ with serial      =20
                    15-02-02 05:48 AM                                      =
                                               =20
                                                                           =
                                               =20
                                                                           =
                                               =20




"=3D?iso-8859-1?Q?Jo=3DEBl_Soete?=3D" wrote:
> Sorry first for delay.
>
> Sorry also if I desapoint you but "CONFIG_TULIP_MMIO=3Dy" works for my b1=
80
> (afaik same HW than b132l+ but processor clock?) with last k-2.4.17-pa23:

Disappointed?! are you kidding?! This is great! :^)

> ...
> RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
> loop: loaded (max 8 devices)
> Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
> tulip0: no phy info, aborting mtable build
> tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
> eth0: Digital DS21143 Tulip rev 65 at 0xf0fff000, 00:10:83:65:09:4B, IRQ
> 96.

Is this output from B132L with card-mode Dino?
or with built-in 21143 on B180L?

Just curious....

thanks,
grant






**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
