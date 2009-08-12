From: Grant Grundler <grundler@parisc-linux.org>
Subject: hppa64 gcc ICE building linux-2.6.31-rc5
Date: Wed, 12 Aug 2009 15:34:56 -0600
Message-ID: <20090812213456.GD13142@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Carlos, Dave,
Just got this after updating gsyprf11 and trying to build
linux-2.6.31-rc5 using .config provided by dannf.

grundler <534>uname -a
Linux gsyprf11 2.6.22.19 #5 SMP Tue Aug 4 17:16:18 PDT 2009 parisc64 GNU/Linux
grundler <535>make 
...
  CC [M]  fs/xfs/xfs_iomap.o
fs/xfs/xfs_iomap.c: In function 'xfs_iomap_write_delay':
fs/xfs/xfs_iomap.c:648: error: insn does not satisfy its constraints:
(insn 331 99 103 12 fs/xfs/xfs_iomap.c:599 (set (reg:QI 60 SAR)
        (mem/c:QI (plus:DI (reg/f:DI 30 %r30)
                (const_int -273 [0xfffffffffffffeef])) [0 %sfp+191 S1 A128])) 101 {*pa.md:3318} (nil))
fs/xfs/xfs_iomap.c:648: internal compiler error: in reload_cse_simplify_operands, at postreload.c:396
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
make[2]: *** [fs/xfs/xfs_iomap.o] Error 1
make[1]: *** [fs/xfs] Error 2
make: *** [fs] Error 2

I'll not touch the source tree on gsyprf11:/usr/src/linux-2.6 until either
of you can look at it. (No hurry...just letting you know where to look).

thanks,
grant
