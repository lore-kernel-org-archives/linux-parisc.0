Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 8 Feb 2003 20:10:14 -0700
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030209031014.GD19683@dsl2.external.hp.com>
References: <20030208222242.AA3554829@dsl2.external.hp.com> <20030208222746.GB19683@dsl2.external.hp.com> <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
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

On Sat, Feb 08, 2003 at 11:23:03PM +0000, Matthew Wilcox wrote:
> Is all that's needed to take the latest binutils from debian unstable
> and rebuild it on woody?

Almost. It needs a patch too:
	ftp://ftp.parisc-linux.org/patches/900_order_hppa.diff

Just drop that in debian/patches before building the debs.
That patch applies clean to the binutils for unstable.
I don't even pretend to understand how to properly build
debian packages, much less binutils or "cross release" builds.
That's why I made the tarball for "testing".

> That's interesting from an architecture PoV.  From my recollection when jsm
> was debugging problems on the 710, PCX-S is the only processor which actually
> enforces the 16-byte alignment restriction on ldcw.  So _practically_, we
> don't need it unless we're supporting those old processors.

I don't care to find out the hard way.
I'd rather just comply with the architecture and not worry about it.
If someone can demonstrate a perf advantage or issue, I'll be
more receptive.

> Actually... this may be a long-standing bug in our spinlocks.  There's nothing
> to prevent gcc reordering writes around this assignment.  We need a barrier()
> before the assignment, or maybe it'd be as well to do the assignment in an
> asm() statement.

I've read the followups to this and I gather our spinlocks are very broken.
If someone tells me what the right fix is, I'll test on PA20 32/64 bit
and commit.

> One final point.... up till now, we've been telling people it's OK to
> run kernels configured for PA1.1 on PA2.0 processors.  This patch says
> to me that's not safe.

Only for SMP. I think for UP the rule still holds.

> Do we need our distros (yeah, I hear there'll
> soon be more than Debian supporting PA) to ship 5 flavours of kernel
> (PA1.1 UP & SMP, PA2.0 32-bit SMP, 64-bit UP and 64-bit SMP) rather than
> the current four?

Unfortunately yes.

OTOH, PA20 SMP still hasn't proven stable so maybe it's not worth
doing at the moment either.  Once PA20 SMP is stable, we could drop
the 64-bit UP kernels since most systems that *require* 64-bit are SMP.

thanks,
grant
