Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id OAA20546
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 Jan 2001 14:27:01 -0700
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14NLg3-0003QO-00; Mon, 29 Jan 2001 21:17:31 +0000
Date: Mon, 29 Jan 2001 21:17:31 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <matthew@wil.cx>
Cc: John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Gnu cpp bug or feature?
Message-ID: <20010129211731.A11274@parcelfarce.linux.theplanet.co.uk>
References: <200101100631.XAA16714@udlkern.fc.hp.com> <20010110135013.B5884@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010110135013.B5884@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Wed, Jan 10, 2001 at 01:50:13PM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 10, 2001 at 01:50:13PM +0000, Matthew Wilcox wrote:
> On Tue, Jan 09, 2001 at 11:31:49PM -0700, John Marvin wrote:
> > 
> > I just discovered that the gnu cpp doesn't allow * and = to be concatenated.
> > What I am trying to do is the following:
> 
> GNU cpp does do some slightly strange things to avoid accidentally creating
> C tokens.  However, you should be able to work around this behaviour by using
> the ## operator.  try...

ok, this problem is now fixed.  Our Makefiles have been broken for a
_long_ time, so -traditional was not being passed to cpp.  Now that it
is, it will no longer have this behaviour.

This has some downsides; some macro definitions no longer work the way
you expect them to if you've been brough up on ansi c, like i was.
in particular, multiline #defines no longer seem to work, and token
concatenation with ## no longer works.  Fix the former with #ifndef
__ASSEMBLY__ ... #endif around the macros which don't work and fix
the latter by replacing:

#define ENTRY_SAME(_name_) sys_ ## _name_

with

#define ENTRY_SAME(_name_) sys_/**/_name_

of course, this won't work with the cpp in ANSI mode, so if this is in
a header file, you'll need to #ifdef __ASSEMBLY__ #else #endif your
way around it.  fortunately the only example which needed it so far
was syscall.S, not a header file.

as far as I can tell, everything now seems to be working; i recommend only
fixing things as we run into problems with this.  John, do you want to
change back to the ADDIB= form now, leave it as it is, or have me do it?

> >     ADDIB>      -1,%r1,1b
> >     ADDIB=      -1,%arg3,fdoneloop

-- 
Revolutions do not require corporate support.
