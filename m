Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA28727
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 01:41:29 -0700
Message-ID: <001801c05dce$b717a480$a832d793@esiee.fr>
From: "Thomas Marteau" <marteaut@esiee.fr>
To: "Andreas Thienemann" <andreas@bawue.de>
Cc: <parisc-linux@thepuffingroup.com>
References: <3A298032.7CBAEB95@bawue.de>
Subject: Re: [parisc-linux] Again trouble with HP9000/821/D250
Date: Mon, 4 Dec 2000 09:46:38 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hi Andreas,

    You say to your kernel that you boot with the nfsroot support and you
told us in your mail that is ramdisk boot you want. To my mind, nfsroot is
better, especially if you go to http://www.esiee.fr/puffin and you download
our fs root with lynx and termcap.

    But your problem comes from the point that you did not configure your
palo Makefile. If you want ramdisk, edit Makefile in Palo directory,
uncomment # RAMDISK and comment NFSROOT=10.0.0.2 and be sure of the name of
the file containing the ramdisk (that should be in your tftpboot as far as I
know!).
