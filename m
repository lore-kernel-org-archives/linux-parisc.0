Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Building cvs 2.4.18 
In-Reply-To: Message from Jeremy Drake <jeremyd@apptechsys.com>
   of "Mon, 25 Mar 2002 14:06:47 PST." <Pine.LNX.4.33L2.0203251403190.13376-100000@eiger.apptechsys.com>
References: <Pine.LNX.4.33L2.0203251403190.13376-100000@eiger.apptechsys.com> 
Date: Mon, 25 Mar 2002 23:32:17 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020326063217.50AB1482C@dsl2.external.hp.com>
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

Jeremy Drake wrote:
> config and went on.  Everything build successfully, but the depmod died.
> Here's the output
> 
> depmod: *** Unresolved symbols in
> /usr/src/linux/debian/tmp-image/lib/modules/2.4.18-pa8/kernel/net/ipv4/netfil
>   ter/ip_tables.o
> depmod:         smp_num_cpus
> depmod:         __cpu_number_map

hmm...this must have recently broke since I've built plenty
of SMP kernels with iptables enabled. I've stopped building SMP
for 2.4.18 since SMP is b0rken at the moment. But i don't think
we changed anything related to this since I've stopped...can you
run "make clean;make dep; make vmlinux;make modules" again?

> depmod: *** Unresolved symbols in
> /usr/src/linux/debian/tmp-image/lib/modules/2.4.18-pa8/kernel/net/ipv4/netfil
>   ter/ipchains.o
> depmod:         smp_num_cpus
> depmod:         __cpu_number_map

If you can, ditch ipchains. If you need examples on how to
use iptables look at ftp.p-l.o:patches/a500/firewall.

grant
