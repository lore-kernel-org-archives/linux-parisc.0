Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3AF114940
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  8 Mar 2004 23:36:32 -0700 (MST)
Date: Mon, 8 Mar 2004 22:36:29 -0800
From: Randolph Chung <randolph@tausq.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] Results of (IDE) kernel tests with modified io.c
Message-ID: <20040309063629.GM1113@tausq.org>
References: <Pine.LNX.4.58.0403040044200.14527@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0403040044200.14527@sal.ucc.ie>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> Recent discussions on p-l led to the assumption that io.c may be
> broken and tests with a modified arch/parisc/io.c would be helpful.
> Therefore I took out all references to leXX_to_cpu and cpu_to_leXX in io.c
> and built various kernels and ran them.

as you found out in your tests, io.c is correct as it was before.... I
think Grant got confused with our original pci mmio macros which had
wrong endian.... but that was a very long time ago :)

I am trying to bring up the ns87415 ide controller on my c3750.. not
much luck yet :-(

for the other controllers, you might need a pci fixup to bring the 
devices into native mode (as Alan mentioned in his email). i wonder if
it's safe to automatically set all IDE devices to native mode?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
