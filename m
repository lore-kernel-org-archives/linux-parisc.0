Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.latnet.lv (mail.latnet.lv [159.148.108.208])
	by dsl2.external.hp.com (Postfix) with SMTP id 691C34840
	for <parisc-linux@lists.parisc-linux.org>; Thu,  9 Oct 2003 02:33:04 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] System hangs after SCSI problems 
Message-ID: <1065688381.3f851d3da4b56@clients.latnet.lv>
Date: Thu, 09 Oct 2003 11:33:01 +0300 (EEST)
From: dub@latnet.lv
MIME-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
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

> dub@latnet.lv  dub@latnet.lv
> Wed, 24 Sep 2003 18:25:47 +0300 (EEST)
> I run Debian vmlinux-parisc-2.4.20-32-smp on K210. Not recently I faced a
> strange hang situation. Host stopped responding both from network and console, 
> ethernet port remained up on link level. In syslog.log and kernel.log I see scsi
> problems.
> After restarting all disks are OK (one of mirror partitions was resynced 
> manually). 

Hi,

Just for your information. The problem was with a SCSI disk. After a week, it
had more problems and md mirroring removed it. I tried to issue dd.

dd if=/dev/sdf1 of=/dev/null bs=64k
dd: reading `/dev/sdf1': Input/output error

After some seconds the system stopped responding (I saw it when entering the
next command).

My Humble Conclusion. Comaring to HP-UX, Debian is not so stable on PA-RISC
platform. :-)

BR,
Dub
