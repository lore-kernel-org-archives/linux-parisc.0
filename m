Return-Path: <doko@cs.tu-berlin.de>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id A94EE4843
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 11 Jan 2004 02:17:06 -0700 (MST)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <16385.5227.153358.397944@gargle.gargle.HOWL>
Date: Sun, 11 Jan 2004 10:16:27 +0100
To: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Cc: 
Subject: [parisc-linux] running gcc testsuite triggers ongoing page faults
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

I think I did see this first with gcc-3.3 from 20031229. Running the
3.3 testsuite (gcc) doesn't terminate. Instead, I see expect eating
all CPU time, together with syslogd and klogd. /var get's filled with
log messages in kern.log, syslog and debug.

The machine is a A500, kernel from the archives (kernel-image-2.4.21-64-smp_pa7.3)


Jan 11 06:42:49 pampa kernel: do_page_fault() pid=13367 command='expect' type=15 address=0x4abfccfe
Jan 11 06:42:49 pampa kernel: vm_start = 0x40353000, vm_end = 0x40355000
Jan 11 06:42:49 pampa kernel: 
Jan 11 06:42:49 pampa kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Jan 11 06:42:49 pampa kernel: PSW: 00000000000001001111111100001111 Not tainted
Jan 11 06:42:49 pampa kernel: r00-03  0000000000000000 0000000040336510 000000004033655c fffffffffffffffa
Jan 11 06:42:49 pampa kernel: r04-07  0000000040336570 0000000000001008 0000000000001002 0000000000000063
Jan 11 06:42:49 pampa kernel: r08-11  0000000000021148 0000000000207a8c 0000000000000006 0000000000005438
Jan 11 06:42:49 pampa kernel: r12-15  0000000040050a6c 0000000040050a78 0000000000021618 0000000000000001
Jan 11 06:42:49 pampa kernel: r16-19  0000000000000000 0000000000000001 0000000000000000 00000000403349c8
Jan 11 06:42:49 pampa kernel: r20-23  0000000000207bb8 00000ab50a94d694 00000000402af66a 00000000002067a8
Jan 11 06:42:49 pampa kernel: r24-27  00000000400a8ec2 000lt() pid=13367 command='expect' type=15 address=0x4abfccfe
Jan 11 06:42:49 pampa kernel: vm_start = 0x40353000, vm_end = 0x40355000
Jan 11 06:42:49 pampa kernel: 
Jan 11 06:42:49 pampa kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Jan 11 06:42:49 pampa kernel: PSW: 00000000000001001111111100001111 Not tainted
Jan 11 06:42:49 pampa kernel: r00-03  0000000000000000 0000000040336510 000000004033655c fffffffffffffffa
Jan 11 06:42:49 pampa kernel: r04-07  0000000040336570 0000000000001008 0000000000001002 0000000000000063
Jan 11 06:42:49 pampa kernel: r08-11  0000000000021148 0000000000207a8c 0000000000000006 0000000000005438
Jan 11 06:42:49 pampa kernel: r12-15  0000000040050a6c 0000000040050a78 0000000000021618 0000000000000001
Jan 11 06:42:49 pampa kernel: r16-19  0000000000000000 0000000000000001 0000000000000000 00000000403349c8
Jan 11 06:42:49 pampa kernel: r20-23  0000000000207bb8 00000ab50a94d694 00000000402af66a 00000000002067a8
Jan 11 06:42:49 pampa kernel: r24-27  00000000400a8ec2 00000ab50a94d690 00000ab50a94d694 0000000000020dd4
Jan 11 06:42:49 pampa kernel: r28-31  00000ab54abfccfa 0000000040336584 00000000faf06a80 0000000000000004
Jan 11 06:42:49 pampa kernel: sr0-3   0000000000d28480 0000000000d28480 0000000000000000 0000000000d28480
Jan 11 06:42:49 pampa kernel: sr4-7   0000000000d28480 0000000000d28480 0000000000d28480 0000000000d28480
Jan 11 06:42:49 pampa kernel: 
Jan 11 06:42:49 pampa kernel: IASQ: 0000000000d28480 0000000000d28480 IAOQ: 0000000040259043 0000000040259047
Jan 11 06:42:49 pampa kernel:  IIR: 0f881094    ISR: 0000000000d28480  IOR: 000000004abfccfe
Jan 11 06:42:49 pampa kernel:  CPU:        1   CR30: 0000000018f5c000 CR31: 0000000000008020
Jan 11 06:42:49 pampa kernel:  ORIG_R28: 00000ab54abfccfa
Jan 11 06:42:49 pampa kernel: 
Jan 11 06:42:49 pampa kernel: do_page_fault() pid=13367 command='expect' type=15 address=0x4abfccfe
Jan 11 06:42:49 pampa kernel: vm_start = 0x40353000, vm_end = 0x40355000
Jan 11 06:42:49 pampa kernel: 
Jan 11 06:42:49 pampa kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Jan 11 06:42:49 pampa kernel: PSW: 00000000000001001111111100001111 Not tainted
Jan 11 06:42:49 pampa kernel: r00-03  0000000000000000 0000000040336510 000000004033655c fffffffffffffffa
Jan 11 06:42:49 pampa kernel: r04-07  0000000040336570 0000000000001008 0000000000001002 0000000000000063
Jan 11 06:42:49 pampa kernel: r08-11  0000000000021148 0000000000207a8c 0000000000000006 0000000000005438
Jan 11 06:42:49 pampa kernel: r12-15  0000000040050a6c 0000000040050a78 0000000000021618 0000000000000001
Jan 11 06:42:49 pampa kernel: r16-19  0000000000000000 0000000000000001 0000000000000000 00000000403349c8
Jan 11 06:42:49 pampa kernel: r20-23  0000000000207bb8 00000ab50a94d694 00000000402af66a 00000000002067a8
Jan 11 06:42:49 pampa kernel: r24-27  00000000400a8ec2 00000ab50a94d690 00000ab50a94d694 0000000000020dd4
Jan 11 06:42:49 pampa kernel: r28-31  00000ab54abfccfa 0000000040336584 00000000faf06a80 0000000000000004
Jan 11 06:42:49 pampa kernel: sr0-3   0000000000d28480 0000000000d28480 0000000000000000 0000000000d28480
Jan 11 06:42:49 pampa kernel: sr4-7   0000000000d28480 0000000000d28480 0000000000d28480 0000000000d28480
Jan 11 06:42:49 pampa kernel: 
Jan 11 06:42:49 pampa kernel: IASQ: 0000000000d28480 0000000000d28480 IAOQ: 0000000040259043 0000000040259047
Jan 11 06:42:49 pampa kernel:  IIR: 0f881094    ISR: 0000000000d28480  IOR: 000000004abfccfe
Jan 11 06:42:49 pampa kernel:  CPU:        1   CR30: 0000000018f5c000 CR31: 0000000000008020
Jan 11 06:42:49 pampa kernel:  ORIG_R28: 00000ab54abfccfa
Jan 11 06:42:49 pampa kernel: 
Jan 11 06:42:49 pampa kernel: do_page_fault() pid=13367 command='expect' type=15 address=0x4abfccfe
Jan 11 06:42:49 pampa kernel: vm_start = 0x40353000, vm_end = 0x40355000
Jan 11 06:42:49 pampa kernel: 
Jan 11 06:42:49 pampa kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Jan 11 06:42:49 pampa kernel: PSW: 00000000000001001111111100001111 Not tainted
Jan 11 06:42:49 pampa kernel: r00-03  0000000000000000 0000000040336510 000000004033655c fffffffffffffffa
Jan 11 06:42:49 pampa kernel: r04-07  0000000040336570 0000000000001008 0000000000001002 0000000000000063
Jan 11 06:42:49 pampa kernel: r08-11  0000000000021148 0000000000207a8c 0000000000000006 0000000000005438
Jan 11 06:42:49 pampa kernel: r12-15  0000000040050a6c 0000000040050a78 0000000000021618 0000000000000001
Jan 11 06:42:49 pampa kernel: r16-19  0000000000000000 0000000000000001 0000000000000000 00000000403349c8
Jan 11 06:42:49 pampa kernel: r20-23  0000000000207bb8 00000ab50a94d694 00000000402af66a 00000000002067a8
Jan 11 06:42:49 pampa kernel: r24-27  00000000400a8ec2 00000ab50a94d690 00000ab50a94d694 0000000000020dd4
Jan 11 06:42:49 pampa kernel: r28-31  00000ab54abfccfa 0000000040336584 00000000faf06a80 0000000000000004
Jan 11 06:42:49 pampa kernel: sr0-3   0000000000d28480 0000000000d28480 0000000000000000 0000000000d28480
Jan 11 06:42:49 pampa kernel: sr4-7   0000000000d28480 0000000000d28480 0000000000d28480 0000000000d28480
Jan 11 06:42:49 pampa kernel: 
Jan 11 06:42:49 pampa kernel: IASQ: 0000000000d28480 0000000000d28480 IAOQ: 0000000040259043 0000000040259047
Jan 11 06:42:49 pampa kernel:  IIR: 0f881094    ISR: 0000000000d28480  IOR: 000000004abfccfe
Jan 11 06:42:49 pampa kernel:  CPU:        1   CR30: 0000000018f5c000 CR31: 0000000000008020
Jan 11 06:42:49 pampa kernel:  ORIG_R28: 00000ab54abfccfa
