Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id AB8DF4830
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Mar 2002 06:43:41 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16mawc-0002ij-00; Sun, 17 Mar 2002 13:43:30 +0000
Date: Sun, 17 Mar 2002 13:43:30 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] EISA 100/10 add-on card causes kernel BUG
Message-ID: <20020317134330.F21765@parcelfarce.linux.theplanet.co.uk>
References: <3C92DD15.4060008@neuronet.pitt.edu> <raffo@neuronet.pitt.edu> <20020316184231.482C6482C@dsl2.external.hp.com> <20020316213938.B2179@parcelfarce.linux.theplanet.co.uk> <willy@debian.org> <20020317053838.683C7482D@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020317053838.683C7482D@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Sat, Mar 16, 2002 at 10:38:38PM -0700
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

On Sat, Mar 16, 2002 at 10:38:38PM -0700, Grant Grundler wrote:
> oh - I forgot about those for filling the IO pdir entries...
> that need to change in order to support zero copy?
> 
> We somehow need to pass the spaceID of the userspace buffer
> to dma code if we want DMA to be cache coherent.
> I don't have any good ideas for this.

My understanding is that DMA to userspace is to pages in the page cache
only.  As such, the normal mechanisms for dcache coherency should be used.
That is, DMA to a kernel view of the page and call flush_dcache_page
after touching it.  My proposed scheme for kmap/kunmap implementation
would make flush_dcache_page a no-op, since the kernel would have a view
of the page which is automatically cache coherent with userspace's view.

-- 
Revolutions do not require corporate support.
