Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gremg1.net.external.hp.com (grenmg1.net.external.hp.com [155.208.254.57])
	by dsl2.external.hp.com (Postfix) with ESMTP id 058F94829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 31 Oct 2002 08:30:03 -0700 (MST)
Received: from garonne.grenoble.hp.com (garonne.grenoble.hp.com [15.128.14.138])
	by gremg1.net.external.hp.com (Postfix) with ESMTP id EB6A11D9
	for <parisc-linux@lists.parisc-linux.org>; Thu, 31 Oct 2002 16:29:59 +0100 (MET)
Message-ID: <B320F712053ED411869200D0B747A3CA053E6498@laplace.grenoble.hp.com>
From: "BUCH-PEDERSEN,LEIF (HP-France,ex1)" <leif_buch-pedersen@hp.com>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Thu, 31 Oct 2002 16:20:38 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] ip6tables problem
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

For some time I have been running a customized version of a 2.4.18 kernel
with ipv6 enabled on. Now I want to look at the use of iptables (ip6tables).


To do this have enabled ipv6 netfilter configuration options and compiled
several versions of the kernel (everything compiled into the kernel,
netfilter as modules, kernel based on 2.4.19-pa5 from parisc-linux.org). In
all cases the kernel compiles but ip6tables does not work. 

Using the kernel with modules I have been able to boil down the problem to a
problem with the module ip6table_filter. 

When I am doing 'insmod ip6table-filter' I get a message :
ip6table_filter.o: init_module: Invalid argument

And this is where I am stuck. There is no more information in syslog or
dmesg. Any ideas ?


Leif Buch-Pedersen
HP France, Grenoble

PS: ip6table_filter loads OK using a 2.4.18 kernel on a machine with a
Pentium processor.
