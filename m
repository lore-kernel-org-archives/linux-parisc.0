Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA19277
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Jan 2001 13:19:32 -0700
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp
	id <m14GRjp-001Vp3C@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Wed, 10 Jan 2001 13:20:53 -0700 (MST)
Message-Id: <m14GRjp-001Vp3C@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: "Phillip D. Beal" <pdbeal@louisville.edu>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] PALO CD Creation
In-reply-to: Your message of "Wed, 10 Jan 2001 15:07:02 EST."
             <20010110150702.A30218@athena.louisville.edu>
Date: Wed, 10 Jan 2001 13:20:52 -0700
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

= Hey,
= 
= I've been building the latest kernel stuff, and I see that its getting
= close to complketiong for the STI console.  First off I'd have to say
= great job so far.  I would like to create a bootable CD with one of the
= kernels I have built from cvs.  The kernel boots on a 755 and 735
= throught the network, but there are other machines I've been asked to
= try this on, and I need a CD.  I've read through the README from the
= palo sources

Sometimes the README.html is more up to date -- README is derived from it.

= and followed the steps to create a CD, but I have a
= question about this steps.  Are all the steps executed on an HPUX
= machine, a PARISC machine, or a standard linux machine?  If they are
= created on a linux machine, where can someone get the palo binary for
= i386 linux.

I master the CD and run palo on x86 Linux.  If you're using x86 to
cross-compile your Linux kernels you have the required palo binary
already.  Since the CD mastering software is probably not yet compiled
for palinux I think x86 Linux is your best choice.

= Also, the README needs a little bit of an update too I
= think, since we now have to pass console=[tty0|ttyS0] to palo.

The kernel command line is not specific to parisc and so the standard
Linux documentation should be used.  Palo's README does not duplicate
this information -- it should only document what's specific to palo
(kernel and ramdisk specifications) though I know it has a couple of
other things in there right now.

	-P
