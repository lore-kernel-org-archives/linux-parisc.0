Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 35CA84829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Feb 2003 17:35:22 -0700 (MST)
Message-Id: <200302090035.h190ZJYC012838@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
To: willy@debian.org (Matthew Wilcox)
Date: Sat, 8 Feb 2003 19:35:18 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@dsl2.external.hp.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Feb 8, 2003 11:23:03 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> That's interesting from an architecture PoV.  From my recollection when jsm
> was debugging problems on the 710, PCX-S is the only processor which actually
> enforces the 16-byte alignment restriction on ldcw.  So _practically_, we
> don't need it unless we're supporting those old processors.

I am pretty sure that any PA 1.x machine needs the alignment.

> > +#ifdef CONFIG_PA20
> > +/* PA2.0 is not strongly ordered. ldcw enforces ordering
> > + * and we need to make sure ordering is enforced on the unlock too.
> > + */
> > +#define spin_unlock(x) \
> > +		__asm__ __volatile__ ("stw,o  %%sp,0(%0)" : : "r" (x) : "memory" )

If you change the above to

  __asm__ __volatile__ ("stw,ma  %%sp,0(%0)" : : "r" (x) : "memory")

it should work on both PA11 and PA20.  The ordered completer is only
PA 2.

> Actually... this may be a long-standing bug in our spinlocks.  There's nothing
> to prevent gcc reordering writes around this assignment.  We need a barrier()
> before the assignment, or maybe it'd be as well to do the assignment in an
> asm() statement.
> 
> >  #define spin_unlock_wait(x)     do { barrier(); } while(((volatile spinlock_t *)(x))->lock == 0)

I think the volatile provides the barrier in my suggested version.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
