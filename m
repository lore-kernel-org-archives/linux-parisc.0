Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA14930
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Dec 1999 14:18:34 -0700
Received: from [10.10.213.163] by max5.rrze.uni-erlangen.de with ESMTP for parisc-linux@thepuffingroup.com; Sun, 5 Dec 1999 22:20:37 +0100
Received: (from prumpf@localhost)
	by abacus (8.9.3/8.9.3) id WAA15277
	for parisc-linux@thepuffingroup.com; Sun, 5 Dec 1999 22:23:06 +0100
Date: Sun, 5 Dec 1999 22:22:05 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: parisc-linux@thepuffingroup.com
Message-Id: <19991205222205.B22241@mathe.stud.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Linker problems
List-ID: <linux-parisc.vger.kernel.org>

Okay, it looks like HP/UX ld is behaving funny for some things in the 2.3
kernel.  Most notable fs/buffer.c, buffer_init:

Assembly source piped to gas:
	addil LR'hash_table-$global$,%r27
	copy %r1,%r12
	addil LR'bh_hash_shift-$global$,%r27
	copy %r1,%r10
	addil LR'zonelists-$global$,%r27
	comib,>>= 1,%r3,L$4451

Generated object file (objdump -d --reloc fs/buffer.o):
      84:   2b 60 00 00     addil 0,dp,%r1
                        84: R_DP_RELATIVE       hash_table
      88:   08 01 02 4c     copy r1,r12
      8c:   2b 60 00 00     addil 0,dp,%r1
                        8c: R_DP_RELATIVE       bh_hash_shift
      90:   08 01 02 4a     copy r1,r10
      94:   2b 60 00 00     addil 0,dp,%r1
                        94: R_DP_RELATIVE       zonelists
      98:   8c 62 80 30     cmpib,>>= 1,r3,b8 <buffer_init+0xb8>

vmlinux (objdump -d --reloc vmlinux):
c0063884:       2b 70 30 00     addil 21800,dp,%r1
c0063888:       08 01 02 4c     copy r1,r12
c006388c:       28 0f 70 00     addil 5f800,r0,%r1
c0063890:       08 01 02 4a     copy r1,r10
c0063894:       2b 77 50 00     addil 6e800,dp,%r1
c0063898:       8c 62 80 30     cmpib,>>= 1,r3,c00638b8 <buffer_init+0xb8>


Note that 
	addil LR'bh_hash_shift-$global$,%r27
	copy %r1,%r10

ultimately becomes addil 0x5f800, _r0_, %r1, which doesn't make sense (and
causes a DPF lateron).

I haven't found anything obvious that could explain it in the linker source,
but I haven't looked too closely at it.

Sorting this out is pretty much required to get 2.3 up (otoh, we're getting to
buffer_init which is relatively far (into the parts that have changed heavily)).

Any ideas ?


	Philipp Rumpf
