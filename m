From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: Another SIGSEGV, this time in /bin/sh
Date: Mon, 13 Sep 2004 11:01:56 -0400
Message-ID: <20040913150155.GZ1854@baldric.uwo.ca>
References: <200409012008.i81K8mGw011839@hiauly1.hia.nrc.ca>
	<200409110724.i8B7O1Fc002787@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James.Bottomley@steeleye.com,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409110724.i8B7O1Fc002787@hiauly1.hia.nrc.ca>
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

What kernel is this btw?

> Program terminated with signal 11, Segmentation fault.
> Reading symbols from /usr/lib/debug/libncurses.so.5...done.
> Loaded symbols for /usr/lib/debug/libncurses.so.5
> Reading symbols from /usr/lib/debug/libdl.so.2...done.
> Loaded symbols for /usr/lib/debug/libdl.so.2
> Reading symbols from /usr/lib/debug/libc.so.6...done.
> Loaded symbols for /usr/lib/debug/libc.so.6
> Reading symbols from /lib/ld.so.1...done.
> Loaded symbols for /lib/ld.so.1

Why isn't this the debug ld.so?

> Looking at %r2, it appears that the fault has occurred in an indirect
> call from __strtoll_internal:

But it's always some place different every failure...
 
> It would appear that r3 has either been clobbered by the kernel, or there
> is a problem with the memory access by which it was loaded:

It's possible.
 
> This should have given the r3 value.  The same procedure gave the r6 value.
> (gdb) p/x *(*($r19 + 0x1000 + 0x354) + 0x98)
> $19 = 0x0

So you are saying that the code should have given that value, but
something corrupted the value before it was used?

It definately looks signal related. It feels a lot like some return path
in the kernel might be clobbering r3. Time for another witch hunt?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
