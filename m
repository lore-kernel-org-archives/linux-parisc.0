Return-Path: <ktototam1@hotmail.com>
Received: from hotmail.com (bay2-f64.bay2.hotmail.com [65.54.247.64])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4DFE54856
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 31 Mar 2004 09:03:56 -0700 (MST)
From: "Net Spamu" <ktototam1@hotmail.com>
To: parisc-linux@lists.parisc-linux.org
Date: Wed, 31 Mar 2004 16:03:55 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <BAY2-F647JHYJwnF1UG0003811d@hotmail.com>
Subject: [parisc-linux] Critical: server hangs because of scsi resets
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

I see the following on my console.

SCSI host 1 abort (pid 1207191) timed out - resetting
SCSI bus is being reset for host 1 channel 0.
ncr53c8xx_reset: pid=1207191 reset_flags=2 serial_number=1207192
serial_number_at_timeout=1207192
SCSI host 1 abort (pid 1207201) timed out - resetting
SCSI bus is being reset for host 1 channel 0.

The system hangs because of the resets. The problem repeats time by time.

I run K210 under linux-2.4.23-pa5. The problem appears on different scsi
controllers, so I hope there are neither controller nor disk problems. This
are current drivers from /var/log/messages.

kernel: loop: loaded (max 8 devices)
kernel: Found i82596 at 0xffd07000, IRQ 87
kernel: eth0: 82596 at 0xffd07000, 08 00 09 DA 44 88 IRQ 87.
kernel: 82596.c $Revision: 1.32 $
kernel: SCSI subsystem driver Revision: 1.00
kernel: zalon_scsi_callback: Zalon vers field is 0x1, IRQ 35
kernel: ncr53c8xx: 53c720 detected
kernel: ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
kernel: zalon_scsi_callback: Zalon vers field is 0x1, IRQ 36
kernel: ncr53c8xx: 53c720 detected
kernel: ncr53c720-1: ID 7, Fast-10, Parity Checking, Differential
kernel: scsi0 : ncr53c8xx-3.4.3b-20010512
kernel: scsi1 : ncr53c8xx-3.4.3b-20010512

Can it be a bad driver problem? I use Linux Software RAID, is it possible to
tune some parameters there?

Many thanks in advance for any help!

BR,
Dub

_________________________________________________________________
Help STOP SPAM with the new MSN 8 and get 2 months FREE*  
http://join.msn.com/?page=features/junkmail
