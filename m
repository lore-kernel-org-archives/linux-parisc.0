Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA09594
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 07:52:55 -0700
Date: Thu, 25 Jan 2001 09:56:47 -0500 (EST)
From: Michael Ang <mang@subcarrier.org>
To: Matthew Wilcox <matthew@wil.cx>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0 merge mangle our tree?
In-Reply-To: <20010125130233.A25242@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.BSF.4.10.10101250940460.22395-100000@cuzea.pair.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 25 Jan 2001, Matthew Wilcox wrote:
> 
> i'm not sure why i fucked up the branching so badly.  I did:
> 
> cvs tag -b LINUS_240_FIXUP
[What did you do here?  Copy files from a tarball?]
> cvs ci
> cvs add (several times, adding new directories and new files)
> cvs ci
> cvs -n up
> cvs rm
[What kind of files were you removing?]
> cvs ci
> 
> (taken from my bash history, so i know this is exactly what i did)
>

Note my emphasis of your words: 
> the manpage says:
> 
>               To create a branch revision, one
>               typically use the -b option of the rtag or tag com­
>               mands.  **Then, either checkout or update can be used
>               to base your sources on the newly  created  branch.**
>               From  that point on, all commit changes made within
>               these working sources will be  automatically  added
>               to  a branch revision, thereby not perturbing main-
>               line development in any way. 
> 
> so what did i do wrong?

You didn't check out or update with the branch tag, so all your changes
hit the trunk.  I'm not convinced you want to use a branch for merging (I
prefer doing it on the trunk - it hurts alot but it's over fast) but I
haven't been following the discussions very closely.

> the other question is how best to fix the mess... if you check out
> LINUS_240_FIXUP do you get a non-broken kernel?  does it work?  if so,
> let's just put it all back on the HEAD.  if not, we have to try figuring
> out something else.

The thing to really avoid is losing local changes.  If you want to do the
merge on a branch, the best bet is to revert the inadvertent changes to
the trunk and start over.

	- Mike.
