Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.latnet.lv (mail.latnet.lv [159.148.108.208])
	by dsl2.external.hp.com (Postfix) with SMTP id BD6D9483E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Sep 2003 09:25:52 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1064417147.3f71b77b8406a@clients.latnet.lv>
Date: Wed, 24 Sep 2003 18:25:47 +0300 (EEST)
From: dub@latnet.lv
MIME-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Subject: [parisc-linux] System hangs after SCSI problems
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

Hi,

I run Debian vmlinux-parisc-2.4.20-32-smp on K210. Not recently I faced a
strange hang situation. Host stopped responding both from network and console, 
ethernet port remained up on link level. In syslog.log and kernel.log I see scsi
problems.

After restarting all disks are OK (one of mirror partitions was resynced manually). 

Thank you in advance for any comments!

BR,
Dub

syslog.log

Sep 22 18:00:32 myhost4 kernel: scsi : aborting command due to timeout : pid
10399653, scsi1, chann
el 0, id 2, lun 0 Write (10) 00 00 d0 db 90 00 00 08 00
Sep 22 18:00:34 myhost4 kernel: ncr53c8xx_abort: pid=10399653
serial_number=10399664 serial_number_
at_timeout=10399664
Sep 22 18:00:34 myhost4 kernel: SCSI host 1 abort (pid 10399653) timed out -
resetting
Sep 22 18:00:34 myhost4 kernel: SCSI bus is being reset for host 1 channel 0.
Sep 22 18:00:34 myhost4 kernel: ncr53c8xx_reset: pid=10399653 reset_flags=2
serial_number=10399664
serial_number_at_timeout=10399664
Sep 22 18:00:35 myhost4 kernel: ncr53c720-1-<2,*>: FAST-10 WIDE SCSI 20.0 MB/s
(100 ns, offset 8)
Sep 22 18:00:35 myhost4 kernel: ncr53c720-1-<1,*>: FAST-10 WIDE SCSI 20.0 MB/s
(100 ns, offset 8)
Sep 22 18:00:35 myhost4 kernel: ncr53c720-1-<4,*>: FAST-10 WIDE SCSI 20.0 MB/s
(100 ns, offset 8)
Sep 22 18:03:35 myhost4 kernel: ncr53c720-1-<3,*>: FAST-10 WIDE SCSI 20.0 MB/s
(100 ns, offset 8)


kernel.log

Sep 22 17:53:18 myhost4 kernel: scsi : aborting command due to timeout : pid
10397795, scsi1, chann
el 0, id 1, lun 0 Write (10) 00 00 93 2c 60 00 00 18 00 
Sep 22 17:53:18 myhost4 kernel: ncr53c8xx_abort: pid=10397795
serial_number=10397806 serial_number_
at_timeout=10397806
Sep 22 17:53:18 myhost4 kernel: scsi : aborting command due to timeout : pid
10397797, scsi1, chann
el 0, id 2, lun 0 Write (10) 00 00 d0 e4 00 00 00 08 00 
Sep 22 17:53:18 myhost4 kernel: ncr53c8xx_abort: pid=10397797
serial_number=10397808 serial_number_
at_timeout=10397808
Sep 22 17:53:18 myhost4 kernel: scsi : aborting command due to timeout : pid
10397798, scsi1, chann
el 0, id 2, lun 0 Write (10) 00 00 d0 e4 10 00 00 08 00 
Sep 22 17:53:18 myhost4 kernel: ncr53c8xx_abort: pid=10397798
serial_number=10397809 serial_number_
at_timeout=10397809
Sep 22 17:53:18 myhost4 kernel: ncr53c720-1: abort ccb=4f319000 (cancel)
Sep 22 17:53:18 myhost4 kernel: scsi : aborting command due to timeout : pid
10397803, scsi1, chann
el 0, id 2, lun 0 Write (10) 00 00 d0 e6 20 00 00 08 00 
Sep 22 17:53:18 myhost4 kernel: ncr53c8xx_abort: pid=10397803
serial_number=10397814 serial_number_
at_timeout=10397814
Sep 22 17:53:18 myhost4 kernel: ncr53c720-1: abort ccb=4d7a4800 (cancel)
Sep 22 17:53:19 myhost4 kernel: scsi : aborting command due to timeout : pid
10397804, scsi1, chann
el 0, id 4, lun 0 Write (10) 00 00 00 09 2e 00 00 08 00 
Sep 22 17:53:19 myhost4 kernel: ncr53c8xx_abort: pid=10397804
serial_number=10397815 serial_number_
at_timeout=10397815
Sep 22 17:53:19 myhost4 kernel: ncr53c720-1: abort ccb=3cb4f800 (cancel)
Sep 22 17:53:19 myhost4 kernel: scsi : aborting command due to timeout : pid
10397805, scsi1, chann
el 0, id 1, lun 0 Write (10) 00 00 11 ec d8 00 00 08 00 
Sep 22 17:53:19 myhost4 kernel: ncr53c8xx_abort: pid=10397805
serial_number=10397816 serial_number_
at_timeout=10397816
Sep 22 17:53:19 myhost4 kernel: ncr53c720-1: abort ccb=4fb1d000 (cancel)
Sep 22 17:53:19 myhost4 kernel: SCSI host 1 abort (pid 10397795) timed out -
resetting
Sep 22 17:53:19 myhost4 kernel: SCSI bus is being reset for host 1 channel 0.
Sep 22 17:53:19 myhost4 kernel: ncr53c8xx_reset: pid=10397795 reset_flags=2
serial_number=10397806 
serial_number_at_timeout=10397806
Sep 22 17:53:19 myhost4 kernel: ncr53c720-1-<3,*>: FAST-10 WIDE SCSI 20.0 MB/s
(100 ns, offset 8)
Sep 22 17:53:19 myhost4 kernel: ncr53c720-1-<4,*>: FAST-10 WIDE SCSI 20.0 MB/s
(100 ns, offset 8)
Sep 22 17:53:19 myhost4 kernel: ncr53c720-1-<1,*>: FAST-10 WIDE SCSI 20.0 MB/s
(100 ns, offset 8)
Sep 22 17:53:19 myhost4 kernel: ncr53c720-1-<2,*>: FAST-10 WIDE SCSI 20.0 MB/s
(100 ns, offset 8)
Sep 22 18:00:32 myhost4 kernel: scsi : aborting command due to timeout : pid
10399653, scsi1, chann
el 0, id 2, lun 0 Write (10) 00 00 d0 db 90 00 00 08 00 
Sep 22 18:00:34 myhost4 kernel: ncr53c8xx_abort: pid=10399653
serial_number=10399664 serial_number_
at_timeout=10399664
Sep 22 18:00:34 myhost4 kernel: SCSI host 1 abort (pid 10399653) timed out -
resetting
Sep 22 18:00:34 myhost4 kernel: SCSI bus is being reset for host 1 channel 0.
Sep 22 18:00:34 myhost4 kernel: ncr53c8xx_reset: pid=10399653 reset_flags=2
serial_number=10399664 
serial_number_at_timeout=10399664
