Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA26206
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Jun 1999 17:26:39 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 9 Jun 1999 23:26:07 -0000
Subject: Re: [parisc-linux] Trying to get HP-UX working
To: taggart@rascal.fc.hp.com (Matt Taggart)
Date: Thu, 10 Jun 1999 00:19:58 +0100 (BST)
Cc: alan@lxorguk.ukuu.org.uk, tor@spacetec.no, parisc-linux@thepuffingroup.com
In-Reply-To: <199906092252.QAA06166@rascal.fc.hp.com> from "Matt Taggart" at Jun 9, 99 04:52:29 pm
Content-Type: text
Message-Id: <E10rrdl-0000sB-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

>  >I can't however get HP/UX to set up an interface 
>  >
>  >	194.168.151.23 netmask 255.255.255.224
> 
> Are you getting errors or do you just need to know where to make changes? 
> If it's the former, post the errors and maybe someone can help. If its the 
> latter, you probably want to edit /etc/rc.config.d/netconf

Umm webconsole doesnt support cut/paste

ifconfig lan0 194.168.151.23 netmask 255.255.255.224
ifconfig: ioctl (SIOCSIFNETMASK): bad value

Which is kind of a problem

> for distribution. Rebuilding a system from one of these CD's only takes 
> about 20 minutes. The image could be rebuilt fairly easily if it needed to 
> be updated.  I can also help with this if needed.
> 
> What does everyone think?

A set of GNU tools for HP/UX in a easy format is probably going to make many
HP/UX users happy too - SCO has the "skunkware" CD which is basically a 
GNU brain transplant or SCO and is a similar idea.

Alan
