Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id 534A1482A
	for <parisc-linux@parisc-linux.org>; Thu, 19 Jul 2001 00:07:48 -0600 (MDT)
Received: from mcnbru01 (unverified) by epirel991.europay.com
 (Content Technologies SMTPRS 4.1.5) with ESMTP id <Tac10592d54d69fc479@epirel991.europay.com> for <parisc-linux@parisc-linux.org>;
 Thu, 19 Jul 2001 08:07:27 +0200
To: "Thomas Marteau <marteaut" <marteaut%esiee.fr%SMTP%EUROPAY@mastercard.com>
Cc: parisc-linux@parisc-linux.org
Message-ID: <OF166CA386.DB754B89-ONC1256A8E.00206BB9@LocalDomain>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Thu, 19 Jul 2001 08:05:42 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Re: 2.4.6-pa20 question about modules
List-ID: <linux-parisc.vger.kernel.org>

Thomas,

Thanks a lot for information.

I am so waiting your patch for kbd (the cvs question was in fact to try to
understand changes that make ps2 kbd un-operational and by the way why
unplug re-plug of b180 kbd was requested).

Always happy to try to help free and open software community.

Joel



                                                                           =
                                       =20
                    Thomas                                                 =
                                       =20
                    Marteau              To:     Jo=EBl Soete/BRU/MASTERCAR=
D@MASTERCARD,                            =20
                    <marteaut@esi        parisc-linux@parisc-linux.org@SMTP=
@EUROPAY                               =20
                    ee.fr>               cc:                               =
                                       =20
                                         Subject:     Re: 2.4.6-pa20 questi=
on about modules                       =20
                    19-07-01                                               =
                                       =20
                    12:29 AM                                               =
                                       =20
                                                                           =
                                       =20
                                                                           =
                                       =20



Hi Jo=EBl and all,
>
> With your tips
> (
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-July/013081.html)
>
> the cvs 20010717 seems to works fine.
> (for b180 still have to unplug re-plug kdb)
Nice to know that. But, I think I will deliver a big patch for the
keyboard story. Then, I will need some testers. Thanks to be one of them
:)
>
> I also try to recompile it with the .config file supply with
palinux-0.9.2.
> It also seems to works well but modules are not install naturally.
> Can you explain me how to compile it and install it?
>
First, you must know that some of the drivers are not modularized yet. I
think that it looks like pc modules. But since I am not a guru in this
stuff, I think someone else will tell you
> Thanks in advance for help,
>      Joel
>
> PS: How is it possible to cvs co a previous kernel release now (f.e.
> 2.4.0-pa30)?
I would like to know. I think, if you read at Paul Bame litterature, he
said that it is broken for 2.4.0.
I can grab old versions with cvs co -r 1.83 linux, for example.
To know the release you want, use this:
http://puffin.external.hp.com/cgi-bin/cvsview/

Thanks again for reporting, Thomas.
ESIEE Team

PS: I also hope an explanation of modules on hppa. I will have to write
all the cleanup stuff for the mouse.





**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
