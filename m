Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D85274829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 28 Sep 2002 16:33:02 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g8SMWx00022395
	for <parisc-linux@lists.parisc-linux.org>; Sat, 28 Sep 2002 18:33:00 -0400 (EDT)
Message-Id: <200209282232.g8SMWwCB022391@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] FWD: Bug#162690: [parisc]gcc 3.x produces openssl test code that SEGVs with -march=2.0  and optimization >0
To: randolph@tausq.org
Date: Sat, 28 Sep 2002 18:32:57 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020928175951.GB6868@tausq.org> from "Randolph Chung" at Sep 28, 2002 10:59:51 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> Package: gcc
> 
> Running Debian unstable on PA-RISC platform  (C160 Workstation with 160MHz
> PA-8000 CPU)
> 
> Compiling openssl 0.9.6g with any level of optimization for PA1.1 produces
> code that passes all tests ("make test") and benchmarks ("openssl speed")
> successfully.  Using -march=2.0 flag produces code that only runs
> successfully at optimization level "-O0"  Any higher optimization fails some
> of the test suite (reliably in test/exptest.c for instance).

There is a known issue with the assembler and linker with PA-RISC 2.0 code.
The relocations generated for floating-point loads and stores are wrong
in some cases.  Until this problem is fixed, I don't recommend using
-march=2.0.  This is part of the reason the default architecture is
still PA-RISC 1.1.  I don't think you can build gcc with -march=2.0
either.  There isn't a huge benefit in PA-RISC 2.0 in 32-bit mode.

I believe that this is not a problem with the 64-bit assembler and
linker.  However, there isn't a 64-bit userspace yet :(

If you think that you can contribute to resolving these issues, then
I encourage you to investigate further and determine what causes
the seg faults.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
