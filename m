From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Subject: [parisc-linux] [PATCH] add MODULE_ALIAS_LDISC to asm-parisc/termios.h
Date: Thu, 4 Sep 2003 10:53:15 -0300
Message-ID: <20030904135315.GB2411__10551.5660522089$1416622755$gmane$org@conectiva.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Rusty Russell <rusty@rustcorp.com.au>,
	parisc-linux@lists.parisc-linux.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Linus Torvalds <torvalds@osdl.org>,
	Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi,

	I noticed this one on parisc64 with the latest bk tree:

  CC [M]  drivers/char/n_hdlc.o
drivers/char/n_hdlc.c:985: parse error before numeric constant
drivers/char/n_hdlc.c:985: warning: type defaults to `int' in declaration of `MODULE_ALIAS_LDISC'
drivers/char/n_hdlc.c:985: warning: function declaration isn't a prototype
drivers/char/n_hdlc.c:985: warning: data definition has no type or storage classmake[2]: *** [drivers/char/n_hdlc.o] Error 1
make[1]: *** [drivers/char] Error 2
make: *** [drivers] Error 2

	This patch makes it compile, doing the same thing that was done to
include/asm-i386/termios.h, please see if this is acceptable, if it is I can
provide the same patch for all the other arches.

- Arnaldo

===== include/asm-parisc/termios.h 1.4 vs edited =====
--- 1.4/include/asm-parisc/termios.h	Sat Jul 20 06:52:25 2002
+++ edited/include/asm-parisc/termios.h	Thu Sep  4 13:43:57 2003
@@ -101,6 +101,8 @@
 #define user_termios_to_kernel_termios(k, u) copy_from_user(k, u, sizeof(struct termios))
 #define kernel_termios_to_user_termios(u, k) copy_to_user(u, k, sizeof(struct termios))
 
+#define MODULE_ALIAS_LDISC(ldisc) \
+        MODULE_ALIAS("tty-ldisc-" __stringify(ldisc))
 #endif	/* __KERNEL__ */
 
 #endif	/* _PARISC_TERMIOS_H */
