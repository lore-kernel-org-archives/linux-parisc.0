Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA24149
	for <parisc-linux@puffin.external.hp.com>; Thu, 28 Sep 2000 10:23:57 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 28 Sep 2000 16:24:46 -0000
Received: from dhd by tarwebok with local (Exim 3.12 #1 (Debian))
	id 13egU5-0000GW-00
	for <parisc-linux@thepuffingroup.com>; Thu, 28 Sep 2000 12:24:33 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 28 Sep 2000 12:24:33 -0400
Message-ID: <87u2b0pjr2.fsf@ottawa.linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] (user land) Core dumping, across the universe
List-ID: <linux-parisc.vger.kernel.org>

Hi,

Well the good news is that dumping core Just Works, so we're at least
part of the way towards having Emacs running ;-)

The bad news is that the core dumps are rather funny looking.

My very simple (dereference a bad pointer) test program produces the
following dump:

avalanche:~# ls -l core
-rw-------    1 root     root     268500992 Sep 28 12:21 core
avalanche:~# objdump -x core

core:     file format elf32-hppa
core
architecture: hppa1.0, flags 0x00000000:

start address 0x00000000

Program Header:
    NOTE off    0x00000174 vaddr 0x00000000 paddr 0x00000000 align 2**0
         filesz 0x00000714 memsz 0x00000000 flags ---
    LOAD off    0x00001000 vaddr 0x00001000 paddr 0x00000000 align 2**12
         filesz 0x00000000 memsz 0x00001000 flags r-x
    LOAD off    0x00001000 vaddr 0x00002000 paddr 0x00000000 align 2**12
         filesz 0x00001000 memsz 0x00001000 flags rwx
    LOAD off    0x00002000 vaddr 0x20000000 paddr 0x00000000 align 2**12
         filesz 0x10000000 memsz 0x10000000 flags rwx
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^

Wow, look at the size of that stack segment!  We *really* need to have
this be dynamically growable instead of just mapping a whole gigabyte
in the middle of process space.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
