Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA3104A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Mar 2001 23:34:53 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA07245;
	Thu, 15 Mar 2001 17:20:32 +1100
Date: Thu, 15 Mar 2001 17:20:32 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: randolph@tausq.org, bdale@gag.com, alan_c_meyer@am.exch.hp.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20010315030538.734C13878A@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0103151625490.27636-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: new debs built, c++ is broken
List-ID: <linux-parisc.vger.kernel.org>

[copying to the list, as this may help people debug similar problems]

(gdb) bt
#0  0x0000d22c in __register_frame_info (begin=0x42e68, ob=0x4f7cc)
    at /src/parisc/gcc/gcc/frame-dwarf2.c:561
#1  0x0000afe0 in frame_dummy ()
#2  0x0000a4f8 in _init ()

Disassembling the functions in question,

__register_frame_info is PIC
frame_dummy is not PIC, and trashes r19
_init is PIC

which expains the crash.  The next question is why do we have such a mess
of pic/non-pic code?  Running the compile with -Wl,-M to turn on linker
map output helps a bit, and shows that
__register_frame_info comes from /usr/lib/gcc-lib/hppa-linux/2.97/libgcc.a
frame_dummy comes from /usr/lib/gcc-lib/hppa-linux/2.97/crtbegin.o
_init is cobbled together from crti.o, crtbegin.o, crtend.o, crtn.o

So it seems the problem is really a result of our decision to make libgcc 
PIC, and a possible fix is to always link with crtbeginS.o and crtendS.o.
OK, we can do that by editing /usr/lib/gcc-lib/hppa-linux/2.97/specs and
make *startfile: end up with .... crti.o%s crtbeginS.o%s, and *endfile: be
crtendS.o%s crtn.o%s

Now I get a little further

alan@tea:/scsi/tmp$ ./c++hello 
Hello
Segmentation fault (core dumped)

So now we've likely got a problem with destructors.  To be continued...

Alan
-- 
Linuxcare.
