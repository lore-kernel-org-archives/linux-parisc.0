Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA09987
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 08:02:25 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 25 Jan 2001 15:06:19 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14Lnya-0000ss-00; Thu, 25 Jan 2001 15:06:16 +0000
Date: Thu, 25 Jan 2001 15:06:16 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Michael Ang <mang@subcarrier.org>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0 merge mangle our tree?
Message-ID: <20010125150616.D25242@parcelfarce.linux.theplanet.co.uk>
References: <20010125130233.A25242@parcelfarce.linux.theplanet.co.uk> <Pine.BSF.4.10.10101250940460.22395-100000@cuzea.pair.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.10.10101250940460.22395-100000@cuzea.pair.com>; from mang@subcarrier.org on Thu, Jan 25, 2001 at 09:56:47AM -0500
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jan 25, 2001 at 09:56:47AM -0500, Michael Ang wrote:
> On Thu, 25 Jan 2001, Matthew Wilcox wrote:
> > 
> > i'm not sure why i fucked up the branching so badly.  I did:
> > 
> > cvs tag -b LINUS_240_FIXUP
> [What did you do here?  Copy files from a tarball?]

umm.. i did this after i'd merged the 2.4.0 files into my tree.  i didn't
think about doing it on a branch until then.  Should have thought about
it in advance, I guess?

> > cvs ci
> > cvs add (several times, adding new directories and new files)
> > cvs ci
> > cvs -n up
> > cvs rm
> [What kind of files were you removing?]

the ones which `cvs -n up' told me it would have added -- ie the ones
which were deleted by patch.

> You didn't check out or update with the branch tag, so all your changes
> hit the trunk.  I'm not convinced you want to use a branch for merging (I
> prefer doing it on the trunk - it hurts alot but it's over fast) but I
> haven't been following the discussions very closely.

Ugh.  Blah.  The reason I attempted to do it on a branch is that I could
only test it compiled not that it booted (for reasons too complex to
go into here, involving not being able to locate a 110V to 8V AC in
ottawa yet).  Perhaps I should have just not bothered.

> The thing to really avoid is losing local changes.  If you want to do the
> merge on a branch, the best bet is to revert the inadvertent changes to
> the trunk and start over.

Well, I have a directory here which contains what I want to appear in
CVS on the branch.  I'm not getting rid of it!  Would you mind reverting
this mess I've created to before the checkins I did yesterday, and I'll
try again?

-- 
Revolutions do not require corporate support.
