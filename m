Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9FC094831
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 13:04:13 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id gaccjaaa for parisc-linux@lists.parisc-linux.org; Mon, 19 Nov 2001 12:59:08 -0700
Date: Mon, 19 Nov 2001 12:03:56 -0800
From: Randolph Chung <randolph@tausq.org>
To: Markus Grabert <xam@student.cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] State of official Linux kernel
Message-ID: <20011119120355.Q3053@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.OSF.4.41.0111191911120.11606-100000@student.cs.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.OSF.4.41.0111191911120.11606-100000@student.cs.ucc.ie>
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

> I'm just curious what the state of the PA-RISC support of the
> official linux kernel is (2.4.14 from kernel.org).

2.4.14 kernel images are now available from the Debian archive. It is
also available from parisc-linux cvs.

I'm not sure what's the status of merging into the main tree though.

> What about gcc, gdb, glibc and binutils ? How long do you think does it
> take to get the current fixes/patches into a release ?

We work with folks that are "upstream" for these tools to incorporate
parisc specific changes into the mainline sources. Other than gdb I
believe we have very little debian/parisc specific patches.

> AFAIK RedHat/Cygnus supports/maintains gcc, gdb, glibc and binutils.
> Are there (usually) any problems to get the patches/fixes (of gcc, gdb,
> ...) into a official release ? How good is the cooperation with the main
> developers of these tools/libraries ? RedHat doesn't seem to be interested
> in an Linux/PA-RISC port and debian is something like a competitor ...

Without guessing about any political issues, I'd say that upstream has
been very cooperative in general in accepting parisc-linux port changes.
I'm not sure why you think this is/will be otherwise.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
