Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from orion.netbank.com.br (orion.netbank.com.br [200.203.199.90])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90E34482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jul 2003 23:00:16 -0600 (MDT)
Received: from [200.181.169.17] (helo=brinquendo.conectiva.com.br)
	by orion.netbank.com.br with asmtp (Exim 3.33 #1)
	id 19dNPc-0003kQ-00
	for parisc-linux@lists.parisc-linux.org; Fri, 18 Jul 2003 02:04:08 -0300
Date: Fri, 18 Jul 2003 01:33:00 -0300
From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030718043300.GB1582@conectiva.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] pdc_console_die: undefined reference to `log_end'
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Second try:

arch/parisc/kernel/built-in.o: In function `pdc_console_die':
arch/parisc/kernel/built-in.o(.text.pdc_console_die+0x4c): undefined reference to `log_end'
arch/parisc/kernel/built-in.o: In function `pdc_console_restart':
arch/parisc/kernel/built-in.o(.text.pdc_console_restart+0x44): undefined reference to `log_end'
make: ** [.tmp_vmlinux1] Erro 139

Problem is:

===== kernel/printk.c 1.26 vs edited =====
--- 1.26/kernel/printk.c	Sat Jun 28 03:20:35 2003
+++ edited/kernel/printk.c	Fri Jul 18 01:29:15 2003
@@ -77,7 +77,7 @@
  */
 static unsigned long log_start;			/* Index into log_buf: next char to be read by syslog() */
 static unsigned long con_start;			/* Index into log_buf: next char to be sent to consoles */
-static unsigned long log_end;			/* Index into log_buf: most-recently-written-char + 1 */
+unsigned long log_end;			/* Index into log_buf: most-recently-written-char + 1 */
 static unsigned long logged_chars;		/* Number of chars produced since last read+clear operation */
 
 struct console_cmdline console_cmdline[MAX_CMDLINECONSOLES];
