Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost (ca-ol-sqy-11-246.abo.wanadoo.fr [213.56.234.246])
	by dsl2.external.hp.com (Postfix) with SMTP id 653744A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 15:02:17 -0700 (MST)
From: WIES Nicolas <n.wies@wanadoo.fr>
Reply-To: n.wies@wanadoo.fr
Date: Thu, 22 Feb 2001 23:01:03 +0100
Content-Type: text/plain;
  charset="iso-8859-15"
To: parisc-linux@lists.parisc-linux.org
References: <200102212047.VAA18271@zaphod.halden.lillfab.se>
In-Reply-To: <200102212047.VAA18271@zaphod.halden.lillfab.se>
Subject: Re: [parisc-linux] Help wanted on an 715/50 "old Box" 2
MIME-Version: 1.0
Message-Id: <01022223010301.01360@nw>
List-ID: <linux-parisc.vger.kernel.org>

Le Mercredi 21 Février 2001 21:47, vous avez écrit :
> On 20 Feb, Alex deVries wrote:
> > It seems very unlikely that's a Tulip chip, since that's a PCI chipset
> > that can't connect to EISA.  If it's another EISA ethernet chipset,
> > there's still some WAX work we need to get through.
>
> Actually I think there was EISA tulips (DC21040-based), but for Linux
> you need to use the de4x5 driver rather than the tulip driver.
>
> /Daniel

Thanks for this information. This card comes from HP, this an extension card 
available when the 715 was buy. It's the HP 25567B EISA LAN adapter.

I try yesterday to boot from a kernel by rbootd, but during 1H30 nothing 
append.
I retry this weekend with the last kernel from the FTP.


Nicolas
-- 
Adresse de réponse  / return address :

	n.wies@wanadoo.fr

:-)
