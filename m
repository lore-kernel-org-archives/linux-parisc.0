Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA15620
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 13:13:15 -0700
Message-Id: <200101252019.MAA22397@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] CPU detection wrong 
In-reply-to: Your message of "Thu, 25 Jan 2001 14:52:44 PST."
             <20010125145244.C25242@parcelfarce.linux.theplanet.co.uk>
Date: Thu, 25 Jan 2001 12:19:10 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> we have the following entry in hardware.c:
> 
>         { 0x05c0, 0x0fc0, pcxw   },  /* 0x05c0 - 0x05ff */
> 
> however, 5d5 is a pcxw+ (pa8600).  I don't know enough to change this
> because i don't have a list of which ids are assigned.

Linuxcare doesn't have this info either (afaik). I'm helping to sort
this out. Should have an answer by the end of today.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
