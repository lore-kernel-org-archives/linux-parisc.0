Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-5-cust12.swa.cable.ntl.com [80.5.121.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id D90A04889
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 03:08:12 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.2/8.11.6) with ESMTP id g6GAIQu6001878;
	Tue, 16 Jul 2002 11:18:27 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.2/8.12.2/Submit) id g6GAIPxq001876;
	Tue, 16 Jul 2002 11:18:25 +0100
Subject: Re: [parisc-linux] gcc-3.[02] alignment problem
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org, gcc@gcc.gnu.org
In-Reply-To: <20020716050031.GA641@tausq.org>
References: <20020716050031.GA641@tausq.org>
Content-Type: text/plain
Date: 16 Jul 2002 11:18:24 +0100
Message-Id: <1026814704.1687.11.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
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

On Tue, 2002-07-16 at 06:00, Randolph Chung wrote:
> Compiling the linux kernel (2.4.19-rc1-ac5) with hppa64-linux-gcc 
> (3.0.4 or 3.2) gives:
> 
> tausq@a500:~/src/linux-2.4.19-rc1/net/ipv4$ hppa64-linux-gcc -D__KERNEL__ -I/home/tausq/src/linux-2.4.19-rc1/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=2.0 -mschedule=8000   -nostdinc -I /usr/lib/gcc-lib/hppa64-linux/3.0/include -DKBUILD_BASENAME=tcp_diag  -c -o tcp_diag.o tcp_diag.c
> {standard input}: Assembler messages:
> {standard input}:138: Error: Field not properly aligned [8] (44).
> {standard input}:138: Error: Invalid operands

The pa-risc tree has a disgusting hack to work around this. Its one of
the bits I have down in the "vomit grade" pile of bits to look into
during the rest of the merge.
