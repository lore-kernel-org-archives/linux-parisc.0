From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] [RFC] Updated glibc 2.3.5-8.1
Date: Sat, 7 Jan 2006 22:03:43 -0500
Message-ID: <20060108030342.GA17559@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Randolph Chung <tausq@debian.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Updated glibc 2.3.5-8.1

Contains the following extra fixes:

- Added relocation support for:
	= DIR21L, DIR14R, PLABEL21L, PLABEL21R.

- Fixed return value restore in syscall cancellation

- Probably messed up fpu code but made it more compliant
  with the fr0 save/restore of T-bit.

- Removed implied routines for 128-bit long double, default
  should be whatever gcc uses for long double (DFmode).

Update located:
http://www.parisc-linux.org/~carlos/glibc-work/glibc-2.3.5-debs-2006-01-07/

I have this running on my local system without problems.
I'm testing the NPTL/TLS toolchain using this as my system libc.

Dave could you please test if this fixes the strtold failures?

This is probably the patch set I will send upstream.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
