From: "David S. Miller" <davem@redhat.com>
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing
 tst-mmap-eofsync in glibc on parisc)
Date: Fri, 22 Aug 2003 09:39:57 -0700
Message-ID: <20030822093957.0ad547cd.davem__29563.6355564513$1416622706$gmane$org@redhat.com>
References: <1061563239.2090.25.camel@mulgrave>
	<20030822091447.6ecea6ca.davem@redhat.com>
	<20030822163429.GH18834@parcelfarce.linux.theplanet.co.uk>
	<20030822174203.H12903@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: willy@debian.org, James.Bottomley@SteelEye.com,
	linux-kernel@vger.kernel.org, parisc-linux@lists.parisc-linux.org,
	drepper@redhat.com
To: Russell King <rmk@arm.linux.org.uk>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030822174203.H12903@flint.arm.linux.org.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, 22 Aug 2003 17:42:03 +0100
Russell King <rmk@arm.linux.org.uk> wrote:

> > Gah, that's going to get really inefficient.  I still think we want to
> > split flush_dcache_page() into two operations -- flush_dcache_user() and
> > flush_dcache_kernel().  flush_dcache_user() would flush this specific
> > user mapping back to ram and flush_dcache_kernel() would flush the
> > kernel mapping.
> 
> Where are you proposing calling only _user() and _kernel() from ?

The is not acceptable answer.

Purely, flush_dcache_page() is defined to execute when the
kernel stores into a page cache page, and that is it's only
valid definition.

Splitting into a "user" part makes absolutely no sense.
