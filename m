Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 070354911
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 22 Mar 2004 21:51:53 -0700 (MST)
Date: Mon, 22 Mar 2004 21:51:51 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
Message-ID: <20040323045151.GA6190@colo.lackof.org>
References: <405D95D0.9030600@tiscali.be>
	<20040321195716.GC12455@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040321195716.GC12455@colo.lackof.org>
Cc: PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Mar 21, 2004 at 12:57:16PM -0700, Grant Grundler wrote:
> > Kernel Fault: Code=26 regs=10594380 (Addr=00000000)
> 
> null ptr deref.
> 
> ...
> >  IAOQ[0]: lasi700_probe+0x18c/0x1cc
> >  IAOQ[1]: lasi700_probe+0x190/0x1cc
> >  RP(r2): lasi700_probe+0x58/0x1cc
> 
> IOAQ[0] is the offending instruction.

James Bottomley observed a problem with hppa_dma_ops
not being set properly for his U2/Uturn box.
This is likely the same problem.
See ccio driver isn't claiming the chip when it should.

grant
