Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA10668
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Feb 2000 19:38:13 -0700
Sender: mang@mailserv2.iuinc.com
Message-ID: <38ADF413.DD81515D@subcarrier.org>
Date: Fri, 18 Feb 2000 20:38:27 -0500
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] working kernel image w/sash for A180
List-ID: <linux-parisc.vger.kernel.org>

I just put up a new kernel image with sash at
ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/Image-20000218

It's tested on the A180.  Here are the last few lines of output (over
serial console) leading up to the shell prompt:

(end_data) 4000a000
(start_stack) 2001fff8
(brk) 40017000
do_mmap 00000000 00000000 00000028 00000007 00000012 00000000
Stand-alone shell (version 3.4)
500 5 1970 53b
> foo 1073767600, 200205e0

You can type "help" to get a list of commands.

	- Mike.
