Return-Path: <doko@cs.tu-berlin.de>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 09F7A4843
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 11 Jan 2004 04:42:19 -0700 (MST)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <16385.13815.94626.165424@gargle.gargle.HOWL>
Date: Sun, 11 Jan 2004 12:39:35 +0100
To: Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] running gcc testsuite triggers ongoing page faults
In-Reply-To: <20040111100853.GF533@tausq.org>
References: <16385.5227.153358.397944@gargle.gargle.HOWL>
	<20040111100853.GF533@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Randolph Chung writes:
> In reference to a message from Matthias Klose, dated Jan 11:
> > I think I did see this first with gcc-3.3 from 20031229. Running the
> > 3.3 testsuite (gcc) doesn't terminate. Instead, I see expect eating
> > all CPU time, together with syslogd and klogd. /var get's filled with
> > log messages in kern.log, syslog and debug.
> > 
> > The machine is a A500, kernel from the archives (kernel-image-2.4.21-64-smp_pa7.3)
> 
> jda sees this problem too, but we haven't been able to isolate it. if
> you can find out which test case causes this we might be able to figure
> it out.

well, the last testcase logged in build/gcc/testsuite/gcc.log is 

	gcc.c-torture/execute/931004-12.c compilation,  -O1

the next one would be

	gcc.c-torture/execute/931004-12.c compilation,  -O2

> also it appears that when running a UP kernel this doesn't happen.
> 
> randolph
> -- 
> Randolph Chung
> Debian GNU/Linux Developer, hppa/ia64 ports
> http://www.tausq.org/
