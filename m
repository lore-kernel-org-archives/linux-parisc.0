Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5209D482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 08:43:51 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 164l9i-0002NX-00; Fri, 16 Nov 2001 15:43:50 +0000
Date: Fri, 16 Nov 2001 15:43:50 +0000
From: Matthew Wilcox <willy@debian.org>
To: "David S. Miller" <davem@redhat.com>
Cc: willy@debian.org, grundler@puffin.external.hp.com,
	linux-mm@kvack.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: parisc scatterlist doesn't want page/offset
Message-ID: <20011116154350.L25491@parcelfarce.linux.theplanet.co.uk>
References: <20011116150454.J25491@parcelfarce.linux.theplanet.co.uk> <20011116.071751.12999342.davem@redhat.com> <20011116152601.K25491@parcelfarce.linux.theplanet.co.uk> <20011116.073328.129356309.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011116.073328.129356309.davem@redhat.com>; from davem@redhat.com on Fri, Nov 16, 2001 at 07:33:28AM -0800
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

On Fri, Nov 16, 2001 at 07:33:28AM -0800, David S. Miller wrote:
>    From: Matthew Wilcox <willy@debian.org>
>    Date: Fri, 16 Nov 2001 15:26:01 +0000
>    
>    so when jens' code is merged back into 2.4 we won't have to make any
>    changes to the arch dependent code?
>    
> Part of the criteria to whether we merge back Jens' code is
> if the ports, given reasonable notice (ie. take this as your notice)
> have added in the support for page+offset pairs to their pci_map_sg
> code.
> 
> I suggest you do this now, it is totally painless.  I would almost
> classify it as a mindless edit.

grant suggested adding support for it had performance implications,
so he wasn't willing to let me make that edit.  i'm not sure i entirely
understand the new scheme either.  the danger of updating code without
updating its supporting documentation.

-- 
Revolutions do not require corporate support.
