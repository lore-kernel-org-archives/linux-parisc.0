Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA24456
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 11:20:19 -0700
Content-Type: text/plain;
  charset="us-ascii"
From: Helge Deller <deller@gmx.de>
To: "Jorge L. deLyra" <delyra@latt.if.usp.br>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP 9000/735-125
Date: Thu, 30 Nov 2000 19:21:38 +0100
Cc: assirati@socrates.if.usp.br
References: <Pine.LNX.3.96.1001130134528.16737A-100000@latt.if.usp.br>
In-Reply-To: <Pine.LNX.3.96.1001130134528.16737A-100000@latt.if.usp.br>
MIME-Version: 1.0
Message-Id: <00113019213802.00309@P100>
List-ID: <linux-parisc.vger.kernel.org>

On Thursday 30 November 2000 16:49, Jorge L. deLyra wrote:
> OK, rbootd is up and running, the station now establishes instantaneous
> communication with the server. But it says "bad LIF magic" and does not
> boot. I presume I can't just put the precompiled kernel in there. Since
> I cannot cross-compile for the time being (bad HP server disk crash) is
> there a net-boot kernel somewhere that I can download and try?
>
> 							Cheers,

Hi,

Just a thought: are you shure, that you did "make palo" and exported 
palo/lifimage  instead of vmlinux ?

Greetings,

	Helge.
