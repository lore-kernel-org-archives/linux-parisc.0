Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B64448A6
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Jan 2004 11:05:16 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali) id 1Alu3u-000781-00
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Jan 2004 19:05:14 +0100
Date: Wed, 28 Jan 2004 19:05:14 +0100
Message-ID: <4015311000001F53@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] B2k and CONFIG_PDC_CONSOLE progress
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi pa,

Well, i made some small progress: i reach to figure out that PAGE0 status
changes between pdc_console_init() and pdc_io_getc():
@@ -1,4 +1,5 @@
- palx2000 kernel: pdc_console_init_force() would set a CL_DUP.
+ palx2000 kernel: mem_kbd != mem_cons.
+ palx2000 kernel: pdc_iodc_getc() would get from a CL_DUP.
  palx2000 kernel: PAGE0->mem_cons address: 100003a0.
  palx2000 kernel: PAGE0->mem_cons size: 48.
  palx2000 kernel: PAGE0->mem_boot address: 100003d0.
@@ -10,9 +11,9 @@
  palx2000 kernel: PAGE0->mem_kbd.dp.flags: 0.
  palx2000 kernel: PAGE0->mem_cons.dp.bc[0]: 255.
  palx2000 kernel: PAGE0->mem_cons.dp.bc[1]: 255.
- palx2000 kernel: PAGE0->mem_cons.dp.bc[2]: 10.
- palx2000 kernel: PAGE0->mem_cons.dp.bc[4]: 14.
- palx2000 kernel: PAGE0->mem_cons.dp.bc[5]: 1.
+ palx2000 kernel: PAGE0->mem_cons.dp.bc[2]: 255.
+ palx2000 kernel: PAGE0->mem_cons.dp.bc[3]: 10.
+ palx2000 kernel: PAGE0->mem_cons.dp.bc[4]: 1.
  palx2000 kernel: PAGE0->mem_boot.dp.bc[0]: 255.
  palx2000 kernel: PAGE0->mem_boot.dp.bc[1]: 255.
  palx2000 kernel: PAGE0->mem_boot.dp.bc[2]: 255.
@@ -21,26 +22,27 @@
  palx2000 kernel: PAGE0->mem_kbd.dp.bc[0]: 255.
  palx2000 kernel: PAGE0->mem_kbd.dp.bc[1]: 255.
  palx2000 kernel: PAGE0->mem_kbd.dp.bc[2]: 255.
- palx2000 kernel: PAGE0->mem_kbd.dp.bc[3]: 255.
- palx2000 kernel: PAGE0->mem_kbd.dp.bc[4]: 255.
- palx2000 kernel: PAGE0->mem_kbd.dp.bc[5]: 255.
- palx2000 kernel: PAGE0->mem_cons.dp.mod: 1.
+ palx2000 kernel: PAGE0->mem_kbd.dp.bc[3]: 10.
+ palx2000 kernel: PAGE0->mem_kbd.dp.bc[5]: 14.
+ palx2000 kernel: PAGE0->mem_cons.dp.mod: 0.
  palx2000 kernel: PAGE0->mem_boot.dp.mod: 0.
- palx2000 kernel: PAGE0->mem_kbd.dp.mod: 255.
- palx2000 kernel: PAGE0->mem_cons.dp.layers[0]: 00000283.
+ palx2000 kernel: PAGE0->mem_kbd.dp.mod: 2.
+ palx2000 kernel: PAGE0->mem_cons.dp.layers[0]: 00000101.
  palx2000 kernel: PAGE0->mem_boot.dp.layers[0]: 00000005.
- palx2000 kernel: PAGE0->mem_cons.hpa: fee003f8.
+ palx2000 kernel: PAGE0->mem_cons.hpa: fb000000.
  palx2000 kernel: PAGE0->mem_boot.hpa: f4002000.
- palx2000 kernel: PAGE0->mem_kbd.hpa: 00000000.
+ palx2000 kernel: PAGE0->mem_kbd.hpa: f4004000.
  palx2000 kernel: PAGE0->mem_cons.spa: 00000000.
  palx2000 kernel: PAGE0->mem_boot.spa: 00000000.
  palx2000 kernel: PAGE0->mem_kbd.spa: 00000000.
  palx2000 kernel: PAGE0->mem_cons.iodc_io: 0000e000.
  palx2000 kernel: PAGE0->mem_boot.iodc_io: 00019000.
- palx2000 kernel: PAGE0->mem_kbd.iodc_io: 00000000.
+ palx2000 kernel: PAGE0->mem_kbd.iodc_io: 00013000.
  palx2000 kernel: PAGE0->mem_cons.pad: 0.
  palx2000 kernel: PAGE0->mem_boot.pad: 0.
  palx2000 kernel: PAGE0->mem_kbd.pad: 0.
- palx2000 kernel: PAGE0->mem_cons.cl_class: 7.
+ palx2000 kernel: PAGE0->mem_cons.cl_class: 9.
  palx2000 kernel: PAGE0->mem_boot.cl_class: 1.

Is somebody have a small idea when this change could occurs?

Thanks,
   Joel

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
