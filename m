Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp8.xs4all.nl (smtp8.xs4all.nl [194.109.127.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id F0BB4482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 04:57:13 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp8.xs4all.nl (8.9.3/8.9.3) with ESMTP id MAA10437
	for <parisc-linux@lists.parisc-linux.org>; Mon, 3 Sep 2001 12:57:11 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Mon, 3 Sep 2001 12:52:18 +0200
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org, linux-kernel@vger.kernel.org
Message-ID: <20010903125218.A3192@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010902105538.A15344@middle.of.nowhere> <20010902150023.U5126@parcelfarce.linux.theplanet.co.uk> <20010902.160441.92583890.davem@redhat.com> <20010903002514.X5126@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010903002514.X5126@parcelfarce.linux.theplanet.co.uk>
Subject: [parisc-linux] Re: documented Oops running big-endian reiserfs on parisc architecture
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 03, 2001 at 12:25:14AM +0100, Matthew Wilcox wrote:
> On Sun, Sep 02, 2001 at 04:04:41PM -0700, David S. Miller wrote:
> >    From: Matthew Wilcox <willy@debian.org>
> >    Date: Sun, 2 Sep 2001 15:00:23 +0100
> > 
> >    On Sun, Sep 02, 2001 at 10:55:38AM +0200, thunder7@xs4all.nl wrote:
> >    > ReiserFS version 3.6.25
> >    > bonnie[163]: Unaligned data reference 28
> >    
> >    As it says, an unaligned data reference.
> >    
> > BTW, you should not be OOPSing on this as unaligned references are
> > defined as completely normal, especially in the networking.
> > 
> > Is it impossible to handle unaligned access traps properly on
> > parisc?  If so, well you have some problems...
> 
> No, we just haven't bothered to implement it yet.  Not many people
> use IPX these days.
> 
OK, well this seems to have opened quite a can of worms. Programming the
handling of unaligned access traps on parisc is quite above my
possibilities.

I did notice that mark_de_without_sd() in reiserfs_fs.h just calls the
ext2_{set|clear|test}_bit routines. If the host architecture should
handle that with unaligned addresses, obviously the exception for s390
should also go. The current source would make reiserfs slow on sparc as
well, if I understand correctly.

To solve this for parisc, I see two possibilities:

- rewrite asm/parisc/bitops.h to have the ext2_* routines handle
  unaligned addresses. This would possibly be slowing down all aligned
  access. Not so nice.

- rewrite reiserfs_fs.h to use it's own test/set/clear bit routines.
  This would lose all the optimizations all specific architectures have
  in their asm/*/bitops.h. Also not nice.

Keeping in mind that I don't know any parisc assembly, is there any way
I can help resolve this in an elegant manner?

Greetings,
Jurriaan
-- 
If all else fails, immortality can always be assured by spectacular error.
        John Kenneth Galbraith
GNU/Linux 2.4.9-ac5 SMP/ReiserFS 2x1402 bogomips load av: 0.45 0.12 0.04
