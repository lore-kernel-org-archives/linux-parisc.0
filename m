Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA28860
	for <parisc-linux@puffin.external.hp.com>; Mon, 23 Oct 2000 15:04:59 -0600
Message-Id: <200010232111.OAA18829@milano.cup.hp.com>
To: "Thomas Marteau" <marteaut@esiee.fr>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: A console and a term 
In-reply-to: Your message of "Mon, 23 Oct 2000 22:46:44 PDT."
             <001301c03d32$5b423a60$a832d793@esiee.fr>
Date: Mon, 23 Oct 2000 14:11:03 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Thomas Marteau" wrote:
> Hi Grant,
> 
>     Just a word to tell you that we have now a console on STI and a term on
> our serial port of the 712. It is quite useful to debug the stdout.

Oh good! I was wondering how you guys were doing with the previous
round of advice...let me take a first whack at your following questions.
I've cc'd parisc-linux since I'll probably need to ne corrected. :^)

>     We have copied a terminfo directory into /usr/share. After that we type
> In the term: export TERM=vt100
> In the console: We have not found the good term yet because our screen is an
> A4032A and no term work with. If you have any hints...

I think TERM=linux was the right setting...console terminal emulation
may need fixing too though. I don't know.

> 
>     Also, we are interested in the keyboard and STI drivers but we do not
> have many docs on the subject. So, if you know a URL...

PS/2 keyboard is the standard driver - I'm sure a few of the keys are
mapped differently. I don't have a table of the scancodes. I suggest
looking at mklinux to see how they handle it.

STI document is published on
	http://www.thepuffingroup.com/parisc/documentation.html

I only have a vague idea of what STI really is and what it supports.


>     It is fun to view TOP and VI work. Finally, can you tell us what kind of
> technical feedback you'd like from us. Would you be interested in our
> precise advancement or is the website enough for that (we are planning to
> integrate a sort of Logfile page with the history of all the events which
> occured since the beginning)?

Well, whenever you change any kernel sources and make something more
useful, please post the patch to parisc-linux mailing list. Or post a
URL which points to the patch. Note that we really want to only
fix stuff in arch/parisc* and include/asm-parisc* if we can help it.
(The issue is we'd like to merge into Linus' tree this year and don't
want generic code changes to hold up the process.)

If it gets to be a problem (too many good patches), you will get write
access to the CVS repository.

cheers,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
