From: "Helge Deller" <deller@gmx.de>
Subject: Aw: hppa qemu and string functions
Date: Wed, 9 Nov 2016 15:51:16 +0100
Message-ID: <trinity-8a5a9da3-1e08-4571-bbfb-b230bd20f15b-1478703076818@3capp-gmx-bs52>
References: <21645bc2-f005-5e60-d26a-41af60e3c035@twiddle.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org,
        "GNU C Library" <libc-alpha@sourceware.org>
To: "Richard Henderson" <rth@twiddle.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <21645bc2-f005-5e60-d26a-41af60e3c035@twiddle.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Richard,

> Off and on, I've been working on a user-only target of hppa to qemu.  It's now 
> about 95% working.  If anyone would like to try it out, it's available at
>    git://github.com/rth7680/qemu.git tgt-hppa

COOL!
I'm happy to test, but can you shortly describe the required steps how I can build & test it?

With "user-only target of hppa" I assume this means that I can run hppa binaries
on e.g. x86-64, similiar to what is described here: https://wiki.debian.org/QemuUserEmulation ?

> While implementing the unit-type instructions, I wondered why no one (outside 
> hp?) had written a version of the string routines utilizing the UXOR insn, with 
> the SomeByteZero and NoByteZero conditions.

Interesting.
I assume nobody did, because there are a few hppa/linux/glibc users anyway ? :-)
 
> Attached are versions of strlen, strchr and strrchr.  They pass simple tests 
> within my emulator; I'd be interested to know if they pass full glibc testing 
> on real hardware.

If you like I can give you access to a hppa-linux box...

Helge
