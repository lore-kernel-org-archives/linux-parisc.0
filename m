Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 228644829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Dec 2002 00:27:58 -0700 (MST)
Date: Wed, 11 Dec 2002 23:32:15 -0800
From: Randolph Chung <randolph@tausq.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Solved: Kernel crash when loggin in via ssh
Message-ID: <20021212073215.GA1141@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20021211063321.GB10185@systemhalted> <Pine.LNX.4.44.0212112313290.861-100000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0212112313290.861-100000@sal.ucc.ie>
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

> It IS a gcc issue.
> 
> gcc-3.0_3.0.4-13 produces a working kernel, gcc-3.2-3.2.2-0pre0 produces
> a miscompiled kernel (faulty networking, causes kernel crash).
> I made NO updates whatsoever; same kernel configuration, just using gcc-3.0
> insted of gcc-3.2. I just make a make clean; make dep; make vmlinux ...

btw, i just built this: 

$ ssh -p 1022 -2 tausq@gsyprf10.external.hp.com
tausq@a500:~$ dmesg|grep gcc
Linux version 2.4.20-pa13 (tausq@a500) (gcc version 3.2.2 20021202 (Debian prerelease)) #12 SMP Wed Dec 11 23:02:01 PST 2002

still need to try 32-bit...
randolph
