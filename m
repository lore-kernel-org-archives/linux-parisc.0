Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA14452
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 01:16:19 -0700
Date: Mon, 15 Nov 1999 09:19:05 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Alex deVries <adevries@thepuffingroup.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
Message-Id: <19991115091905.F30917@mathe.stud.uni-erlangen.de>
References: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com>
List-ID: <linux-parisc.vger.kernel.org>

>         ; Get ready for phys->virt transition
>         ; First order of business is to adjust some pointers
>         depi            3,1,2,%arg0     ; phys->virt(free mem ptr)
>         depi            3,1,2, %sp      ; phys->virt SP
>         depi            3,1,2, %dp      ; p2v DP
> 
> in head.S?
> 
> I don't have a 'depi' in the index of my PA 2.0 assembler book.  I have a
> depwi and a depdi though.

This should be equivalent to what depwi is in PA 2.0 (some mnemonics changed).

More importantly, those instructions shouldn't be here.  There are standard
macros tophys and tovirt defined to do just the right thing to translate
logical addresses from/to physical ones.

Someone should go around and clean it up.  If your file uses depi to do what
tophys / tovirt should do, you have 24 hours to clean it up.  If you don't,
I'll clean up the rest of your file as well.  You have been warned.

	Philipp Rumpf
