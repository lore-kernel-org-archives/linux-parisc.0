Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA26422
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 Nov 1999 09:13:12 -0700
Received: from udlkern.fc.hp.com (root@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id JAA11062
	for <parisc-linux@thepuffingroup.com>; Thu, 11 Nov 1999 09:14:39 -0700 (MST)
Received: from debian.fc.hp.com (root@debian.fc.hp.com [15.1.48.119]) by udlkern.fc.hp.com with ESMTP (8.8.6 (PHNE_14041)/8.7.1) id JAA14191 for <parisc-linux@thepuffingroup.com>; Thu, 11 Nov 1999 09:14:39 -0700 (MST)
Received: from debian.fc.hp.com (bame@localhost [127.0.0.1])
	by debian.fc.hp.com (8.9.3/8.9.3/Debian/GNU) with ESMTP id JAA19293
	for <parisc-linux@thepuffingroup.com>; Thu, 11 Nov 1999 09:14:38 -0700
Message-Id: <199911111614.JAA19293@debian.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] _end symbol in parisc linux? 
In-reply-to: Your message of "Thu, 11 Nov 1999 08:51:27 MST."
             <8933.942335487@upchuck>
Date: Thu, 11 Nov 1999 09:14:38 -0700
From: Paul Bame <bame@debian.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


= Parse the som exec header.

I guess I mangled my earlier note.  I also want a language-system
independent method since we'll not always be wedded to SOM.  More
urgently, the SOM header is apparently unavailable to a program
launched from the hpux bootloader.  I just checked, and HP-UX doesn't
parse the SOM header either -- it uses _end and _edata.

Perhaps you'd be kind enough to write a scrap of assembly magic
which performs the subspace trick you mentioned earlier?  Yeah
it may be ugly and still language-system dependent, but without access
to the SOM header at boot time there's not a prettier option.

Thanks!

	-P
