Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 132E3484B
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 10:56:06 -0600 (MDT)
Message-Id: <200207161656.g6GGu0I3023366@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.[02] alignment problem
To: randolph@tausq.org
Date: Tue, 16 Jul 2002 12:55:59 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org, gcc@gcc.gnu.org
In-Reply-To: <20020716050031.GA641@tausq.org> from "Randolph Chung" at Jul 15, 2002 10:00:31 pm
MIME-Version: 1.0
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

These messages are coming from the assembler (remove "-pipe").  The
first is from "std %r4,44(%r3)".  The offset "44" is not correct for
a store double.  This is probably a problem with pointer arithmetic
in the source.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
