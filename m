Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA09540
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 14:41:39 -0700
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by atlrel1.hp.com (Postfix) with ESMTP id 1861827D4
	for <parisc-linux@thepuffingroup.com>; Tue, 16 Nov 1999 16:43:13 -0500 (EST)
Received: from hp.com (localhost [127.0.0.1]) by xsvr4.cup.hp.com with ESMTP (8.7.6/8.7.3) id NAA13980 for <parisc-linux@thepuffingroup.com>; Tue, 16 Nov 1999 13:43:12 -0800 (PST)
Sender: frowand@cup.hp.com
Message-ID: <3831CFF0.F4B3CE3E@hp.com>
Date: Tue, 16 Nov 1999 13:43:12 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
References: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com> <199911150736.XAA14959@opus.allegro.com> <19991115092549.G30917@mathe.stud.uni-erlangen.de> <383093DE.A8B73CE4@hp.com> <19991116170819.B750@mathe.stud.uni-erlangen.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> 
> > This is just one of several recent messages dealing with the issues caused by
> > locating the kernel at virtual address 0xc0000000 instead of 0x00000000.  I
> > still don't understand why the kernel can't be at zero, even though several
> > people have tried to explain it to me.  Can anyone provide a clear
> > explanation?
> 
> Advantages of mapping the kernel at 0xc000 0000 (or 0x8000 0000/0xe000 0000)
> 

< stuff deleted >

> 
> Disadvantages
> 

   - C code that needs to run in real mode seems to be rather fragile, given
     Paul's recent experience with head.c.  (I think it was Paul.)

   - A single instance of code can't (easily) be coded to be able to run both
     in real mode and in virtual mode.

   - It's real easy to mis-code real mode assembly (eg. use the PA() macro when
     it shouldn't be used or don't use it when it should be used).

   - Issues with coherent I/O.

< stuff deleted >

-Frank
