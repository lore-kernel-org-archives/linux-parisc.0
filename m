Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA18888
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 16:01:08 -0700
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by atlrel1.hp.com (Postfix) with ESMTP id 1AFCF120B
	for <parisc-linux@thepuffingroup.com>; Wed, 17 Nov 1999 18:02:45 -0500 (EST)
Received: from hp.com (localhost [127.0.0.1]) by xsvr4.cup.hp.com with ESMTP (8.7.6/8.7.3) id PAA09547 for <parisc-linux@thepuffingroup.com>; Wed, 17 Nov 1999 15:02:38 -0800 (PST)
Sender: frowand@cup.hp.com
Message-ID: <3833340E.59C7BDB4@hp.com>
Date: Wed, 17 Nov 1999 15:02:38 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
References: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com> <199911150736.XAA14959@opus.allegro.com> <19991115092549.G30917@mathe.stud.uni-erlangen.de> <383093DE.A8B73CE4@hp.com> <19991116170819.B750@mathe.stud.uni-erlangen.de> <3831CFF0.F4B3CE3E@hp.com> <19991117071226.G750@mathe.stud.uni-erlangen.de> <3832FA61.F977451E@hp.com> <19991117230531.D10209@mathe.stud.uni-erlangen.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:

< stuff deleted - I don't need to argue, my face is already turning blue... >

> What I really want to know is  which algorithm do recent CPUs use to get the
> cache bank index / cache tag.

< stuff deleted >

> [note: what follows is what I think is a proof we can do what I want to do.
> It is very likely to contain formal/grammatical mistakes but I think it should
> be valid nontheless].
> 
>   The Rules

<stuff deleted >

> Any mistakes to point out ?  Misunderstandments in the specification ?  Other-
> wise could the specification please get fixed ?
> 
>         Philipp Rumpf


I didn't bother reading the proof, so no arguments about it.  I already thought
through what is probably a similar proof for myself.

The problem is that no matter how obvious it is to us software folks that it
would be braindead, illogical, or nearly impossible for the hardware to
behave in strange ways, the hardware folks are incredibly devious at making
the hardware more effective, within the constraints of the architecture
(and, on occasion, outside the constraints).  This results in behaviour that
may seem unreasonable to a software person.


*****  I attempt to code within the ARCHITECTURE, not to implement what
specific hardware implementations let me get away with.  That way I don't
get burnt by the creative hardware engineers, who might be pushing the
envelope.  *****


-Frank
