Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA27055
	for <parisc-linux@puffin.external.hp.com>; Thu, 28 Oct 1999 14:24:17 -0600
Sender: phi@hpfrcu81.france.hp.com
Message-ID: <3818B159.958F6B13@hpfrcu03.france.hp.com>
Date: Thu, 28 Oct 1999 22:26:01 +0200
From: Philippe Benard <phi@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: Paul Bame <bame@debian.fc.hp.com>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
        Alan Cox <alan@lxorguk.ukuu.org.uk>, Helge.Deller@ruhr-uni-bochum.de,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] hack to use HPUX boot loader
References: <199910281838.MAA20701@debian.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> If
> Linux was relocated at addresses near zero, this would result in
> user programs having to start at addresses larger than the amount
> of memory used by the kernel, which would be weird.
> 
>         -P

Does someone knows how linux will use the hppa quadran (space) for both
kernel-mode and user-mode for 32bit processor (and 64bit processors running
narrow), this somewhat influance mmap(), or more generally the virtual adress
space usage/limitation.

If someone envisioned the hppa 64 bits wide it would be nice to know as well
the layout and space convention too, this would help to see how narrow binary
could run on a wide kernel.

Phi
