Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id D93C74832
	for <parisc-linux@parisc-linux.org>; Sat, 20 Apr 2002 10:02:47 -0600 (MDT)
Date: Sat, 20 Apr 2002 12:02:48 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Cc: baldric-admin@baldric.uwo.ca
Message-ID: <20020420120248.D22674@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Cross Compiler HOWTO - v1.2 (GCC 3.1 updates and more)
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

Parisc, Debian-hppa,

-----------------------------------------
PARISC-Linux Cross Compiler HOWTO - v1.2 
-----------------------------------------

When you're 715/50 just can't compile fast enough...

http://www.baldric.uwo.ca/~carlos/HOWTO-Parisc/

- Updated examples.
- Updated many things.
- Printable pdf version online (as requested by some people).
- GCC section includes info on building GCC 3.1 from upstream CVS.
- Fixed tpyos.

I've tested this from start to end and it's getting really easy
to roll your own tool-chain! Thank go to all the hard-working people
who make it happen :)

I tested:

GCC 3.0.2 20010905
Binutils 2.12.90.0.4-1

To build a cross-compiler from:

GCC 3.1 20020418
Binutils 2.12.90.0.1-4 (latest in debian pool)
Glibc 2.2.5-4 (latest in debian pool)

-----

If you would like to link against something then link against:
http://www.baldric.uwo.ca/HOWTO/

Which is where the document will reside soon.

You can grab a tarball of the directory at:
http://www.baldric.uwo.ca/~carlos/HOWTO-Parisc/HOWTO-Parisc.tar.gz

-----

Many thanks to Dave, Randolph and Willy who tolerate my incessant
24/7 learning... :)

Cheers,
Carlos.
