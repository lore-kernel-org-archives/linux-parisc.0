Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA31679
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Dec 1999 18:26:27 -0700
Received: from udlkern.fc.hp.com (root@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id SAA16834
	for <parisc-linux@thepuffingroup.com>; Fri, 3 Dec 1999 18:28:25 -0700 (MST)
Received: from debian.fc.hp.com (root@debian.fc.hp.com [15.1.48.119]) by udlkern.fc.hp.com with ESMTP (8.8.6 (PHNE_14041)/8.7.1) id SAA02823 for <parisc-linux@thepuffingroup.com>; Fri, 3 Dec 1999 18:28:24 -0700 (MST)
Received: from debian.fc.hp.com (bame@localhost [127.0.0.1])
	by debian.fc.hp.com (8.9.3/8.9.3/Debian/GNU) with ESMTP id SAA29635
	for <parisc-linux@thepuffingroup.com>; Fri, 3 Dec 1999 18:28:24 -0700
Message-Id: <199912040128.SAA29635@debian.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] a pretty big change 
In-reply-to: Your message of "Fri, 03 Dec 1999 17:20:10 MST."
             <199912040020.RAA29273@debian.fc.hp.com>
Date: Fri, 03 Dec 1999 18:28:23 -0700
From: Paul Bame <bame@debian.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Bad failures occur (for me) with the hpux boot loader.  I have no
idea whether I introduced them, but I might have.  It looks
like the first instruction of vmlinux doesn't even get executed,
so probably something in the SOM header is telling the hpux boot loader to
do something stupid.  som_relocate may need an upgrade, but I'm
stumped about what's going wrong.

	-P
