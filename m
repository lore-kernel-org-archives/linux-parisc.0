From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: hppa glibc 2.3.3 experimental debs - patches
	posted
Date: Fri, 24 Sep 2004 16:19:21 -0400
Message-ID: <20040924201920.GY27033@baldric.uwo.ca>
References: <20040924132313.GU27033@baldric.uwo.ca>
	<4152E882000003B7@mail-7-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4152E882000003B7@mail-7-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Increasing memory pressure before PASS 2.
> Out of Memory: Killed process 5634 (test-lws).
> Out of Memory: Killed process 5641 (test-lws).
> Terminated

You may want to tweak the allocation heuristics here so that it doesn't
kill the process.
 
> (unfortunately anoying network pb didn't allow me to do more; I will try
> on next Monday test-waitid or I you foreseen some more dedicated test I
> would better to do (as a make -k check of the lib,... ? )

make -k check for libc would be good.
I also recommend building gdb to see if had regressions.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
