Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from intro.peace.co.nz (intro.peace.co.nz [202.14.141.227])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2CB28482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 May 2002 22:57:01 -0600 (MDT)
From: "James Braid" <james.braid@peace.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Thu, 16 May 2002 17:00:30 +1200
Message-ID: <013201c1fc96$99f8adf0$5e01000a@bongo>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
In-Reply-To: <20020511211440.C705E482A@dsl2.external.hp.com>
Subject: [parisc-linux] Re: Dodgy SCSI in L2000
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

Hey,

I have applied the patch just posted to the list (irq.c patch). I'm
running the latest CVS kernel on a dual 440Mhz L2000, 1Gb ram, 4x 18.2Gb
LVD SCSI disks.

I am seeing the same problems I have seen before (SCSI resets etc), BUT
the box is not kernel panicing any more - which is an improvement

Dbench works fine on single disks (i.e running one instance of dbench on
one disk) - up to 200 clients (didn't bother trying further).

But when I try to run 2 instances of dbench on any 2 disks in the box, I
get all sorts of SCSI bus resets and errors.

Heres a cut and paste from the console:

---------

scsi : aborting command due to timeout : pid 200512, scsi0, channel 0,
id 0, lun 0 Read (10) 00 02 03 78 20 00 00 08 00
sym53c8xx_abort: pid=200512 serial_number=200514
serial_number_at_timeout=200514
SCSI host 0 abort (pid 200512) timed out - resetting
SCSI bus is being reset for host 0 channel 0.
sym53c8xx_reset: pid=200512 reset_flags=2 serial_number=200514
serial_number_at_timeout=200514
scsi : aborting command due to timeout : pid 200771, scsi0, channel 0,
id 2, lun 0 Write (10) 00 01 98 22 c8 00 00 08 00
sym53c8xx_abort: pid=200771 serial_number=200773
serial_number_at_timeout=200773
scsi : aborting command due to timeout : pid 200772, scsi0, channel 0,
id 2, lun 0 Write (10) 00 00 01 10 a8 00 00 08 00
sym53c8xx_abort: pid=200772 serial_number=200774
serial_number_at_timeout=200774
scsi : aborting command due to timeout : pid 200773, scsi0, channel 0,
id 2, lun 0 Write (10) 00 02 00 63 e0 00 00 08 00
sym53c8xx_abort: pid=200773 serial_number=200775
serial_number_at_timeout=200775
scsi : aborting command due to timeout : pid 200774, scsi0, channel 0,
id 2, lun 0 Write (10) 00 00 d0 51 b8 00 00 08 00
sym53c8xx_abort: pid=200774 serial_number=200776
serial_number_at_timeout=200776
scsi : aborting command due to timeout : pid 200775, scsi0, channel 0,
id 0, lun 0 Write (10) 00 00 40 4a 38 00 00 18 00
sym53c8xx_abort: pid=200775 serial_number=200777
serial_number_at_timeout=200777
scsi : aborting command due to timeout : pid 200776, scsi0, channel 0,
id 2, lun 0 Write (10) 00 01 b0 38 e0 00 00 08 00
sym53c8xx_abort: pid=200776 serial_number=200778
serial_number_at_timeout=200778
scsi : aborting command due to timeout : pid 200777, scsi0, channel 0,
id 2, lun 0 Write (10) 00 00 04 2d 80 00 00 08 00
sym53c8xx_abort: pid=200777 serial_number=200779
serial_number_at_timeout=200779
scsi : aborting command due to timeout : pid 200778, scsi0, channel 0,
id 2, lun 0 Write (10) 00 01 1c 5b 90 00 00 08 00
sym53c8xx_abort: pid=200778 serial_number=200780
serial_number_at_timeout=200780
scsi : aborting command due to timeout : pid 200779, scsi0, channel 0,
id 2, lun 0 Write (10) 00 00 d0 52 c0 00 00 08 00
sym53c8xx_abort: pid=200779 serial_number=200781
serial_number_at_timeout=200781
SCSI host 0 abort (pid 200780) timed out - resetting
SCSI bus is being reset for host 0 channel 0.
sym53c8xx_reset: pid=200780 reset_flags=2 serial_number=200782
serial_number_at_timeout=200782
SCSI host 0 abort (pid 201014) timed out - resetting
SCSI bus is being reset for host 0 channel 0.
sym53c8xx_reset: pid=201014 reset_flags=2 serial_number=201016
serial_number_at_timeout=201016
SCSI host 0 abort (pid 201161) timed out - resetting
SCSI bus is being reset for host 0 channel 0.
sym53c8xx_reset: pid=201161 reset_flags=2 serial_number=201163
serial_number_at_timeout=201163
SCSI host 0 abort (pid 201174) timed out - resetting
SCSI bus is being reset for host 0 channel 0.
sym53c8xx_reset: pid=201174 reset_flags=2 serial_number=201176
serial_number_at_timeout=201176
SCSI host 0 abort (pid 201187) timed out - resetting
SCSI bus is being reset for host 0 channel 0.
sym53c8xx_reset: pid=201187 reset_flags=2 serial_number=201189
serial_number_at_timeout=201189
SCSI host 0 abort (pid 201200) timed out - resetting
SCSI bus is being reset for host 0 channel 0.
sym53c8xx_reset: pid=201200 reset_flags=2 serial_number=201202
serial_number_at_timeout=201202
SCSI host 0 abort (pid 201213) timed out - resetting
SCSI bus is being reset for host 0 channel 0.
sym53c8xx_reset: pid=201213 reset_flags=2 serial_number=201215
serial_number_at_timeout=201215
SCSI host 0 abort (pid 201226) timed out - resetting
SCSI bus is being reset for host 0 channel 0.
sym53c8xx_reset: pid=201226 reset_flags=2 serial_number=201228
serial_number_at_timeout=201228

---------

And so on and so on like this. Grant has mentioned that the termination
or SCSI cables could be an issue, but as I have no replacements for this
box I cant really test this out. Before I applied the irq.c patch, the
box would panic just running dbench on one single disk.

If anyone has any ideas or possible solutions on what could be causing
this, I'd *love* to hear them. If you need any further details, just let
me know.

I've also tried compiling the Qlogic ISP (we have bunch of these cards
lying around from our SGI boxes) scsi driver but it doesn't want to
compile on PA-RISC. Are there any other SCSI cards which are known to
compile under PA-RISC? I was thinking I could then leave just the root
disk on the core I/O board and use another SCSI controller for the other
3 disks. Is this possible?

Cheers, James


-- 
James Braid
System Administrator
Peace Software
Ph:		+64 9 373 0400
Email:	james.braid@peace.com
