Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA04626
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Nov 2000 09:21:55 -0700
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp (ident bame using rfc1413)
	id <m13rN6H-001Vp3C@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Thu, 2 Nov 2000 09:20:25 -0700 (MST)
Message-Id: <m13rN6H-001Vp3C@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: Alan Modra <alan@linuxcare.com.au>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] new method for 64-bit parisc tree
In-reply-to: Your message of "Thu, 02 Nov 2000 19:51:19 +1100."
             <Pine.LNX.4.21.0011021825100.26717-100000@front.linuxcare.com.au>
Date: Thu, 02 Nov 2000 09:20:24 -0700
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>


I want to hear concerns because without serious ones I'm going to
make this change next week...

= Instead, can't you simply play tricks with -I, and add a symbolic link
= asm -> ../asm-parisc in asm-parisc64)?  The idea being to end up with
= an include path looking like
= "-I $(TOPDIR)/include -I $(TOPDIR)/include/asm"
= 
= That way, asm/foo.h is found by the first -I if we have asm-parisc64/foo.h,
= and is found by the second if asm-parisc/foo.h exists but not
= asm-parisc64/foo.h.  Hmm, you might also need -I-

That would function fine for header files, but not for source files
where something like VPATH might work, but is not available to us.  It's
worth noting that both -I and VPATH tricks mean if you have an error
in or need to change a file, you may have to examine two
directories to figure out where it really lives.  The symbolic link
scheme solves some of that problem.

	-P
