Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA29305
	for <parisc-linux@puffin.external.hp.com>; Mon, 19 Jul 1999 17:15:26 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: parisc-linux@thepuffingroup.com, smoret-puffin@genocide.net
Subject: Re: [parisc-linux] HP9000 J210
Date: Tue, 20 Jul 1999 01:13:54 +0200
Content-Type: text/plain
References: <19990719193639.31498.qmail@mailserv2.iuinc.com>
MIME-Version: 1.0
Message-Id: <99072001163500.00271@P100>
List-ID: <linux-parisc.vger.kernel.org>

Hi Steve !

Am Mon, 19 Jul 1999 schrieb smoret-puffin@genocide.net:
> I've got a HP9000 J210 sitting next to me that I'd like to offer help with.
> I'm able to get precompiled kernels to begin to boot (they give the 
> secret message), but I am unable to get the .lif generator to compile so I 
> can compile my own kernels.

What´s the problem with it ??
You know, that you have to compile the kernel and the LIF currently on hpux
only ??
The cross-compiler doesn´t work yet !

> 
> If someone could offer me some assistance I would appreciate it. Although
> I'm unaware of what type of equipment (SCSI controller, ethernet) is in
> my J210 if someone knows what I should open up to find out I'd help there
> too. 
> 
> So far what I know about the J210: PA-RISC 7200 120MHz CPU, 512meg ram
> no framebuffer, 10bT + AUI ethernet, and it uses bootp (rather than rbootd)
> to boot.

Does the current kernel shows you the processor as "7200" ?
> 
> I'd love to help out,
> 
> -- 
> Steve Moret
> smoret@uci.edu

Helge Deller.
