Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA06B4881
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 06:27:56 -0600 (MDT)
Date: Tue, 16 Jul 2002 08:26:05 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] gcc-3.[02] alignment problem
Message-ID: <20020716122605.GB31977@systemhalted>
References: <20020716050031.GA641@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020716050031.GA641@tausq.org>
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

> Compiling the linux kernel (2.4.19-rc1-ac5) with hppa64-linux-gcc 
> (3.0.4 or 3.2) gives:
> 
> tausq@a500:~/src/linux-2.4.19-rc1/net/ipv4$ hppa64-linux-gcc -D__KERNEL__ -I/home/tausq/src/linux-2.4.19-rc1/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=2.0 -mschedule=8000   -nostdinc -I /usr/lib/gcc-lib/hppa64-linux/3.0/include -DKBUILD_BASENAME=tcp_diag  -c -o tcp_diag.o tcp_diag.c
> {standard input}: Assembler messages:
> {standard input}:138: Error: Field not properly aligned [8] (44).
> {standard input}:138: Error: Invalid operands
> {standard input}:609: Error: Field not properly aligned [8] (44).
> {standard input}:609: Error: Invalid operands
> {standard input}:707: Error: Field not properly aligned [8] (44).
> {standard input}:707: Error: Invalid operands
> 
> preprocessed source attached.
> 
> (incidentally, we also see this while building glibc...)
> 
> randolph

Preprocessed source attached?

Remember we ran into this when building glibc at OLS.... and
we sat there scratching our heads. I'm pretty sure this was the
reason for the hppa-align.dpatch that is part of debianzed gcc?

Randolph: There is a forward email inside the dpatch that says
you were going to try get this patch upstream... ? :)
(gcc 3.0.4 ./debian/patches/hppa-align.dpatch)

c.
