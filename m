Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7ECA94841
	for <parisc-linux@parisc-linux.org>; Sun, 12 Oct 2003 22:14:50 -0600 (MDT)
Date: Sun, 12 Oct 2003 22:14:48 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] flush_tlb_all_local:
Message-ID: <20031013041448.GD2467@colo.lackof.org>
References: <3F897C56.800@tiscali.be> <20031013031258.GC2467@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031013031258.GC2467@colo.lackof.org>
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

On Sun, Oct 12, 2003 at 09:12:58PM -0600, Grant Grundler wrote:
> On Sun, Oct 12, 2003 at 04:07:50PM +0000, Joel Soete wrote:
> > Why twice 'mtctl   %r0, %cr17'?
> 
> Good question. No clue. Looks like a brain fart since clearing it
>  once should work unless there's a weird bug. I'll remove it.

definitely not a brainfart. Read PA2.0 arch book (section 2) where
it talks about cr17/cr18. CR17 is two registers and writing it twice
clear both head/tail of the IIAS. Just like cr18 is also written twice.

sorry for not catching that the first time around.
grant
