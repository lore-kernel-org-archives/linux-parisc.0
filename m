Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34291484B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  8 Dec 2003 11:35:24 -0700 (MST)
Date: Mon, 8 Dec 2003 11:35:22 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] test11-pa2 & serial console on C3k success,
	siimage problems
Message-ID: <20031208183522.GA28925@colo.lackof.org>
References: <Pine.LNX.4.58.0312080747340.7829@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0312080747340.7829@sal.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Dec 08, 2003 at 08:20:38AM +0000, M. Grabert wrote:
...
> SiI680: 100% native mode on irq 128
>     ide0: MMIO-DMA at 0xf4800000-0xf4800007 -- Error, MMIO ports already in use.
>     ide1: MMIO-DMA at 0xf4800008-0xf480000f -- Error, MMIO ports already in use.

Look at the code that prints this line and the error msg.
"already in use" suggests a resource conflict though I doubt that is the
problem. Sounds more like a problem of the resources not being registered
correctly. Welcome to the maze of twisty, little passages, all the same.

grant
