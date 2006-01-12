From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-hppa64 compilers
Date: Thu, 12 Jan 2006 11:14:08 -0500 (EST)
Message-ID: <200601121614.k0CGE8oE015506__1804.22893395207$1416623990$gmane$org@hiauly1.hia.nrc.ca>
References: <17341.56304.198509.175260@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: doko@cs.tu-berlin.de (Matthias Klose)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <17341.56304.198509.175260@gargle.gargle.HOWL> from "Matthias
	Klose" at Jan 6, 2006 03:54:40 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Which gcc-X.Y-hppa64 variants are still needed for Debian sid/etch?
> Currently compilers are built for 3.3, 3.4, 4.0 and 4.1, the latter
> one for experimental. Is it time to drop some of these?

In the past couple of weeks, a couple of issues have appeared
regarding hppa compilers.

1) The current installed version of /lib/libgcc_s.so.2 in unstable
   is not compatible with the version of libgcc_s.so.2 built in 4.1
   and head.  I don't know much about this incompatibility other
   than using the new version is required with ada to avoid numerous
   testsuite fails.  It's likely that the problem affects other
   languages.

2) In recent debugging of an application that uses complex values,
   I noticed that complex values are not being passed in the correct
   registers on both the 32 and 64-bit ports.  I have a patch which
   I'm thinking of applying to 4.1 and trunk.  

These issues apply to hppa64 but aren't critical since there is no
linux runtime.  Fixing problem requires rebuilding all packages that
use complex or vector values.

I'm thinking we need another version bump for libgcc_s.so.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
