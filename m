Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A396D4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Mar 2001 00:20:42 -0700 (MST)
Message-Id: <200103150711.CAA29105@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: new debs built, c++ is broken
To: alan@linuxcare.com.au (Alan Modra)
Date: Thu, 15 Mar 2001 02:11:02 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: taggart@carmen.fc.hp.com, randolph@tausq.org, bdale@gag.com,
	alan_c_meyer@am.exch.hp.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.21.0103151625490.27636-100000@front.linuxcare.com.au> from "Alan Modra" at Mar 15, 2001 05:20:32 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> [copying to the list, as this may help people debug similar problems]
> 
> (gdb) bt
> #0  0x0000d22c in __register_frame_info (begin=0x42e68, ob=0x4f7cc)
>     at /src/parisc/gcc/gcc/frame-dwarf2.c:561
> #1  0x0000afe0 in frame_dummy ()
> #2  0x0000a4f8 in _init ()
> 
> Disassembling the functions in question,
> 
> __register_frame_info is PIC
> frame_dummy is not PIC, and trashes r19
> _init is PIC
> 
> which expains the crash.  The next question is why do we have such a mess
> of pic/non-pic code?  Running the compile with -Wl,-M to turn on linker

Uh?  Non pic code has always called pic code in libgcc.  Trashing r19
in frame_dummy shouldn't be a problem.  Is the return through a stub?
I suspect _init shouldn't be pic.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
