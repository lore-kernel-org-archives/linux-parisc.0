From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] gcc-3.[02] alignment problem
Date: 16 Jul 2002 11:18:24 +0100
Message-ID: <1026814704.1687.11.camel__28524.7437809177$1416621524$gmane$org@irongate.swansea.linux.org.uk>
References: <20020716050031.GA641@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@parisc-linux.org, gcc@gcc.gnu.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20020716050031.GA641@tausq.org>
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
