Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA01352
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 12:21:00 -0700
Sender: mang@mailserv2.iuinc.com
Message-ID: <3A118FCF.9C7EEEBF@subcarrier.org>
Date: Tue, 14 Nov 2000 14:17:35 -0500
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: bame@riverrock.org
CC: parisc-linux@thepuffingroup.com
Subject: Re: linux bame
References: <m13uGYm-001Vp3C@chalet>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

bame@riverrock.org wrote:
> 
> = On Thu, Nov 09, 2000 at 03:53:48PM -0700, Paul Bame wrote:
> = >     Somebody never imported 2.4.0-test6, then I imported -test10 on the mai
> n
> = >     vendor branch and now can't (easily) undo that to import test6 and THEN
> = >     test10.  This workaround sucks.

If the sources on the linus branch have been religiously tagged every
time they're updated, then reverting to a previous would have been
relatively painless.  I'm not sure what "this workaround" was, but I
guess at this point test10 is merged so the point is moot.

> = don't use vendor branches.  didn't you talk to mang about this?
> 
> Um, I have no information to go on from your note.  All the (successful)
> merges I've done before have used the cookbook CVS merge method including
> a vendor branch.  Several (N-1?) of the palinux merges have been
> accompanied by updating the vendor branch.  And this merge is going
> well despite the ugly workaround, or so it appears to me.  Just
> importing files to a vendor branch should have no effect on anything
> else unless CVS has some horrible bug (RCS does not).  Before I make
> what is apparently a serious mistake ("don't use vendor branches" sounds
> pretty serious) please enlighten me!

Vendor branches are evil.  (When I say "vendor branch" I mean the
special kind of branch created by "cvs import".)  When you check in to a
vendor branch your changes will also be seen on the trunk, *unless* that
file has been previously modified on the trunk.  This is almost never
what you want and adds confusion during merging (when you least want
it).  Tracking third-party sources using a normal branch, as we are
doing, is much simpler and gives you more control.

When I did the original import of Linus' sources I converted the vendor
branch to a normal branch using cvs admin magic.  So none of the
annoyances of vendor branches should affect us, as long as any new files
are added on the linus branch using "cvs add", NOT "cvs import".

When you say you "I imported -test10 on the main vendor branch" I hope
you really mean that you used "cvs add" on the linus branch.  From your
other messages, your tags looked good.

	- Mike.
