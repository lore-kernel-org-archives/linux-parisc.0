From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Improper use of __xchg?
Date: Sat, 19 Jun 2004 15:20:39 -0400
Message-ID: <20040619192039.GA8368@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


pa,

Someone with the notion of said functions semantics might be willing to
produce the correct fix please? :)

64-bit kernel build (turned off loop.ko compilation)

carlos@firin:/mnt/flaire/src/linux-2.6$ make
make[1]: `arch/parisc/kernel/asm-offsets.s' is up to date.
  CHK     include/asm-parisc/offsets.h
  CHK     include/linux/compile.h
  GEN     .version
  CHK     include/linux/compile.h
  UPD     include/linux/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
kernel/built-in.o(.text.put_files_struct+0x118): In function
`put_files_struct':
: undefined reference to `__xchg_called_with_bad_pointer'
make: *** [.tmp_vmlinux1] Error 1
carlos@firin:/mnt/flaire/src/linux-2.6$ 

Cheers,
Carlos.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
