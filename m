Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm2.tiscalinet.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 624EB4842
	for <parisc-linux@lists.parisc-linux.org>; Sat, 22 Jun 2002 12:04:28 -0600 (MDT)
Message-ID: <3D14BC72.3010909@freebel.net>
Date: Sat, 22 Jun 2002 18:05:38 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: "M. Grabert" <xam@cs.ucc.ie>,
	parisc-linux@lists.parisc-linux.org,
	Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Subject: Re: [parisc-linux] PA8000 modutils problems
References: <200206212125.g5LLP37O028451@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi Dave,

John David Anglin wrote:
> 
>>One more question: is it a good idea to compile with gcc-3.1,
>>e.g. make CC=gcc-3.1 HOSTCC=gcc-3.1 vmlinux ?
>>Does gcc-3.1 generate better code (better optimized, fewer bugs?) or
>>should I stick to gcc-3.0 since this is the "recommended" compiler
>>(or at least the one the kernel developers use and know)
> 
Some weeks ago I also try to compile the kernel (32bits) with gcc-3.1 
(cvs) and eventhought it boots fine there was a problem
with network connections (as well telnet which uses inetd as well as ssh
which using its own sshd; this confirm the problem of compilation in 
network interface). Is this problem solved now?
If not I will ask to Bruno to test its last lkcd code (kdb not yet 
working) to continue to investigate this problem.

Joel
