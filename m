Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id TAA08894
	for <parisc-linux@sod.res.cmu.edu>; Sat, 17 Apr 1999 19:25:17 -0400
Date: Sat, 17 Apr 1999 23:27:22 +0000 (   )
From: Christopher Beard <cjbeard@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.9904172300080.27578-100000@sprite.osfi-bsif.gc.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Building the Bootstrap Code
List-ID: <linux-parisc.vger.kernel.org>


There was confusion earlier, so, here's a quick and dirty method for
building the bootstrap code that Jason Eckardt distributed and which is
currently in CVS under ``linux/arch/parisc/boot''

You will need to build the ``ipl'' binary using gcc 2.8.1, binutils 2.9.1
and HP's linker under HP/UX as the cross-compiling tool chain is currently
broken.

  i_addr  = 4096   # constant
  i_size  = 45056  # size of the stripped ipl binary
  i_entry = 4096   # < i_size
  k_addr  = 49152  # i_size + 4096
  k_size  = 28672  # size of the dummy_kernel
  k_entry = 4096   # < k_size

  strip ipl
  ../boot_tools/mkipl ipl
  ../boot_tools/mklifhdr hdr $i_addr $i_size $i_entry $k_addr $k_size $k_entry
  cat hdr pad_file ipl vmlinux > bootstrap.bin

This will produce a viable LIF volume that you can write to media or bootp
from. Again, this is pretty nasty, and is very temporarily until we teach
it how to read file systems.

- Chris
