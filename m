From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Thu, 31 Mar 2005 20:36:22 +6700 (EST)
Message-ID: <200504010136.j311aMnO004736@hiauly1.hia.nrc.ca>
References: <16971.44399.144991.110733@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: lamont@debian.org,
 parisc-linux@lists.parisc-linux.org
To: doko@cs.tu-berlin.de (Matthias Klose)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <16971.44399.144991.110733@gargle.gargle.HOWL> from "Matthias
	Klose" at Mar 31, 2005 09:57:35 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> filed http://bugs.debian.org/301577 (although most of the discussion
> isn't in the report).

That should be http://bugs.debian.org/301557.  Daniel thought this
bug should be reassigned to expect.  On the other hand, dejagnu maybe
expecting too much of expect.

> with /bin/dash as shell and expect-tcl8.3 as expect version, the build
> and check succeeded. Test results at
> 
>   http://gcc.gnu.org/ml/gcc-testresults/2005-03/msg01933.html

FAIL: g++.old-deja/g++.warn/compare1.C  (test for warnings, line 11)
FAIL: g++.old-deja/g++.warn/compare1.C  (test for warnings, line 24)
FAIL: g++.old-deja/g++.warn/compare1.C (test for excess errors)
FAIL: gcc.c-torture/compile/20011119-2.c  -O1  (test for excess errors)

These are now fixed.

FAIL: thread/pthread7-rope.cc execution test

I don't see this in my testing.  On the other hand, the java failures
appear to be related to pthread support, so I think it likely that
we have one or more pthread bugs.  The java failures vary from one
run to another.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
