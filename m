Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 276AA4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Jan 2003 13:07:28 -0700 (MST)
Date: Tue, 14 Jan 2003 12:02:32 -0800
From: Randolph Chung <randolph@tausq.org>
To: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
Cc: "Parisc-Linux List (E-mail)" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 64 bit compiler error
Message-ID: <20030114200232.GK12986@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <9A0482A7BD2506488AD9417C93F3714F0114AC06@xsp01.brazil.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9A0482A7BD2506488AD9417C93F3714F0114AC06@xsp01.brazil.hp.com>
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

> the problem is I'm receiving this error message when I try to compile my
> code: 
> 	hppa64-linux/bin/ld: cannot open crt1.o: No such file or directory
> 
> When I try to to place this file in the current directory, I receive the
> error message:
> 	crt1.o: file not recognized: File format not recognized
> 	collect2: ld returned 1 exit status

as willy already pointed out, there is no 64-bit userspace on palinux
yet. the 64-bit compilers are only meant for compiling kernels.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
