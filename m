Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA25702
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 Nov 1999 08:34:49 -0700
Received: from udlkern.fc.hp.com (root@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id IAA05662
	for <parisc-linux@thepuffingroup.com>; Thu, 11 Nov 1999 08:36:15 -0700 (MST)
Received: from debian.fc.hp.com (root@debian.fc.hp.com [15.1.48.119]) by udlkern.fc.hp.com with ESMTP (8.8.6 (PHNE_14041)/8.7.1) id IAA13182 for <parisc-linux@thepuffingroup.com>; Thu, 11 Nov 1999 08:36:14 -0700 (MST)
Received: from debian.fc.hp.com (bame@localhost [127.0.0.1])
	by debian.fc.hp.com (8.9.3/8.9.3/Debian/GNU) with ESMTP id IAA19092
	for <parisc-linux@thepuffingroup.com>; Thu, 11 Nov 1999 08:36:14 -0700
Message-Id: <199911111536.IAA19092@debian.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] _end symbol in parisc linux? 
In-reply-to: Your message of "Sat, 06 Nov 1999 13:08:22 MST."
             <30261.941918902@upchuck>
Date: Thu, 11 Nov 1999 08:36:14 -0700
From: Paul Bame <bame@debian.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


I'm also worried about why there are data symbols following BSS in
our current palinux kernel...

= Though I'd worry about precisely *why* someone wants the _end symbol; whatever
= they're trying to do there's probably a better way.

Maybe there is a better way.  The first reason I want to use _end
(and _edata) is to clear the kernel BSS reliably (which is working
great).

The second reason, which doesn't currently work, is to have a symbol
pointing at the very end of kernel memory, since that is where
free memory will start.

Both these tasks are currently being done at run-time -- in one case
by parsing the SOM header and in another case by guessing about a
parameter passed in by the hpux bootloader -- neither is currently
reliable despite the considerable experimentation and
sweat others have poured into the effort.  I want to avoid parsing
the SOM header and guessing about bootloaders in the future.  It
would also be great to use an old, reliable, and language-system
independent.

	-P
