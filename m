Return-Path: <ktototam1@hotmail.com>
Received: from hotmail.com (bay2-f169.bay2.hotmail.com [65.54.247.169])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0FE914843
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Mar 2004 03:37:39 -0700 (MST)
From: "Net Spamu" <ktototam1@hotmail.com>
To: parisc-linux@lists.parisc-linux.org
Date: Thu, 18 Mar 2004 10:37:32 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <BAY2-F169VnztvfLVoe00040f03@hotmail.com>
Subject: [parisc-linux] K210: SCSI reset problem
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

I already posted this problem about hanging after SCSI timeouts.

I see the following on my console.

SCSI host 1 abort (pid 1207191) timed out - resetting
SCSI bus is being reset for host 1 channel 0.
ncr53c8xx_reset: pid=1207191 reset_flags=2 serial_number=1207192 
serial_number_at_timeout=1207192
SCSI host 1 abort (pid 1207201) timed out - resetting
SCSI bus is being reset for host 1 channel 0.

http://lists.parisc-linux.org/pipermail/parisc-linux/2003-September/021085.html

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
The new MSN 8: advanced junk mail protection and 2 months FREE* 
http://join.msn.com/?page=features/junkmail
