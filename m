Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.centraltx.com (gapserver.centraltx.com [64.209.39.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 464C44830
	for <parisc-linux@parisc-linux.org>; Sat, 11 Jan 2003 14:28:32 -0700 (MST)
From: "Marc Eisenbarth" <marc@centraltx.com>
To: <parisc-linux@parisc-linux.org>
Date: Sat, 11 Jan 2003 15:28:21 -0600
Message-ID: <000001c2b9b8$5e163570$3e73a218@ko>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <200301110847.h0B8l7KL004719@mailer.berkom.de>
Subject: [parisc-linux] Cannot boot after installing kernel!
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

Well, things were going great on my C180 until just a few minutes ago
when I did:

Apt-get install kernel-image-2.4.19-32 in order to upgrade from my
2.4.17-32 kernel. Now, when I boot it hangs at:

1               1      16   f0 Palo
2            3141    4094   82 swap
5              17    3140   83 ext2

PALO(F0) partition contains:
    0/vmlinux32 3687647 bytes @ 0x48000

Information: No console specified on kernel command line. This is
normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102
palo_ke
rnel=5/boot/vmlinux'
Selected kernel: /boot/vmlinux from partition 5
ELF32 executable
Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 2503500 mediaptr 0x1000
Segment 1 load 00364000 size 674056 mediaptr 0x265000
Segment 2 load 0040c000 size 286720 mediaptr 0x30a000
Segment 3 load 00458000 size 32768 mediaptr 0x350000
Segment 4 load 0048efb8 size 110864 mediaptr 0x358fb8
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Any way I can boot back into the working kernel??

Thanks,
-Marc
