From: "David S. Miller" <davem@redhat.com>
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing
 tst-mmap-eofsync in glibc on parisc)
Date: Sat, 23 Aug 2003 17:22:51 -0700
Message-ID: <20030823172251.4e656f9a.davem__33042.5192056738$1416622717$gmane$org@redhat.com>
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
	<20030823155312.63f996f6.davem@redhat.com>
	<1061680279.1785.534.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: hugh@veritas.com, willy@debian.org, linux-kernel@vger.kernel.org,
	parisc-linux@lists.parisc-linux.org, drepper@redhat.com
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <1061680279.1785.534.camel@mulgrave>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On 23 Aug 2003 18:11:16 -0500
James Bottomley <James.Bottomley@SteelEye.com> wrote:

> On Sat, 2003-08-23 at 17:53, David S. Miller wrote:
> > How often do writes happen to files while private mappings
> > to it exist? :-)  This is one of the reasons I think this
> > discussion is a bit silly.
 ...
> Not having to flush the private mappings is a huge optimisation.

You're not answering my question :(

I know that when the case _DOES_ happen, your optimization is
worthwhile, my question is not about this.  My question is about
how often does this case happen.
