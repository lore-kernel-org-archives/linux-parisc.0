Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA19797
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Nov 2000 15:01:08 -0700
Received: from lightning.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 28 Nov 2000 22:03:10 -0000
Subject: Re: [parisc-linux] Include trouble
To: bame@noam.fc.hp.com (Paul Bame)
Date: Tue, 28 Nov 2000 21:58:56 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox),
        dave@hiauly1.hia.nrc.ca (John David Anglin),
        alan@linuxcare.com.au (Alan Modra), marteaut@esiee.fr,
        parisc-linux@thepuffingroup.com
In-Reply-To: <E140sBV-0005ao-00@noam.fc.hp.com> from "Paul Bame" at Nov 28, 2000 02:21:05 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E140sm9-00056C-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Seems like the consensus is 32-bit off_t on 32-bit kernel and just
> live with all those *64 syscalls -- many not supported on palinux
> yet I notice.

Remember providing you use off_t you can just tell glibc to do all the work
for you and write with a 64bit off_t to userspace
