Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 890B4482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 12:14:07 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: <nick@snowman.net>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 netbooting
Date: Thu, 23 Aug 2001 20:12:57 +0200
References: <Pine.LNX.4.21.0108231256390.16296-100000@ns>
In-Reply-To: <Pine.LNX.4.21.0108231256390.16296-100000@ns>
MIME-Version: 1.0
Message-Id: <20010823181407.890B4482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Thursday 23 August 2001 18:58, nick@snowman.net wrote:
> Hi, I'm trying to get a C180 booting entirely off the network.  I can load
> a lifimage over bootp, however then I'm stuck.  There is a vmlinux
> attached to the lifimage, but I can't figure out how to tell the loader to
> boot that and use an NFSroot.  I have found a few suggestions (vmlinux
> HOME=/ TERM=linux root=/dev/nfs nfsroot=mynfs:/dir) and that dosen't seem
> to work.  Do I need a special lifimage?
> 	Nick

Hi Nick,

you forgot to mention which kernel version you booted.
In case you use a newer 2.4 kernel you'll have to add "ip=bootp" and should use 
an ip-address instead of <mynfs> in the nfsroot parameter.

Greetings,
Helge
