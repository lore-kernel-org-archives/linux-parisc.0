From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Bug#364231: [parisc-linux] Re: Bug#364231: exception catching
	broken on HPPA
Date: Sat, 22 Apr 2006 14:35:48 -0400 (EDT)
Message-ID: <200604221835.k3MIZm7n011609__33887.7884824344$1416624064$gmane$org@hiauly1.hia.nrc.ca>
References: <17482.24905.713197.434153@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: steven.robbins@videotron.ca,
 364231@bugs.debian.org,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: doko@cs.tu-berlin.de (Matthias Klose)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <17482.24905.713197.434153@gargle.gargle.HOWL> from "Matthias
	Klose" at Apr 22, 2006 07:00:57 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Yes, we do, but
> 
> $ ls -l /usr/lib/gcc/hppa-linux-gnu/4.0.3/libstdc++.so
> lrwxr-xr-x 1 root root 23 Apr  6 02:08 /usr/lib/gcc/hppa-linux-gnu/4.0.3/libstdc++.so -> ../../../libstdc++.so.6

Oh, I was thinking there were separate libraries for each GCC version.
I've had to live with this for some time using hpux.

> we can only have one libstdc++.so.6 installed. that's currently the
> library from 4.1. So maybe we need to bump the soversion of libstdc++
> on hppa?

To me, that seems too complicated.  It's not just libstdc++.so.6 but
potentially every shared library built with 4.1 or later needs a bump.

The simplest approach is to make GCC 4.1 the default and remove 4.0
and earlier.  Then, gradually rebuild everthing with 4.1.  There have
been reports on the gcc list that this has been reasonably successful.

I imagine that some will complain about losing their favorite GCC
version.  The issues with C are less severe because of the libgcc_s
version bump.  Old versions will generate code that's incompatible
with the complex math routines in libc6 but they should otherwise
work.  I think for kernel building it's useful to keep old versions,
but not for much else.  Thus, the compromise may be to keep old
versions of C and drop all the other languages.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
