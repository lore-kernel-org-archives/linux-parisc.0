Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA31359
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 21:16:03 -0700
Date: Wed, 24 Jan 2001 23:19:57 -0500 (EST)
From: Michael Ang <mang@subcarrier.org>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0 merge mangle our tree?
In-Reply-To: <200101250346.TAA21555@milano.cup.hp.com>
Message-ID: <Pine.BSF.4.10.10101242312100.26332-100000@cuzea.pair.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 24 Jan 2001, Grant Grundler wrote:

> I did 'cvs co -D "1/24/2001 09:00 MST" linux' in order to pick
> up the bits before the 2.4.0 "First take" commit.
>
> [...]
> And from the cvs log output:
> head: 1.2
>
> ...
> symbolic names:
> 	LINUS_240_FIXUP: 1.1.0.2
> 	LINUS_240_PREMERGE: 1.1
> 	LINUS_240: 1.1.1.2
> 	LINUX_240_PREIMPORT: 1.1
> [...]
> 
> Why am I picking up the LINUS_240 version of this file?
> Is "-D" the wrong method to use?

These are all the symbolic names for revisions of this file - your
working version might be any of these or none.  "cvs stat" will tell you
what version you currently have.

Using the date should work if you get it just right, but there should have
been a tag laid down before the merge started for just this purpose.

> Tried "cvs update -rLINUS_240_PREMERGE" and that seemed to do what
> I think I wanted. But backs out a few recent changes. *sigh*.

That seems closer to what you want, but backs out any changes made since
the merge started.  Not sure what the difference between *_PREMERGE and
*_PREIMPORT is - you'd have to ask willy, I guess.

	- Mike.
