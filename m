Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8A53B482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 09:12:02 -0700 (MST)
Date: Fri, 22 Nov 2002 08:14:55 -0800
From: Randolph Chung <randolph@tausq.org>
To: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] pa-risc assembler
Message-ID: <20021122161455.GI21187@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <CB813811CBF6D3118DCC00902740BB4A0B8665D5@xsp01.brazil.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CB813811CBF6D3118DCC00902740BB4A0B8665D5@xsp01.brazil.hp.com>
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

> 	I would like to know about usage of .subspa, because I am converting
> some asm sourcecodes in hp-ux to linux.
> 	When iI will try to compile the source code with "cc --hppa-linux
> -std=iso9899:1990 -march=2.0 -mpa-risc-2-0 -D__KERNEL__ -I../../include -I.
> -c -o myfile.o myfile.s, the result is always" the same "Error: unknown
> pseudo-op: `.subspa'".
> 	Why this happens?

hppa-linux doesn't use the .subspa directive. depending on the
particular construct it will need to be translated into .text, .rodata,
.bss, etc...

HTH,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
