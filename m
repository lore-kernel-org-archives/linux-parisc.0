Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mcp.csh.rit.edu (mcp.csh.rit.edu [129.21.60.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 852D0482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 19:38:47 -0600 (MDT)
Date: Mon, 3 Sep 2001 21:38:36 -0400
From: Jeff Mahoney <jeffm@suse.com>
To: Richard Zidlicky <Richard.Zidlicky@stud.informatik.uni-erlangen.de>
Cc: thunder7@xs4all.nl, parisc-linux@lists.parisc-linux.org,
	linux-kernel@vger.kernel.org
Message-ID: <20010903213835.A13887@fury.csh.rit.edu>
References: <20010902105538.A15344@middle.of.nowhere> <20010902150023.U5126@parcelfarce.linux.theplanet.co.uk> <20010902195717.A21209@middle.of.nowhere> <20010903003437.A385@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010903003437.A385@linux-m68k.org>; from Richard.Zidlicky@stud.informatik.uni-erlangen.de on Mon, Sep 03, 2001 at 12:34:37AM +0200
Subject: [parisc-linux] Re: [SOLVED + PATCH]: documented Oops running big-endian reiserfs on parisc architecture
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 03, 2001 at 12:34:37AM +0200, Richard Zidlicky wrote:
> On Sun, Sep 02, 2001 at 07:57:17PM +0200, thunder7@xs4all.nl wrote:
> > 
> > --- linux/include/linux/reiserfs_fs.h   Sun Sep  2 21:54:25 2001
> > +++ linux-new/include/linux/reiserfs_fs.h       Sun Sep  2 20:47:27 2001
> > @@ -924,7 +924,7 @@
> >  #define DEH_Visible 2
> > 
> >  /* 64 bit systems (and the S/390) need to be aligned explicitly -jdm */
> > -#if BITS_PER_LONG == 64 || defined(__s390__)
> > +#if BITS_PER_LONG == 64 || defined(__s390__) || defined(__hppa__)
> >  #   define ADDR_UNALIGNED_BITS  (3)
> >  #endif
> 
> couldn't reiserfs use asm/unaligned.h like anyone else?
> Seems at least sparc and mips may need the same treatment.

    I'll be the first to admit that having the #if followed by arch defines
    really sucks, and that asm/unaligned.h would be much cleaner if for no
    other reason than avoiding an unnecessary gotcha for someone porting a new
    arch.

    Unfortunately, this doesn't appear to work in all cases. I know from
    testing that the S/390 case will fail using the {get,put)_unaligned macros,
    since they are identical to a normal, unassisted assignment.

    I did kick around the idea of making those macros the default accessors for
    the deh_state member (which is the only place they're used), but it unfairly
    penalizes arches that don't need them.

    I'm open to suggestions.

    -Jeff

-- 
Jeff Mahoney           |   "Bill Gates is a monocle and a Persian cat away
jeffm@suse.com         |    from being the villain in a James Bond movie."
jeffm@csh.rit.edu      |                   -- Dennis Miller
