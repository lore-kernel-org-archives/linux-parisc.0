Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id EF33548A1
	for <parisc-linux@parisc-linux.org>;
	Fri, 16 Jan 2004 09:50:58 -0700 (MST)
Date: Fri, 16 Jan 2004 17:50:51 +0100
Message-ID: <4004805D000027C1@ocpmta3.freegates.net>
In-Reply-To: <20040115001829.GF9525@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] init and exit text problem
To: "Matthew Wilcox" <willy@debian.org>,
	parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

>
>Our vmlinux.lds.S doesn't discard init and exit text segments.  Anyone
>want to look into fixing this?
>
is it what you look for:

=========><=========
--- linux-2.6.1-pa3.orig/arch/parisc/kernel/vmlinux.lds.S	2003-09-22 09:06:55.000000000
+0200
+++ linux-2.6.1-pa3/arch/parisc/kernel/vmlinux.lds.S	2004-01-16 18:25:15.175817000
+0100
@@ -102,6 +102,17 @@
 
   _end = . ;
 
+  /* When something in the kernel is NOT compiled as a module, the
+   * module cleanup code and data are put into these segments.  Both
+   * can then be thrown away, as cleanup code is never called unless
+   * it's a module.
+   */
+  /DISCARD/ : {
+	*(.exit.text)
+	*(.exit.data)
+	*(.exitcall.exit)
+	}
+
   /* Stabs debugging sections.  */
   .stab 0 : { *(.stab) }
   .stabstr 0 : { *(.stabstr) }
=========><=========

Unfortunately failled to build kernel because:
[snip]
  	ld  -T arch/parisc/kernel/vmlinux.lds.s arch/parisc/kernel/head.o    init/built-in.o
--start-group  usr/built-in.o  arch/parisc/mm/built-in.o  arch/parisc/kernel/built-in.o
 arch/parisc/math-emu/built-in.o arch/parisc/kernel/init_task.o  kernel/built-in.o
 mm/built-in.o  fs/built-in.o  ipc/built-in.o  security/built-in.o  crypto/built-in.o
 lib/lib.a  arch/parisc/lib/lib.a `gcc -print-libgcc-file-name`  lib/built-in.o
 arch/parisc/lib/built-in.o `gcc -print-libgcc-file-name`  drivers/built-in.o
 sound/built-in.o  arch/parisc/oprofile/built-in.o  net/built-in.o --end-group
 -o .tmp_vmlinux1
local symbol 0: discarded in section `.exit.text' from kernel/built-in.o
local symbol 1: discarded in section `.exit.text' from kernel/built-in.o
local symbol 2: discarded in section `.exit.text' from fs/built-in.o
local symbol 3: discarded in section `.exit.text' from fs/built-in.o
local symbol 4: discarded in section `.exit.text' from fs/built-in.o
local symbol 5: discarded in section `.exit.text' from fs/built-in.o
local symbol 6: discarded in section `.exit.text' from fs/built-in.o
local symbol 7: discarded in section `.exit.text' from fs/built-in.o
local symbol 8: discarded in section `.exit.text' from fs/built-in.o
local symbol 9: discarded in section `.exit.text' from fs/built-in.o
local symbol 10: discarded in section `.exit.text' from fs/built-in.o
local symbol 11: discarded in section `.exit.text' from fs/built-in.o
local symbol 12: discarded in section `.exit.text' from fs/built-in.o
local symbol 13: discarded in section `.exit.text' from fs/built-in.o
local symbol 14: discarded in section `.exit.text' from fs/built-in.o
local symbol 15: discarded in section `.exit.text' from fs/built-in.o
local symbol 16: discarded in section `.exit.text' from fs/built-in.o
local symbol 17: discarded in section `.exit.text' from fs/built-in.o
local symbol 18: discarded in section `.exit.text' from fs/built-in.o
local symbol 19: discarded in section `.exit.text' from fs/built-in.o
local symbol 20: discarded in section `.exit.text' from fs/built-in.o
local symbol 21: discarded in section `.exit.text' from fs/built-in.o
local symbol 22: discarded in section `.exit.text' from fs/built-in.o
local symbol 23: discarded in section `.exit.text' from fs/built-in.o
local symbol 24: discarded in section `.exit.text' from fs/built-in.o
local symbol 25: discarded in section `.exit.text' from fs/built-in.o
local symbol 26: discarded in section `.exit.text' from fs/built-in.o
local symbol 27: discarded in section `.exit.text' from fs/built-in.o
local symbol 28: discarded in section `.exit.text' from drivers/built-in.o
local symbol 29: discarded in section `.exit.text' from drivers/built-in.o
local symbol 30: discarded in section `.exit.text' from drivers/built-in.o
local symbol 31: discarded in section `.exit.text' from drivers/built-in.o
local symbol 32: discarded in section `.exit.text' from drivers/built-in.o
local symbol 33: discarded in section `.exit.text' from drivers/built-in.o
local symbol 34: discarded in section `.exit.text' from drivers/built-in.o
local symbol 35: discarded in section `.exit.text' from drivers/built-in.o
local symbol 36: discarded in section `.exit.text' from drivers/built-in.o
local symbol 37: discarded in section `.exit.text' from drivers/built-in.o
local symbol 38: discarded in section `.exit.text' from drivers/built-in.o
local symbol 39: discarded in section `.exit.text' from drivers/built-in.o
local symbol 40: discarded in section `.exit.text' from drivers/built-in.o
local symbol 41: discarded in section `.exit.text' from drivers/built-in.o
local symbol 42: discarded in section `.exit.text' from drivers/built-in.o
local symbol 43: discarded in section `.exit.text' from drivers/built-in.o
local symbol 44: discarded in section `.exit.text' from drivers/built-in.o
local symbol 45: discarded in section `.exit.text' from drivers/built-in.o
local symbol 46: discarded in section `.exit.text' from drivers/built-in.o
local symbol 47: discarded in section `.exit.text' from drivers/built-in.o
local symbol 48: discarded in section `.exit.text' from drivers/built-in.o
local symbol 49: discarded in section `.exit.text' from drivers/built-in.o
local symbol 50: discarded in section `.exit.text' from drivers/built-in.o
local symbol 51: discarded in section `.exit.text' from drivers/built-in.o
local symbol 52: discarded in section `.exit.text' from drivers/built-in.o
local symbol 53: discarded in section `.exit.text' from drivers/built-in.o
local symbol 54: discarded in section `.exit.text' from drivers/built-in.o
local symbol 55: discarded in section `.exit.text' from drivers/built-in.o
local symbol 56: discarded in section `.exit.text' from drivers/built-in.o
local symbol 57: discarded in section `.exit.text' from drivers/built-in.o
local symbol 58: discarded in section `.exit.text' from drivers/built-in.o
local symbol 59: discarded in section `.exit.text' from drivers/built-in.o
local symbol 60: discarded in section `.exit.text' from drivers/built-in.o
local symbol 61: discarded in section `.exit.text' from drivers/built-in.o
local symbol 62: discarded in section `.exit.text' from drivers/built-in.o
local symbol 63: discarded in section `.exit.text' from drivers/built-in.o
local symbol 64: discarded in section `.exit.text' from drivers/built-in.o
local symbol 65: discarded in section `.exit.text' from drivers/built-in.o
local symbol 66: discarded in section `.exit.text' from drivers/built-in.o
local symbol 67: discarded in section `.exit.text' from drivers/built-in.o
local symbol 68: discarded in section `.exit.text' from drivers/built-in.o
local symbol 69: discarded in section `.exit.text' from drivers/built-in.o
local symbol 70: discarded in section `.exit.text' from drivers/built-in.o
local symbol 71: discarded in section `.exit.text' from drivers/built-in.o
local symbol 72: discarded in section `.exit.text' from drivers/built-in.o
local symbol 73: discarded in section `.exit.text' from drivers/built-in.o
local symbol 74: discarded in section `.exit.text' from drivers/built-in.o
local symbol 75: discarded in section `.exit.text' from drivers/built-in.o
local symbol 76: discarded in section `.exit.text' from drivers/built-in.o
local symbol 77: discarded in section `.exit.text' from drivers/built-in.o
local symbol 78: discarded in section `.exit.text' from drivers/built-in.o
local symbol 79: discarded in section `.exit.text' from drivers/built-in.o
local symbol 80: discarded in section `.exit.text' from drivers/built-in.o
local symbol 81: discarded in section `.exit.text' from drivers/built-in.o
local symbol 82: discarded in section `.exit.text' from drivers/built-in.o
local symbol 83: discarded in section `.exit.text' from drivers/built-in.o
local symbol 84: discarded in section `.exit.text' from drivers/built-in.o
local symbol 85: discarded in section `.exit.text' from drivers/built-in.o
local symbol 86: discarded in section `.exit.text' from drivers/built-in.o
local symbol 87: discarded in section `.exit.text' from drivers/built-in.o
fb_console_exit: discarded in section `.exit.text' from drivers/built-in.o
local symbol 88: discarded in section `.exit.text' from drivers/built-in.o
local symbol 89: discarded in section `.exit.text' from drivers/built-in.o
local symbol 90: discarded in section `.exit.text' from drivers/built-in.o
local symbol 91: discarded in section `.exit.text' from drivers/built-in.o
local symbol 92: discarded in section `.exit.text' from drivers/built-in.o
local symbol 93: discarded in section `.exit.text' from drivers/built-in.o
local symbol 94: discarded in section `.exit.text' from drivers/built-in.o
local symbol 95: discarded in section `.exit.text' from drivers/built-in.o
local symbol 96: discarded in section `.exit.text' from drivers/built-in.o
local symbol 97: discarded in section `.exit.text' from drivers/built-in.o
local symbol 98: discarded in section `.exit.text' from drivers/built-in.o
local symbol 99: discarded in section `.exit.text' from drivers/built-in.o
local symbol 100: discarded in section `.exit.text' from drivers/built-in.o
local symbol 101: discarded in section `.exit.text' from drivers/built-in.o
local symbol 102: discarded in section `.exit.text' from drivers/built-in.o
local symbol 103: discarded in section `.exit.text' from drivers/built-in.o
local symbol 104: discarded in section `.exit.text' from drivers/built-in.o
local symbol 105: discarded in section `.exit.text' from drivers/built-in.o
local symbol 106: discarded in section `.exit.text' from drivers/built-in.o
local symbol 107: discarded in section `.exit.text' from drivers/built-in.o
local symbol 108: discarded in section `.exit.text' from drivers/built-in.o
local symbol 109: discarded in section `.exit.text' from drivers/built-in.o
local symbol 110: discarded in section `.exit.text' from drivers/built-in.o
local symbol 111: discarded in section `.exit.text' from drivers/built-in.o
local symbol 112: discarded in section `.exit.text' from drivers/built-in.o
local symbol 113: discarded in section `.exit.text' from drivers/built-in.o
local symbol 114: discarded in section `.exit.text' from drivers/built-in.o
local symbol 115: discarded in section `.exit.text' from drivers/built-in.o
local symbol 116: discarded in section `.exit.text' from drivers/built-in.o
local symbol 117: discarded in section `.exit.text' from drivers/built-in.o
local symbol 118: discarded in section `.exit.text' from drivers/built-in.o
local symbol 119: discarded in section `.exit.text' from drivers/built-in.o
local symbol 120: discarded in section `.exit.text' from drivers/built-in.o
local symbol 121: discarded in section `.exit.text' from drivers/built-in.o
local symbol 122: discarded in section `.exit.text' from drivers/built-in.o
local symbol 123: discarded in section `.exit.text' from drivers/built-in.o
local symbol 124: discarded in section `.exit.text' from drivers/built-in.o
local symbol 125: discarded in section `.exit.text' from drivers/built-in.o
local symbol 126: discarded in section `.exit.text' from drivers/built-in.o
local symbol 127: discarded in section `.exit.text' from drivers/built-in.o
local symbol 128: discarded in section `.exit.text' from drivers/built-in.o
local symbol 129: discarded in section `.exit.text' from drivers/built-in.o
local symbol 130: discarded in section `.exit.text' from drivers/built-in.o
local symbol 131: discarded in section `.exit.text' from sound/built-in.o
local symbol 132: discarded in section `.exit.text' from sound/built-in.o
local symbol 133: discarded in section `.exit.text' from arch/parisc/oprofile/built-in.o
local symbol 134: discarded in section `.exit.text' from arch/parisc/oprofile/built-in.o
oprofilefs_unregister: discarded in section `.exit.text' from arch/parisc/oprofile/built-in.o
local symbol 135: discarded in section `.exit.text' from arch/parisc/oprofile/built-in.o
local symbol 136: discarded in section `.exit.text' from net/built-in.o
local symbol 137: discarded in section `.exit.text' from net/built-in.o
local symbol 138: discarded in section `.exit.text' from net/built-in.o
local symbol 139: discarded in section `.exit.text' from net/built-in.o
local symbol 140: discarded in section `.exit.text' from net/built-in.o
local symbol 141: discarded in section `.exit.text' from net/built-in.o
local symbol 142: discarded in section `.exit.text' from net/built-in.o
local symbol 143: discarded in section `.exit.text' from net/built-in.o
local symbol 144: discarded in section `.exit.text' from net/built-in.o
local symbol 145: discarded in section `.exit.text' from net/built-in.o
make: *** [.tmp_vmlinux1] Error 1

(btw removing: "+	*(.exit.text)" in the above patch compile and boot (at
least with defconfig which afaik didn't already include module support).

Any idea on what I missed?

hth,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
