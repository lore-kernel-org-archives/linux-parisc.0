Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA01849
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 12:58:48 -0700
To: Michael Ang <mang@subcarrier.org>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: linux bame 
In-Reply-To: Your message of "Tue, 14 Nov 2000 14:17:35 EST."
             <3A118FCF.9C7EEEBF@subcarrier.org>
References: <m13uGYm-001Vp3C@chalet>  <3A118FCF.9C7EEEBF@subcarrier.org> 
Date: Tue, 14 Nov 2000 13:00:41 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13vmG1-0004DR-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= bame@riverrock.org wrote:
= > 
= > = On Thu, Nov 09, 2000 at 03:53:48PM -0700, Paul Bame wrote:
= > = >     Somebody never imported 2.4.0-test6, then I imported -test10 on the
 mai
= > n
= > = >     vendor branch and now can't (easily) undo that to import test6 and 
THEN
= > = >     test10.  This workaround sucks.
= 
= If the sources on the linus branch have been religiously tagged every
= time they're updated, then reverting to a previous would have been
= relatively painless.  I'm not sure what "this workaround" was, but I
= guess at this point test10 is merged so the point is moot.

Like the comment said, there was no copy of plain -test6 in CVS (that I
saw).  Without -test6 in CVS it's much harder to use cvs diff to figure
out the right way to merge files when there are conflicts.
I didn't realize this until -test10 was already there, so I *then*
brought in -test6.  They're in the wrong order on the 1.1.1 branch, so
the standard merge command 'cvs -jlinus:yesterday -jlinus:<newest>'
won't work next time -- explicit names will be required.

= Vendor branches are evil.  (When I say "vendor branch" I mean the
= special kind of branch created by "cvs import".)  When you check in to a
= vendor branch your changes will also be seen on the trunk, *unless* that
= file has been previously modified on the trunk.

Thanks for clarifying what "evil" means!  That is pretty ugly indeed!

= This is almost never
= what you want and adds confusion during merging (when you least want
= it).  Tracking third-party sources using a normal branch, as we are
= doing, is much simpler and gives you more control.

But I've seen no cook book for it.  I'm guessing that instead of cvs import
you use:
	cvs co -rlinus linux
	<unpack new linux bits on top of linux>
	cd linux
	cvs commit (make note of new files from commit)
	cvs add <new files>
	cvs commit
	cvs tag LINUS_NEW_REVISION
perhaps with provision for removing obsolete files too.  I suppose that is
simpler than a single cvs import command from a certain perspective :-)

= When I did the original import of Linus' sources I converted the vendor
= branch to a normal branch using cvs admin magic.  So none of the
= annoyances of vendor branches should affect us, as long as any new files
= are added on the linus branch using "cvs add", NOT "cvs import".

Have you a pointer to the magic or the knowledge to recreate it?  I
had no idea there was a special RCS marking for the evil type of branch.

= When you say you "I imported -test10 on the main vendor branch" I hope
= you really mean that you used "cvs add" on the linus branch.  From your
= other messages, your tags looked good.

I used "cvs import", and either your branch magic worked, or I finished the
merge before anybody randomly updated from cvs.  Since import used 1.1.1,
which is the branch you "fixed", it seems possible that 'cvs import' might
be rendered harmless but I don't know that for sure.

	-P
