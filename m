Received: from chalet ([199.254.238.240])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id RAA21340
	for <parisc-linux@puffin.external.hp.com>; Sun, 12 Nov 2000 17:28:31 -0700
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp (ident bame using rfc1413)
	id <m13v7RS-001Vp3C@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@puffin.external.hp.com>; Sun, 12 Nov 2000 17:25:46 -0700 (MST)
Message-Id: <m13v7RS-001Vp3C@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] kernel merge
In-reply-to: Your message of "Fri, 10 Nov 2000 14:28:33 MST."
             <m13uLiv-001Vp3C@chalet>
Date: Sun, 12 Nov 2000 17:25:45 -0700
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>


Helge noticed SCSI fails (B160L, 712, I think it's ok on c3k)
after the -test10 merge.  We have MANY differences from Linus in the SCSI
area.  Anybody want to take a look at this?  FYI to get
the pre-merge kernel you can use LINUS_240_TEST10_PREMERGE.  Beware
that tags are sticky in CVS (use cvs update -A to fix that).

	-P
