Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA04139
	for <parisc-linux@puffin.external.hp.com>; Tue, 4 Jul 2000 19:54:20 -0600
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp (ident bame using rfc1413)
	id <m139eMc-001VsnC@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Tue, 4 Jul 2000 19:52:34 -0600 (MDT)
Message-Id: <m139eMc-001VsnC@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: drepper@cygnus.com (Ulrich Drepper)
cc: Alan Modra <alan@linuxcare.com.au>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Get rid of %r8 linker stubs
In-reply-to: Your message of "04 Jul 2000 17:57:41 PDT."
             <m3em591ji2.fsf@otr.mynet.cygnus.com>
Date: Tue, 04 Jul 2000 19:52:33 -0600
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

= Alan Modra <alan@linuxcare.com.au> writes:
= 
= > The trouble is that _init is a single function that's been split in two
= > (see glibc/csu/Makefile crti,crtn), thus the linker thinks it's quite OK
= > to insert a stub at the start of the second section.  I'll have to do
= > something special with the .init section to work around this problem.
= 
= Simply create an appropriate initfini.c file for HP/UX.  Look in the
= current glibc sources and you'll see that we already do this for SH.

I don't think that'll work, because the parisc linker thinks it's allowed
to insert stubs in between separately-loaded things like functions.  The
use of .init from multiple .o files looks to the linker just like the
use of .text from multiple .o files.  I'd say there's a good chance the
linker might insert stubs *between* individual .init entries too (not
to mention .fini, and in general users can probably create arbitrary
segments to act similarly).

So unless we get to change how .init works (ugly hacks to gas perhaps?
I hope not) I think a special case in the linker is required.  I just
hope there's some sort of attribute on these magic kludge segments which
the linker can use rather than hard-coding the names or something.

Hopefully someone else has a better idea.

	-Paul Bame
