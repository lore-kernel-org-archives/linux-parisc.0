Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from orion.netbank.com.br (orion.netbank.com.br [200.203.199.90])
	by dsl2.external.hp.com (Postfix) with ESMTP id 89B27482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jul 2003 22:24:13 -0600 (MDT)
Received: from [200.181.169.17] (helo=brinquendo.conectiva.com.br)
	by orion.netbank.com.br with asmtp (Exim 3.33 #1)
	id 19dMqj-0003Pl-00
	for parisc-linux@lists.parisc-linux.org; Fri, 18 Jul 2003 01:28:05 -0300
Date: Fri, 18 Jul 2003 01:26:06 -0300
From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030718042606.GA1582@conectiva.com.br>
References: <20030718041440.GZ1582@conectiva.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030718041440.GZ1582@conectiva.com.br>
Subject: [parisc-linux] Re: arch/parisc/kernel/perf_asm.o not building
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

Em Fri, Jul 18, 2003 at 01:14:40AM -0300, Arnaldo C. Melo escreveu:
> My first post 8)

And probably adding more noise to the list :( The problem "magically"
disappeared when I stopped using:

make ARCH=parisc CROSS_COMPILE=hppa-linux-

And started using:

make ARCH=parisc CROSS_COMPILE=hppa64-linux-

:-)

- Arnewbie
