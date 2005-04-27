From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] gcc-3.3 vs. 3.4
Date: Wed, 27 Apr 2005 13:00:20 -0400
Message-ID: <20050427170020.GA496@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org,
 John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
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


jda,

I just ran into a case in glibc, where compiling dl-fptr.c
(libc/sysdeps/generic/) with gcc-3.3 works, but gcc-3.4 doesn't. In
particular I believe gcc-3.4 was incorrectly aggressive with a branch
delay slot optimization and causes a load before the register is setup.

I only seem to see this case under certain compile options. To test my
theory I went back and manually compiled dl-fptr.c with gcc-3.3, while
the rest of glibc was compiled with gcc-3.4 and the two failures go away.

The failures are two static tests that call dlopen, which eventually
uses dl_make_fptr to construct the required OPD's. 

NOTE: dl_make_ftpr is actually compiled *into* the executable at this
point, since it's static and all the loader code is included.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
