From: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing
	tst-mmap-eofsync in glibc on parisc)
Date: 23 Aug 2003 18:01:00 -0500
Message-ID: <1061679662.1785.514.camel__2.99361204287862$1416622717$gmane$org@mulgrave>
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
	<20030823155127.3cd7b013.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: hugh@veritas.com, willy@debian.org,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>, drepper@redhat.com
To: "David S. Miller" <davem@redhat.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030823155127.3cd7b013.davem@redhat.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, 2003-08-23 at 17:51, David S. Miller wrote:
> Ok.  Let me think about this a bit more.
> 
> The safest solution for parisc, meanwhile, would be to walk the
> non-shared mmap list checking for any instance of the VM_MAYSHARE bit
> being set.

Right, that's how I plan to fix this problem in parisc.

We also need the VM_MAYSHARE flag to propagate across remappings, which
was the general kernel fix I sent some emails back.

James
