From: Ivar <orskaug@stud.ntnu.no>
Subject: Re: [parisc-linux] Firefox/Mozilla patches
Date: Mon, 20 Dec 2004 00:27:29 +0100 (MET)
Message-ID: <Pine.GSO.4.58.0412192355390.5415@panter.stud.ntnu.no>
References: <Pine.GSO.4.58.0412172254550.1196@panter.stud.ntnu.no>
	<20041219203417.GE25304@baldric.uwo.ca>
	<Pine.GSO.4.58.0412192218090.4208@panter.stud.ntnu.no>
	<20041219225246.GG25304@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041219225246.GG25304@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



On Sun, 19 Dec 2004, Carlos O'Donell wrote:

> > However, a biggerproblem with Xorg (as I see it) is that it's not
> > natively ported to parisc.
>
> I haven't built the Xorg tree yet, still using XFree86 until I have some
> free time. What loader is the Xorg tree using? I assume it still has the
> builtin ELF loader with symbol hacks? In which case you need to do
> relocation handling, and we never ported this :)
>

I had no problems building/running Xorg - for me the build just worked
right away ?

Here, I'm talking about the driver/hardware pieces of Xorg - which
contain lots of platform specific code. As we know, Xorg/XFree drivers
(except fbdev) interact directly with the graphics hardware, which makes
for instance endianness, an issue. Each supported platform has its
own set of io-access funtions declared/defined - however no such funtions
are defined for the hppa architecture.

A first step in the process of porting the native Xorg/XFree drivers to
parisc is therefore to add raw io access methods. mmap() from userspace
works, but I got a bit uncertain when I saw that memory-mapped io is disabled in
the kernel.

How's the memory-mapped io development going?

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
