Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA23549
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Jun 1999 14:48:14 -0600
Received: (from tor@localhost)
	by pallas.spacetec.no (8.9.1a/8.9.1) id WAA02220
	for parisc-linux@thepuffingroup.com; Wed, 9 Jun 1999 22:48:11 +0200
Message-Id: <199906092048.WAA02220@pallas.spacetec.no>
From: tor@spacetec.no (Tor Arntsen)
Date: Wed, 9 Jun 1999 22:48:08 +0200
In-Reply-To: Alex deVries <adevries@redhat.com>
       "[parisc-linux] making a bootable image" (Jun  9, 19:44)
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] making a bootable image
List-ID: <linux-parisc.vger.kernel.org>

On Jun 9, 19:44, Alex deVries wrote:
>I've committed my changes which basically fix up the kernel so you can
>build it with 'make bootable', and the bootstrap code will be setup
>correctly in a file called bootstrap.bin.

For those of you who are able to actually compile all the way through,
what does your .config look like?

echo `grep -v # .config | grep -v 'not set' | grep 'CONF'` \
|mail parisc-linux@thepuffingroup.com

:-)

-Tor
