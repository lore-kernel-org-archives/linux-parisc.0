From: James Bottomley <James.Bottomley@suse.de>
Subject: Re: xfs failure on parisc (and presumably other VI cache systems)
 caused by I/O to vmalloc/vmap areas
Date: Mon, 12 Oct 2009 23:13:03 -0500
Message-ID: <1255407183.2850.1235.camel@localhost.localdomain>
References: <1252434469.13003.3.camel@mulgrave.site>
	 <20091013014040.GA7931@lst.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	Linux Filesystem Mailing List <linux-fsdevel@vger.kernel.org>,
	linux-arch@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <20091013014040.GA7931@lst.de>
List-ID: <linux-arch.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2009-10-13 at 03:40 +0200, Christoph Hellwig wrote:
> So what's going to happen with this patch series?  Can we expect it to
> get merged one day?

Well, we need it for parisc, so we can just push it through our tree.  I
was sort of hoping for confirmation that the other arch bits worked ...
but they can't be more broken than they are today, so I suppose the risk
is low.

James
