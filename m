Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA26982
	for <parisc-linux@puffin.external.hp.com>; Sun, 20 Aug 2000 09:45:47 -0600
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp (ident bame using rfc1413)
	id <m13QXG3-001VsnC@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Sun, 20 Aug 2000 09:43:35 -0600 (MDT)
Message-Id: <m13QXG3-001VsnC@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Networking 
In-reply-to: Your message of "Sat, 19 Aug 2000 22:44:22 PDT."
             <200008200544.WAA09249@milano.cup.hp.com>
Date: Sun, 20 Aug 2000 09:43:34 -0600
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

= Steffen =?ISO-8859-1?Q?L=F6rch?= wrote:
= > Hello all !!!
= > How can I connect my PA-RISC to the network with the CD-Image Version of
= > the PA-RISC Linux.
= 
= Yes and no.
= 
= Yes in that nfsroot works.
= One can also ping the parisc-linux host.
= So the kernel/lan driver seems to work fine.
= 
= No because networking userspace needs more work or something.
= Read the README on the CD for known bugs.
= Did I hear you volunteer to fix those?
= :^)

The kernel on the CD has no bootp stuff because unless you're
on a network that serves a bootp record the boot hangs -- which
didn't seem a good idea!  But this also means the network comes
up unconfigured.

Use ifconfig and route as you normally would on a Linux box to
configure the network.

	-P
