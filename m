Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA00999
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Nov 2000 18:13:35 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 28 Nov 2000 01:12:19 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA06856;
	Tue, 28 Nov 2000 12:12:03 +1100
Date: Tue, 28 Nov 2000 12:12:03 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] gcc crashes/out of memory and groff
In-Reply-To: <E140T6e-0003Rc-00@the-village.bc.nu>
Message-ID: <Pine.LNX.4.21.0011281105200.3003-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 27 Nov 2000, Alan Cox wrote:

> With groff -fno-gcse does not help but -O0 does. Without -O0 you get an
> internal error.

Cross compiling from an x86-linux box with enough memory+swap (256M + 2G),
env.cc eventually compiled for me using the default -O2 optimisation
level.  I had a crash later when compiling preproc/tbl/table.cc, so that's
nothing to boast about.

table.cc: In member function `void table::build_span_list ()':
table.cc:2009: Internal error: Segmentation fault.

Worse, when I added "-Q -da" to see what was happening, the compile
succeeded - and also succeeded with either of -Q or -da alone.  So I
ran cc1plus under gdb, and that too failed to crash.  :-(
Maybe a garbage collection or uninitialised var bug?

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
