Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rth.ninka.net (rth.ninka.net [216.101.162.244])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4985048E1
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Aug 2003 12:01:46 -0600 (MDT)
Date: Fri, 22 Aug 2003 11:01:44 -0700
From: "David S. Miller" <davem@redhat.com>
To: "David S. Miller" <davem@redhat.com>
Cc: willy@debian.org, James.Bottomley@SteelEye.com,
	linux-kernel@vger.kernel.org, parisc-linux@lists.parisc-linux.org,
	drepper@redhat.com
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing
 tst-mmap-eofsync in glibc on parisc)
Message-Id: <20030822110144.5f7b83c5.davem@redhat.com>
In-Reply-To: <20030822103634.46a15747.davem@redhat.com>
References: <1061563239.2090.25.camel@mulgrave>
	<20030822091447.6ecea6ca.davem@redhat.com>
	<20030822163429.GH18834@parcelfarce.linux.theplanet.co.uk>
	<20030822093900.4468c012.davem@redhat.com>
	<20030822174103.GI18834@parcelfarce.linux.theplanet.co.uk>
	<20030822103634.46a15747.davem@redhat.com>
Mime-Version: 1.0
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

On Fri, 22 Aug 2003 10:36:34 -0700
"David S. Miller" <davem@redhat.com> wrote:

> On Fri, 22 Aug 2003 18:41:03 +0100
> Matthew Wilcox <willy@debian.org> wrote:
> 
> > Uhm.  So what happens when the user has stored into the page and now
> > the kernel wants to read from it?  There's still data in the cache for
> > the user mapping that's non-coherent with the kernel mapping.
> 
> I see.  This causes the page cache read flush_dcache_page() call
> not to trigger.

Wait, I'm confused again.

How can the user "write" to the mmap()'d side if PROT_WRITE
was not specified?  That is the only case in which the proposed
patch could make a difference, we check this:

	switch (flags & MAP_TYPE) {
		case MAP_SHARED:
			if ((prot&PROT_WRITE) && !(file->f_mode&FMODE_WRITE))
				return -EACCES;

Therefore if the user can write to the page, file->f_mode will
have the write bit set too.

So the proposed patch looks bogus to me.
