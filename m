Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA03192
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Nov 2000 08:59:02 -0700
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp (ident bame using rfc1413)
	id <m13uGYm-001Vp3C@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Fri, 10 Nov 2000 08:57:48 -0700 (MST)
Message-Id: <m13uGYm-001Vp3C@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: Matthew Wilcox <matthew@wil.cx>
cc: parisc-linux@thepuffingroup.com
Subject: Re: linux bame
In-reply-to: Your message of "Fri, 10 Nov 2000 09:49:07 GMT."
             <20001110094907.A11268@parcelfarce.linux.theplanet.co.uk>
Date: Fri, 10 Nov 2000 08:57:47 -0700
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

= On Thu, Nov 09, 2000 at 03:53:48PM -0700, Paul Bame wrote:
= >     Somebody never imported 2.4.0-test6, then I imported -test10 on the mai
n
= >     vendor branch and now can't (easily) undo that to import test6 and THEN
= >     test10.  This workaround sucks.
= 
= don't use vendor branches.  didn't you talk to mang about this?

Um, I have no information to go on from your note.  All the (successful)
merges I've done before have used the cookbook CVS merge method including
a vendor branch.  Several (N-1?) of the palinux merges have been
accompanied by updating the vendor branch.  And this merge is going
well despite the ugly workaround, or so it appears to me.  Just
importing files to a vendor branch should have no effect on anything
else unless CVS has some horrible bug (RCS does not).  Before I make
what is apparently a serious mistake ("don't use vendor branches" sounds
pretty serious) please enlighten me!

	-P
