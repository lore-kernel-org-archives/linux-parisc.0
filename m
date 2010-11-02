From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [PATCH] parisc : Fix GSC PS/2 driver name for keyboard and mouse
Date: Tue, 2 Nov 2010 16:23:08 +0100
Message-ID: <20101102162308.6dbe1cbf@borg.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/vajWLPw2yosThoeUL+NxU+i"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--MP_/vajWLPw2yosThoeUL+NxU+i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Fix kernel warnings caused by the driver name of GSC PS/2 containing '/'.

The following warnings are observed on a K410 system :

[   10.700000] name 'GSC PS/2 keyboard'
[   10.732000] ------------[ cut here ]------------
[   10.772000] WARNING: at fs/proc/generic.c:323
[   10.828000] Modules linked in:
[   10.916000] 
[   10.916000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[   10.936000] PSW: 00000000000001000000000000001111 Not tainted
[   10.992000] r00-03  0004000f 104fe3e0 10201ea0 00000000
[   11.060000] r04-07  4fc405c8 00000006 4fc405c8 4fc40694
[   11.124000] r08-11  4fc40708 10438aa0 00000001 1043bfc8
[   11.184000] r12-15  104ff2a0 104ff2a0 4fc38634 104ff2a0
[   11.248000] r16-19  f0001570 10479af0 f000006c 1044fe50
[   11.308000] r20-23  00000000 00000028 104cd858 00000000
[   11.372000] r24-27  ffffffff 0000000e 1044fe10 1043bbe0
[   11.436000] r28-31  0000002b 00000078 4fc40800 0000000d
[   11.496000] sr00-03  00000000 00000000 00000000 00000000
[   11.560000] sr04-07  00000000 00000000 00000000 00000000
[   11.624000] 
[   11.688000] IASQ: 00000000 00000000 IAOQ: 10201ea0 10201ea4
[   11.704000]  IIR: 03ffe01f    ISR: 00000000  IOR: 0000000d
[   11.772000]  CPU:        0   CR30: 4fc40000 CR31: f01043b0
[   11.836000]  ORIG_R28: 4fc40940
[   11.904000]  IAOQ[0]: __xlate_proc_name+0x90/0xd0
[   11.940000]  IAOQ[1]: __xlate_proc_name+0x94/0xd0
[   11.996000]  RP(r2): __xlate_proc_name+0x90/0xd0
[   12.052000] Backtrace:
[   12.108000]  [<10257790>] vsnprintf+0x290/0x4f4
[   12.136000] 
[   12.188000] ---[ end trace 91bf6ece17e322dd ]---
[   12.208000] serio: GSC PS/2 keyboard port at 0x0001c000 irq 19 @ 10:12:7
[   12.264000] name 'GSC PS/2 mouse'
[   12.344000] ------------[ cut here ]------------
[   12.384000] WARNING: at fs/proc/generic.c:323
[   12.436000] Modules linked in:
[   12.524000] 
[   12.528000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[   12.544000] PSW: 00000000000001000000000000001111 Tainted: G        W  
[   12.600000] r00-03  0004000f 104fe3e0 10201ea0 00000000
[   12.680000] r04-07  4fc405c8 00000006 4fc405c8 4fc40694
[   12.740000] r08-11  4fc40708 10438aa0 00000001 1043bfc8
[   12.804000] r12-15  104ff2a0 104ff2a0 4fc38634 104ff2a0
[   12.868000] r16-19  f0001570 10479af0 f000006c 1044fe50
[   12.928000] r20-23  00000000 00000025 104cd858 00000000
[   12.992000] r24-27  ffffffff 0000000e 1044fe10 1043bbe0
[   13.056000] r28-31  00000028 00000078 4fc40800 0000000d
[   13.116000] sr00-03  00000000 00000000 00000000 00000000
[   13.180000] sr04-07  00000000 00000000 00000000 00000000
[   13.244000] 
[   13.308000] IASQ: 00000000 00000000 IAOQ: 10201ea0 10201ea4
[   13.324000]  IIR: 03ffe01f    ISR: 00000000  IOR: 0000000d
[   13.392000]  CPU:        0   CR30: 4fc40000 CR31: f01043b0
[   13.456000]  ORIG_R28: 4fc40940
[   13.524000]  IAOQ[0]: __xlate_proc_name+0x90/0xd0
[   13.560000]  IAOQ[1]: __xlate_proc_name+0x94/0xd0
[   13.616000]  RP(r2): __xlate_proc_name+0x90/0xd0
[   13.672000] Backtrace:
[   13.728000]  [<10257790>] vsnprintf+0x290/0x4f4
[   13.756000] 
[   13.808000] ---[ end trace 91bf6ece17e322de ]---
[   13.828000] serio: GSC PS/2 mouse port at 0x00020100 irq 19 @ 10:12:8


Signed-off-by: Guy Martin <gmsoft@tuxicoman.be>


--MP_/vajWLPw2yosThoeUL+NxU+i
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=gsc-ps2-driver-name.patch

--- drivers/input/serio/gscps2.c.orig	2010-11-01 09:54:50.000000000 +0100
+++ drivers/input/serio/gscps2.c	2010-11-01 09:55:53.000000000 +0100
@@ -358,7 +358,7 @@
 	gscps2_reset(ps2port);
 	ps2port->id = readb(ps2port->addr + GSC_ID) & 0x0f;
 
-	snprintf(serio->name, sizeof(serio->name), "GSC PS/2 %s",
+	snprintf(serio->name, sizeof(serio->name), "gsc-ps2-%s",
 		 (ps2port->id == GSC_ID_KEYBOARD) ? "keyboard" : "mouse");
 	strlcpy(serio->phys, dev_name(&dev->dev), sizeof(serio->phys));
 	serio->id.type		= SERIO_8042;

--MP_/vajWLPw2yosThoeUL+NxU+i--
