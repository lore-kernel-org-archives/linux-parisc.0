Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1AC4D4831
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 08:26:03 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 164ksT-0001zj-00; Fri, 16 Nov 2001 15:26:01 +0000
Date: Fri, 16 Nov 2001 15:26:01 +0000
From: Matthew Wilcox <willy@debian.org>
To: "David S. Miller" <davem@redhat.com>
Cc: willy@debian.org, grundler@puffin.external.hp.com,
	linux-mm@kvack.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: parisc scatterlist doesn't want page/offset
Message-ID: <20011116152601.K25491@parcelfarce.linux.theplanet.co.uk>
References: <200111160730.AAA18774@puffin.external.hp.com> <20011116.065243.134136673.davem@redhat.com> <20011116150454.J25491@parcelfarce.linux.theplanet.co.uk> <20011116.071751.12999342.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011116.071751.12999342.davem@redhat.com>; from davem@redhat.com on Fri, Nov 16, 2001 at 07:17:51AM -0800
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

On Fri, Nov 16, 2001 at 07:17:51AM -0800, David S. Miller wrote:
>    From: Matthew Wilcox <willy@debian.org>
>    Date: Fri, 16 Nov 2001 15:04:54 +0000
> 
>    On Fri, Nov 16, 2001 at 06:52:43AM -0800, David S. Miller wrote:
>    > 
>    > No, you must have page+offset because in the future the
>    > "address" field of scatterlist is going to disappear
>    > and _ONLY_ page+offset will be used.
>    
>    but _WHY_ in 2.4?  this is ridiculous for something which is alleged to
>    be a stable kernel.
>    
> You have to add two members to a silly structure which nobody
> uses right now, that is so horrible.  What affect on stability
> does that change have?
> 
> This makes merging of Jen's Axboe's block highmem code back into
> 2.4.x painless.  That is why.

so when jens' code is merged back into 2.4 we won't have to make any
changes to the arch dependent code?

-- 
Revolutions do not require corporate support.
