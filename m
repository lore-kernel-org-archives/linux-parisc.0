Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA05169
	for <parisc-linux@puffin.external.hp.com>; Wed, 29 Sep 1999 08:07:43 -0600
Received: (from pschwan@localhost)
	by burrow.puffingroup.com (8.8.7/8.8.7) id KAA17063
	for parisc-linux@thepuffingroup.com; Wed, 29 Sep 1999 10:33:40 -0400
Message-ID: <19990929103340.B14605@thepuffingroup.com>
Date: Wed, 29 Sep 1999 10:33:40 -0400
From: Phil Schwan <pschwan@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HOSTCC vs CC and other nits
References: <199909290605.XAA06877@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199909290605.XAA06877@milano.cup.hp.com>; from Grant Grundler on Tue, Sep 28, 1999 at 11:05:27PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Sep 28, Grant Grundler wrote:
>   That means use HOSTCC (instead of $(CC)) in the Makefiles.
>   I can then do "make vmlinux HOSTCC=cc".

Oops.  Understandable desire, you're right of course.

> o I don't have obj_dump. And I haven't the faintest clue
>   where to find it. Could we use nm instead?

It's part of GNU binutils, which I thought we required to build the
kernel anyways?

> o I looked at checkalign.c and am feeling a bit confused.
>   Why is the code testing for 4K alignment?
>   I though the requirement was 8K alignement...

It tests based on the assumption that it's either 4K or 8K aligned.
If it's in fact only aligned on a 4K boundary, addr&4096 will be true.
Or have I horked that?

> Perl is probably better for this kind of stuff (has "&"
> operator which is missing from awk). But I'm not a very good
> perl hacker...

We figured that requiring perl to build was probably a bad idea.  Not
that this whole thing isn't already a bad idea... :)

I'll make some changes to make it more friendly.

-Phil
