Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA18289
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 11:41:28 -0700
Received: from bame.verinet.com (really [127.0.0.1]) by bame.verinet.com
	via in.smtpd with esmtp (ident bame using rfc1413)
	id <m11nQwX-000IbGC@kh12> (Debian Smail3.2.0.101)
	for <parisc-linux@thepuffingroup.com>; Mon, 15 Nov 1999 11:33:33 -0700 (MST)
Message-Id: <m11nQwX-000IbGC@kh12>
From: bame@verinet.com
Reply-To: bame@verinet.com
Errors-To: bame@verinet.com
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] arch/parisc/kernel/realmode_setup.c Question
Date: Mon, 15 Nov 1999 11:33:28 -0700
Sender: bame@bame.verinet.com
List-ID: <linux-parisc.vger.kernel.org>


I don't work Mondays, but I saw this by chance and thought I should
respond as the culprit :-)

Don't knock yourself out figuring out where a C3000 is dying now
(this can be a TREMENDOUS time sink!).  If you want to get a better PIM
dump of the problem, comment out the 'mtctl ??, %cr14' in head.S.

But logic is all that's required here.  The RFI attempts to
"resume" executaion at 0xC<something> which isn't mapped, and there's
no TLB handler (that I know of, haven't studied it yet though), so this
will generate an immediate fault.

I'm glad folks are finding the C setup code easier to grok, but I
warn that the most innocent-seeming change can cause the compiler to
generate something which will lead to a mysterious death while booting!
This fragility is unacceptable.

The "best" solution to this which I've come up with is to segregate the
realmode code like Phillip suggests, and link it into a small separate
executable, so that vmlinux is logically two executables in one.  This
design is a bit twisted and will mainly impact a couple of Makefiles as well
as head.S, realmode_setup.c, setup.c, and cosmetic changes to traps.c
However once it's done it'll be easy to understand, change, and maintain
the realmode startup code.

I'm planning to start this tomorrow so somebody stop me if it seems stupid.
Very rough notes -- very rough -- about the twisted design can be found at
http://puffin.external.hp.com/~bame/boot.html  I'd like to be shown there's
an easier way...

	-Paul Bame
