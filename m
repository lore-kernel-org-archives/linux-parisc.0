Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6894D4875
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Sep 2002 12:07:45 -0600 (MDT)
Date: Wed, 4 Sep 2002 11:11:56 -0700
From: Randolph Chung <randolph@tausq.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Stefan Pfetzing <dreamind@dreamind.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] XFS - blkgetsize64
Message-ID: <20020904181156.GJ17893@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020904143013.GC4386@dreamind.de> <20020904165147.A33FC4829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020904165147.A33FC4829@dsl2.external.hp.com>
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

> I don't think it's the driver.

no, not the driver...

> lseek64 must be getting redirected to lseek().
> Linux kernel only supports "lseek".

lseek64 is translated to a sys_llseek (you can see that with strace). 

> See "struct file_operations" in include/linux/fs.h.
> loff_t is a 64-bit type.
> include/linux/types.h:typedef __kernel_loff_t           loff_t;
> include/asm/posix_types.h:typedef long long             __kernel_loff_t;

we need to do some tricks to get this right ... some of the other
syscalls are fixed, but this one is not it seems.

> I want to know if arch/parisc/kernel/sys_parisc32.c might be the problem.

fwiw sys_llseek is not translated.

randolph
