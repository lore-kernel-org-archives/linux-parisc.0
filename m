Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id D9A2A4854
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 13 Jan 2004 07:52:02 -0700 (MST)
Date: Tue, 13 Jan 2004 08:02:49 -0800
From: Randolph Chung <randolph@tausq.org>
To: Ivar Orskaug <Ivar.Olav.Harstad.Orskaug@idi.ntnu.no>
Subject: Re: [parisc-linux] kernel compilation time
Message-ID: <20040113160249.GJ533@tausq.org>
References: <Pine.BSF.4.58.0401131521300.24660@db-gr1.idi.ntnu.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.58.0401131521300.24660@db-gr1.idi.ntnu.no>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> just installed a fresh Debian on a C3000/8500. I did a kernel
> recompile and after 15 minutes binutils terminated compilation,
> complaining about too long arguments.  However, is this normal compilation
> time? I know this is not an acurate metric, but gives an idea. I
> just did an make oldconfig and then rebuilt the kernel. What is the normal
> kernel compilation time on these machines?
> The running kernel was 2.4.21.

do you have latest binutils installed? it shouldn't terminate. can you
please post your config and binutils/gcc version? ~10-15 minutes sounds
reasonable for a c3k, but depends on amount of memory, speed of disk, 
etc...

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
