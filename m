Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from patty.levels.unisa.edu.au (patty.levels.unisa.edu.au [130.220.36.156])
	by dsl2.external.hp.com (Postfix) with ESMTP id 02F7D482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 19:18:17 -0600 (MDT)
Date: Sat, 5 May 2001 10:48:14 +0930 (CST)
From: Alan Modra <alan@SPRI.Levels.UniSA.Edu.Au>
To: Matthew Wilcox <matthew@wil.cx>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	<parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
In-Reply-To: <20010505020157.O32445@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.30.0105051041090.7143-100000@mullet.itr.unisa.edu.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 5 May 2001, Matthew Wilcox wrote:

> was found.  would anyone care to remember anything else that they thought
> `might be a problem at some point'?

lock alignment => malloc alignment.  (Possibly already fixed with new
glibc. I haven't checked.)

[re: FUNCTION_OK_FOR_SYSCALL == 0]
> I vaguely remember that.  Searching the list archive finds:
> http://lists.parisc-linux.org/pipermail/parisc-linux/2000-July/009002.html

That patch seems to be a merge, so we don't have the real reason for
the change.
