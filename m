Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA04518
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 15:34:37 -0700
Sender: mang@mailserv2.iuinc.com
Message-ID: <3A11BD3A.327427EF@subcarrier.org>
Date: Tue, 14 Nov 2000 17:31:22 -0500
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
References: <m13uGYm-001Vp3C@chalet>  <3A118FCF.9C7EEEBF@subcarrier.org> <E13vmG1-0004DR-00@noam.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] tracking third-party sources (was Re: linux bame)
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:
> 
> = bame@riverrock.org wrote:
> = >
> = > = On Thu, Nov 09, 2000 at 03:53:48PM -0700, Paul Bame wrote:
> = > = >     Somebody never imported 2.4.0-test6, then I imported -test10 on the
>  mai
> = > n
> = > = >     vendor branch and now can't (easily) undo that to import test6 and
> THEN
> = > = >     test10.  This workaround sucks.
> =
> Like the comment said, there was no copy of plain -test6 in CVS (that I
> saw).  Without -test6 in CVS it's much harder to use cvs diff to figure
> out the right way to merge files when there are conflicts.
> I didn't realize this until -test10 was already there, so I *then*
> brought in -test6.  They're in the wrong order on the 1.1.1 branch, so
> the standard merge command 'cvs -jlinus:yesterday -jlinus:<newest>'
> won't work next time -- explicit names will be required.

The best thing to do is to import -test10 again and move the static tag
by re-tagging.

> = Tracking third-party sources using a normal branch, as we are
> = doing, is much simpler and gives you more control.
> 
> But I've seen no cook book for it.  I'm guessing that instead of cvs import
> you use:
>         cvs co -rlinus linux
>         <unpack new linux bits on top of linux>
>         cd linux
>         cvs commit (make note of new files from commit)
>         cvs add <new files>
>         cvs commit
>         cvs tag LINUS_NEW_REVISION
> perhaps with provision for removing obsolete files too.  I suppose that is
> simpler than a single cvs import command from a certain perspective :-)

I had a good chat with Paul about this, and we worked out that using
"import" is marginally better.

This is what the add/remove method would look like:
cvs co -rlinux linux
<unpack new linux bits>
<rm files in dir not in tarball>
cvs rm <rm'ed files>
cvs add <new files>
cvs commit
cvs tag LINUS_NEW_REVISION

Add the import method:
<unpack new linux bits>
cd linux
cvs import linux linus LINUS_NEW_REVISION
cvs admin -b <new files>

> = When you say you "I imported -test10 on the main vendor branch" I hope
> = you really mean that you used "cvs add" on the linus branch.  From your
> = other messages, your tags looked good.
> 
> I used "cvs import", and either your branch magic worked, or I finished the
> merge before anybody randomly updated from cvs.  Since import used 1.1.1,
> which is the branch you "fixed", it seems possible that 'cvs import' might
> be rendered harmless but I don't know that for sure.

Using "import" to bring in new files taints them with the vendor branch
badness.  These files should be adjusted using "cvs admin -b".  Note
that "cvs admin" works directly on files in the repository at low level
(without any revisioning of changes) and is thus to be avoided if at all
possible.  Please don't run "cvs admin" if you (the collective "you")
don't know the consequences.

	- Mike.
