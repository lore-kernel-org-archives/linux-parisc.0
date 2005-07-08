From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Getting PIE to work (was How to reclaim .rela.dyn
	entries for symbols that become hidden?)
Date: Thu, 7 Jul 2005 23:23:18 -0400
Message-ID: <20050708032318.GC5314@systemhalted.org>
References: <20050630165918.GG5269@systemhalted.org>
	<200507071759.12521.vapier@gentoo.org> <42CDDD31.4030403@tausq.org>
	<200507072200.10597.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507072200.10597.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jul 07, 2005 at 10:00:10PM -0400, Mike Frysinger wrote:
> On Thursday 07 July 2005 09:56 pm, Randolph Chung wrote:
> > > does that mean you're looking into fixing PIE on parisc ?  we noticed in
> > > Gentoo that nscd fails to run since glibc forces it to either be built as
> > > a PIE or not at all:
> > > root@mindcircus 0 ~ # nscd
> > > nscd: error while loading shared libraries: unexpected reloc type 0x42
> > >
> > > building anything as PIE fails due to this reloc ... looks like binutils
> > > generates relocs of type R_PARISC_PLABEL14 and R_PARISC_PLABEL21 but
> > > glibc only knows how to handle R_PARISC_PLABEL32 ...
> >
> > palinux glibc cvs has patch to do this. We'll propagate this upstream.
> 
> ah, was not aware parisc kept a glibc cvs tree
> 
> thanks for the great news :)

We haven't pulled from upstream since 2005-06-08. We are trying to get a
working TLS build :)

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
