Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6309F482B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Jul 2001 09:40:06 -0600 (MDT)
Subject: Re: [parisc-linux] palinux 0.9.1
To: rhirst@linuxcare.com
Cc: parisc-linux@lists.parisc-linux.org, puffin@esiee.net
Message-ID: <OFD4FFC380.1EA16BBB-ONC1256A84.0055A177@LocalDomain>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Mon, 9 Jul 2001 17:42:10 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

FYI

I just recompile last cvs kernel (20010709 ie 2.4.6-pa7)
It boot fine (whithout yet STICON, just as before kernel of palinux-0.9).
So I believe that STICON on B180 will work soon.

Kind regards,
     Joel



                                                                           =
                                  =20
                    Richard Hirst                                          =
                                  =20
                    <rhirst@linux        To:     Jo=EBl Soete/BRU/MASTERCAR=
D@MASTERCARD                        =20
                    care.com>            cc:     "Richard Hirst <rhirst"   =
                                  =20
                                         <rhirst%linuxcare.com%SMTP%EUROPAY=
@mastercard.com>@SMTP@EUROPAY,    =20
                    09-07-01             parisc-linux@lists.parisc-linux.or=
g@SMTP@EUROPAY,                   =20
                    09:46 AM             puffin@esiee.net@SMTP@EUROPAY     =
                                  =20
                                         Subject:     Re: [parisc-linux] pa=
linux 0.9.1                       =20
                                                                           =
                                  =20



On Fri, Jul 06, 2001 at 02:57:19PM +0200, Jo=EBl Soete wrote:
>
>
> Hello Richard,
>
> The problem ip_local_deliver:... cames in fact from the dhcp_client which
> is started by default?

I reproduced that problem; hadn't seen it before because I usually
use dhcp to configure my network.  Seems you only get the errors if
dhcp-client doesn't have any real interfaces to configure.

> For the sti console, I do have to be unlucky; I get backup the kernel
> installed with 0.9 then ps2 kbd works back ( I also suspect the kbd and
> change it, no difference)? what could be the problem? I also try to get
the
> last firmware but HP prevent to install it over the builtin ?

You are not the only person with this problem, so hopefully someone will
fix it soon.

Richard





**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
