From: Hugh Dickins <hugh@veritas.com>
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing tst-mmap-eofsync
 in glibc on parisc)
Date: Sat, 23 Aug 2003 08:22:19 +0100 (BST)
Message-ID: <Pine.LNX.4.44.0308230820020.3590-100000__10186.1001727686$1416622712$gmane$org@localhost.localdomain>
References: <1061600974.2090.809.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: "David S. Miller" <davem@redhat.com>, <willy@debian.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>,
	<drepper@redhat.com>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <1061600974.2090.809.camel@mulgrave>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On 22 Aug 2003, James Bottomley wrote:
> 
> I suppose if we had a way of telling if any of the i_mmap list members
> were really MAP_SHARED semantics mappings, then we could alter our
> flush_dcache_page() implementation to work.

Good idea.  It's VM_MAYSHARE you need to check for.

Hugh
