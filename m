Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7AE4D4A18
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Feb 2001 10:14:39 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA10035
	for <parisc-linux@puffin.external.hp.com>; Fri, 2 Feb 2001 10:10:28 -0700
Received: from localhost (xam@localhost)
	by sgate.charlysworld.de (8.11.0/8.11.0) with ESMTP id f12HEKw16939
	for <parisc-linux@thepuffingroup.com>; Fri, 2 Feb 2001 18:14:22 +0100
Date: Fri, 2 Feb 2001 18:14:19 +0100 (CET)
From: "M. Grabert" <xam@deathsdoor.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 720/50 SCSI - supported?
In-Reply-To: <200102011141.WAA11608@customware.com.au>
Message-ID: <Pine.LNX.4.21.0102021804060.31237-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 1 Feb 2001 penfold@customware.com.au wrote:

> Hi,
> 
> after successfully cross compiling a kernel, I have a problem!

[blablabla] :)

seems to be the same problems I have with my 730 ...
... nearly exactly the same messages and behaviour.
Since the 720 and 730 have similar hardware AFAIK, it
could be the same problem. Unfortunately I'm not a kernel hacker
nor I have the time (because I'm working currently on my final diploma
documentation).
It doesn't matter wether a scsi floppy is connected or not, btw ...

> Is this a known problem ?

someone told me that it is known; it's because of the broken ncr700
support on 730 machine (and perhaps 720 also)

greetings, max
