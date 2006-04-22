From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: Re: Bug#364231: [parisc-linux] Re: Bug#364231: exception catching
	broken on HPPA
Date: Sat, 22 Apr 2006 19:00:57 +0200
Message-ID: <17482.24905.713197.434153__37152.3373447873$1416624064$gmane$org@gargle.gargle.HOWL>
References: <17481.57988.932528.963398@gargle.gargle.HOWL>
	<200604221558.k3MFwOIs010589@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: steven.robbins@videotron.ca,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
 364231@bugs.debian.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604221558.k3MFwOIs010589@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

John David Anglin writes:
> > > smr@paer:~/gmp-4.2.dfsg/tests/cxx$ g++ -Wall test-throw.cc && ./a.out
> > > /usr/bin/ld: warning: libgcc_s.so.4, needed by /usr/lib/gcc/hppa-linux-gnu/4.0.3/libstdc++.so, may conflict with libgcc_s.so.2
> 
> I'm puzzled about this.  It seems like libstdc++ for GCC 4.0.3 was
> built using GCC 4.1 or latter.  In my 4.0.3 build, I see:
> 
> dave@gsyprf11:~/gcc-4.0/objdir/hppa-linux/libstdc++-v3/src/.libs$ ldd libstdc++.so
>         libm.so.6 => /lib/libm.so.6 (0x40643000)
> 	libgcc_s.so.2 => /lib/libgcc_s.so.2 (0x4034a000)
> 	libc.so.6 => /lib/libc.so.6 (0x40a57000)
> 	/lib/ld.so.1 (0x41252000)
> 
> But:
> 
> dave@gsyprf11:~/gcc-4.0/objdir/hppa-linux/libstdc++-v3/src/.libs$ ldd /usr/lib/gcc/hppa-linux-gnu/4.0.3/libstdc++.so
>         libm.so.6 => /lib/libm.so.6 (0x40243000)
> 	libgcc_s.so.4 => /lib/libgcc_s.so.4 (0x40746000)
> 	libc.so.6 => /lib/libc.so.6 (0x40a57000)
> 	/lib/ld.so.1 (0x41252000)
> 
> You need to build 4.0.3 and associated libraries with 4.0.3.

Yes, we do, but

$ ls -l /usr/lib/gcc/hppa-linux-gnu/4.0.3/libstdc++.so
lrwxr-xr-x 1 root root 23 Apr  6 02:08 /usr/lib/gcc/hppa-linux-gnu/4.0.3/libstdc++.so -> ../../../libstdc++.so.6

we can only have one libstdc++.so.6 installed. that's currently the
library from 4.1. So maybe we need to bump the soversion of libstdc++
on hppa?

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
