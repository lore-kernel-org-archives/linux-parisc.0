Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] EISA 100/10 add-on card causes kernel BUG 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Sun, 17 Mar 2002 13:43:30 GMT." <20020317134330.F21765@parcelfarce.linux.theplanet.co.uk>
References: <3C92DD15.4060008@neuronet.pitt.edu> <raffo@neuronet.pitt.edu> <20020316184231.482C6482C@dsl2.external.hp.com> <20020316213938.B2179@parcelfarce.linux.theplanet.co.uk> <willy@debian.org> <20020317053838.683C7482D@dsl2.external.hp.com>  <20020317134330.F21765@parcelfarce.linux.theplanet.co.uk> 
Date: Sun, 17 Mar 2002 09:59:04 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020317165905.0117A4834@dsl2.external.hp.com>
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

Matthew Wilcox wrote:
> My understanding is that DMA to userspace is to pages in the page cache
> only.

NICs use the page cache? or just for ZC?
block IO certainly uses the page cache.

> As such, the normal mechanisms for dcache coherency should be used.
> That is, DMA to a kernel view of the page and call flush_dcache_page
> after touching it.

For page cache, ok. Then ccio/sba implicitly use whatever SR the
kernel is supposed to use and we don't need to pass the parameter.
If NIC's use page cache for ZC, that would make life simple.

> My proposed scheme for kmap/kunmap implementation
> would make flush_dcache_page a no-op, since the kernel would have a view
> of the page which is automatically cache coherent with userspace's view.

I'm liking that idea alot.
I've really never been comfortable with the two views not being coherent
since it will expose more kernel bugs that other arches don't see.


thanks,
grant
