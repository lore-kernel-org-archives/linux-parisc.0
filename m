From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing tst-mmap-eofsync in glibc on parisc)
Date: Fri, 22 Aug 2003 17:42:03 +0100
Message-ID: <20030822174203.H12903__41436.3351454542$1416622705$gmane$org@flint.arm.linux.org.uk>
References: <1061563239.2090.25.camel@mulgrave> <20030822091447.6ecea6ca.davem@redhat.com> <20030822163429.GH18834@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "David S. Miller" <davem@redhat.com>,
	James Bottomley <James.Bottomley@SteelEye.com>,
	linux-kernel@vger.kernel.org, parisc-linux@lists.parisc-linux.org,
	drepper@redhat.com
To: Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030822163429.GH18834@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Fri, Aug 22, 2003 at 05:34:29PM +0100
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Aug 22, 2003 at 05:34:29PM +0100, Matthew Wilcox wrote:
> On Fri, Aug 22, 2003 at 09:14:47AM -0700, David S. Miller wrote:
> > On 22 Aug 2003 09:40:37 -0500
> > James Bottomley <James.Bottomley@SteelEye.com> wrote:
> > > The reason this doesn't happen is because the mapping is not on the
> > > mmap_shared list that flush_dcache_page() updates.
> > 
> > flush_dcache_page() checks both the shared and non-shared mmap lists,
> > so if it is on _either_ list it is flushed.  It does not check only
> > the shared list.

Eww.

> Gah, that's going to get really inefficient.  I still think we want to
> split flush_dcache_page() into two operations -- flush_dcache_user() and
> flush_dcache_kernel().  flush_dcache_user() would flush this specific
> user mapping back to ram and flush_dcache_kernel() would flush the
> kernel mapping.

Where are you proposing calling only _user() and _kernel() from ?

-- 
Russell King (rmk@arm.linux.org.uk)                The developer of ARM Linux
             http://www.arm.linux.org.uk/personal/aboutme.html
