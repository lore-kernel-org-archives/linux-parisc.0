Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 778C64829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 06:03:59 -0600 (MDT)
Message-ID: <3D8F02A2.9040906@esiee.fr>
Date: Mon, 23 Sep 2002 14:01:38 +0200
From: Thibaut VARENE <varenet@esiee.fr>
MIME-Version: 1.0
To: joachim.weller@philips.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem to load kernel by PALO (B2600)
References: <OFD78B3766.71BE9B40-ONC1256C3D.003C55CB@diamond.philips.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

joachim.weller@philips.com wrote:
> 
> Hi,
> i'am new to parisc, but have managed to successfully set up
> an hp715/100 with palinux-0.9.3.
> 
> I have downloaded the latest isoimage 2.4.19-pa19-20020922,
> from http://pateam.esiee.fr/download.html
> 
> In order to exclude CDROM media problems, I tried to burn on
> a regular CD (first one was RW), but again with no success.
> 
> Reading the Boot-howto didn't help.
> Any help very much appreciated !
> 

Hi,

I've just burned this netinst on a RW and tried it on a L1000 (I don't 
have a 715 to test it on alas), and it booted perfectly well.

Therefore I don't think this is an ISO problem, but rather a CD-ROM pb.

Maybe your CD-ROM driver isn't supported... Or damaged.
Have you tried with another one ?

HTH,



Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
