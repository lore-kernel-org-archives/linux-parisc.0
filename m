Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 861B44894
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Aug 2003 16:59:11 -0600 (MDT)
Date: Sat, 23 Aug 2003 15:51:27 -0700
From: "David S. Miller" <davem@redhat.com>
To: James Bottomley <James.Bottomley@SteelEye.com>
Cc: hugh@veritas.com, willy@debian.org, linux-kernel@vger.kernel.org,
	parisc-linux@lists.parisc-linux.org, drepper@redhat.com
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing
 tst-mmap-eofsync in glibc on parisc)
Message-Id: <20030823155127.3cd7b013.davem@redhat.com>
In-Reply-To: <1061677283.1992.471.camel@mulgrave>
References: <20030822110144.5f7b83c5.davem@redhat.com>
	<Pine.LNX.4.44.0308221926060.2200-100000@localhost.localdomain>
	<20030822113106.0503a665.davem@redhat.com>
	<1061578568.2053.313.camel@mulgrave>
	<20030822121955.619a14eb.davem@redhat.com>
	<1061591255.1784.636.camel@mulgrave>
	<20030822154100.06314c8e.davem@redhat.com>
	<1061600974.2090.809.camel@mulgrave>
	<20030823144330.5ddab065.davem@redhat.com>
	<1061677283.1992.471.camel@mulgrave>
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

On 23 Aug 2003 17:21:21 -0500
James Bottomley <James.Bottomley@SteelEye.com> wrote:

> On Sat, 2003-08-23 at 16:43, David S. Miller wrote:
> > On 22 Aug 2003 20:09:30 -0500
> > James Bottomley <James.Bottomley@SteelEye.com> wrote:
> > 
> > >        MAP_PRIVATE
> > >                   Create a private copy-on-write mapping.  Stores
> > >                   to the region do not affect the original  file.
> > >                   It  is  unspecified whether changes made to the
> > >                   file after the mmap call  are  visible  in  the
> > >                   mapped region.
...
> Could you elaborate some more?  I agree that the MAP_PRIVATE mapping may
> not see cpu1's write because of cache incoherencies (but that's what I
> believe is covered by the `unspecified' bit of the MAP_PRIVATE
> definition above).

Ok.  Let me think about this a bit more.

The safest solution for parisc, meanwhile, would be to walk the
non-shared mmap list checking for any instance of the VM_MAYSHARE bit
being set.
