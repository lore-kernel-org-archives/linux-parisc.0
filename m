Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9450482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Jan 2003 00:19:20 -0700 (MST)
Date: Wed, 29 Jan 2003 23:03:40 -0800
From: Randolph Chung <tausq@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Luigi Gangitano <luigi@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Issues with seteuid()?
Message-ID: <20030130070340.GI20940@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030113031109.GI1177@tausq.org> <3E35CAE7000006D8@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E35CAE7000006D8@ocpmta7.freegates.net>
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

> A. On a testing debian system (ie gcc-3.0 3.0.4-10 && libc6 2.2.5-14.3) and
> the very last kernel 2.4.20-pa23:
> 
> Compile with gcc -O 2 -Wall -D_REENTRANT foo.c -o foo
> 
> [ Create a user and a group named proxy with id 13 for both ]
> 
> First as it is ./foo would failled to fork() immediately with 'Segmentation
> fault'.

# uname -a
Linux legolas 2.4.20-pa23 #110 Mon Jan 27 23:44:18 PST 2003 parisc unknown unknown GNU/Linux

ii  gcc-3.0        3.0.4-7        The GNU C compiler.
ii  libc6          2.2.5-14.3     GNU C Library: Shared libraries and Timezone

# gcc-3.0 -O2 -Wall -D_REENTRANT seteuid.c -o seteuid
# ./seteuid
leave_suid: PID 18443 called
leave_suid: PID 18443 giving up root, becoming 'proxy'
Creating Swap Directories
[....]

no segfault... 

can you maybe run it with strace and send the last few lines of output?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
