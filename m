Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA07024
	for <parisc-linux@puffin.external.hp.com>; Tue, 9 Jan 2001 11:31:39 -0700
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp
	id <m14G3ac-001Vp3C@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Tue, 9 Jan 2001 11:33:46 -0700 (MST)
Message-Id: <m14G3ac-001Vp3C@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: parisc-linux@thepuffingroup.com
Date: Tue, 09 Jan 2001 11:33:45 -0700
Sender: bame@bame.riverrock.org
Subject: [parisc-linux] 2.4.0 Source Import
List-ID: <linux-parisc.vger.kernel.org>


I've imported 2.4.0 sources into our CVS tree, safely isolated on the
vendor branch so theoretically nobody should see any changes until they
ask for them.  WE ARE NOT FOR MERGING AT THIS TIME -- it's to allow people
to use CVS (esp. cvs diff and tkdiff) to examine and prepare for what's
changed.  We are planning to merge with whatever is reasonable, which may
not be 2.4.0, around Jan 23, so consider this import only a courtesy.

If you want to see what's changed between 2.4.0test10 and 2.4.0, use
	tkdiff -rLINUS_240_TEST10 -rLINUS_240 <filename>
(or use cvs diff if you prefer).  If you want to see what a CVS
automatic merge would do, use:
	cvs update -jLINUS_240_TEST10 -jLINUS_240
on your top-of-branch tree.  PLEASE DON'T COMMIT MERGED BITS unless
you build a consensus it won't interfere with ongoing development or the
upcoming merge.

NOTE: CVS documentation suggests using a command something like
	cvs update -jlinus:yesterday -jlinus
to merge a recent import.  That WON'T WORK in our tree.


	-Paul Bame
