Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "BUCH-PEDERSEN,LEIF (HP-France,ex1)" <leif_buch-pedersen@hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] ip6tables problem 
In-Reply-To: Message from "BUCH-PEDERSEN,LEIF (HP-France,ex1)" <leif_buch-pedersen@hp.com>
   of "Thu, 31 Oct 2002 16:20:38 +0100." <B320F712053ED411869200D0B747A3CA053E6498@laplace.grenoble.hp.com>
References: <B320F712053ED411869200D0B747A3CA053E6498@laplace.grenoble.hp.com> 
Date: Thu, 31 Oct 2002 12:36:23 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021031193623.6B06E4829@dsl2.external.hp.com>
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

"BUCH-PEDERSEN,LEIF (HP-France,ex1)" wrote:
> To do this have enabled ipv6 netfilter configuration options and compiled
> several versions of the kernel (everything compiled into the kernel,
> netfilter as modules, kernel based on 2.4.19-pa5 from parisc-linux.org). In
> all cases the kernel compiles but ip6tables does not work. 

Not many people use IPV6 (ie run it on their machines).
I'm not aware of anyone trying it for parisc-linux.

> When I am doing 'insmod ip6table-filter' I get a message :
> ip6table_filter.o: init_module: Invalid argument
> 
> And this is where I am stuck. There is no more information in syslog or
> dmesg. Any ideas ?

Add printk() calls in the offending module.

	rmmod ip6table-filter
	vi net/ipv6/netfilter/ip6table_filter.c
	make modules
	make modules_install
	modprobe ip6table-filter 

until you can narrow down what's failing in init() routine.
See module_init(init) line at the bottom of ip6table_filter.c.

> PS: ip6table_filter loads OK using a 2.4.18 kernel on a machine with a
> Pentium processor.

suggests parisc is missing some arch specific IPV6 support.

grant
