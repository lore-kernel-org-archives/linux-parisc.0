Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA13043
	for <parisc-linux@puffin.external.hp.com>; Sat, 9 Dec 2000 22:20:23 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id DE024927
	for <parisc-linux@thepuffingroup.com>; Sat,  9 Dec 2000 21:23:05 -0800 (PST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id VAA11343
	for parisc-linux@thepuffingroup.com; Sat, 9 Dec 2000 21:23:49 -0800 (PST)
Date: Sat, 9 Dec 2000 21:23:49 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200012100523.VAA11343@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 32-bit xc-20001206.tar.gz is foobar
List-ID: <linux-parisc.vger.kernel.org>

Matt,
xc-latest.tar.gz points to xc-20001206.tar.gz.
Could latest be pointed to the previous version?

32-bit 1206 build dies in the link phase with:
...
hppa-linux-ld: fs/fs.o(.text.load_elf_interp+0x2b8): cannot handle R_PARISC_PCREL17F for __up
hppa-linux-ld: fs/fs.o(.text.load_elf_interp+0x2dc): cannot reach 00000010___down+0, recompile with -ffunction-sections
hppa-linux-ld: fs/fs.o(.text.load_elf_interp+0x2dc): cannot handle R_PARISC_PCREL17F for __down
hppa-linux-ld: fs/fs.o(.text.load_aout_interp+0x11c): cannot reach 00000010_flush_instruction_cache+0, recompile with -ffunction-sections
hppa-linux-ld: fs/fs.o(.text.load_aout_interp+0x11c): cannot handle R_PARISC_PCREL17F for flush_instruction_cache
...

later,
grant
