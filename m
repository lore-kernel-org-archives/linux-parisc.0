Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA25629
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Dec 2000 13:05:14 -0700
Content-Type: text/plain;
  charset="us-ascii"
From: Helge Deller <deller@gmx.de>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Net boot image.
Date: Fri, 1 Dec 2000 21:07:53 +0100
Cc: assirati@socrates.if.usp.br
References: <Pine.LNX.3.96.1001201150626.7803A-100000@latt.if.usp.br>
In-Reply-To: <Pine.LNX.3.96.1001201150626.7803A-100000@latt.if.usp.br>
MIME-Version: 1.0
Message-Id: <00120121075302.00316@P100>
List-ID: <linux-parisc.vger.kernel.org>

On Friday 01 December 2000 18:12, Jorge L. deLyra wrote:
> I saw on the list that someone had managed to boot using Image-20000803 so
> I tried to net boot our 735-125 with it and it worked. I mean, the netboot
> part, the kernel hangs at the same point as before: ASP. 

Hi Jorge,

The ASP-parport-problem was fixed yesterday. You should try a newer kernel, 
or cross-compile yourself a new one.

Greetings,

         Helge
