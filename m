Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0FF94899
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Aug 2003 15:52:18 -0600 (MDT)
Date: Sat, 23 Aug 2003 14:44:36 -0700
From: "David S. Miller" <davem@redhat.com>
To: Hugh Dickins <hugh@veritas.com>
Cc: James.Bottomley@SteelEye.com, willy@debian.org,
	linux-kernel@vger.kernel.org, parisc-linux@lists.parisc-linux.org,
	drepper@redhat.com
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing
 tst-mmap-eofsync in glibc on parisc)
Message-Id: <20030823144436.63cf118f.davem@redhat.com>
In-Reply-To: <Pine.LNX.4.44.0308230820020.3590-100000@localhost.localdomain>
References: <1061600974.2090.809.camel@mulgrave>
	<Pine.LNX.4.44.0308230820020.3590-100000@localhost.localdomain>
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

On Sat, 23 Aug 2003 08:22:19 +0100 (BST)
Hugh Dickins <hugh@veritas.com> wrote:

> On 22 Aug 2003, James Bottomley wrote:
> > 
> > I suppose if we had a way of telling if any of the i_mmap list members
> > were really MAP_SHARED semantics mappings, then we could alter our
> > flush_dcache_page() implementation to work.
> 
> Good idea.  It's VM_MAYSHARE you need to check for.

Nope, please see my other email for why all of these ideas
simply will not work.  If the first fault-in of a MAP_PRIVATE
page is a read, it's just like a MAP_SHARED read-only page until
the first write occurs.
