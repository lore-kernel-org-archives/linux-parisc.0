From: "David S. Miller" <davem@redhat.com>
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing
 tst-mmap-eofsync in glibc on parisc)
Date: Fri, 22 Aug 2003 10:36:34 -0700
Message-ID: <20030822103634.46a15747.davem__8457.29899961061$1416622707$gmane$org@redhat.com>
References: <1061563239.2090.25.camel@mulgrave>
	<20030822091447.6ecea6ca.davem@redhat.com>
	<20030822163429.GH18834@parcelfarce.linux.theplanet.co.uk>
	<20030822093900.4468c012.davem@redhat.com>
	<20030822174103.GI18834@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: willy@debian.org, James.Bottomley@SteelEye.com,
	linux-kernel@vger.kernel.org, parisc-linux@lists.parisc-linux.org,
	drepper@redhat.com
To: Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030822174103.GI18834@parcelfarce.linux.theplanet.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, 22 Aug 2003 18:41:03 +0100
Matthew Wilcox <willy@debian.org> wrote:

> Uhm.  So what happens when the user has stored into the page and now
> the kernel wants to read from it?  There's still data in the cache for
> the user mapping that's non-coherent with the kernel mapping.

I see.  This causes the page cache read flush_dcache_page() call
not to trigger.

I was very confused by the fact that this bug was explained by
saying that "the shared mmap list that flush_dcache_page() checks".

So the idea is that VM_SHARED should be set based upon whether
we mmap() the thing writable _not_ whether the open() was done
with write permission enabled.

Yes, I agree with that.
