Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.centraltx.com (gapserver.centraltx.com [64.209.39.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F312482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  7 Sep 2002 14:50:30 -0600 (MDT)
Date: Sat,  7 Sep 2002 15:46:25 -0500
Message-Id: <200209071546.AA210633180@mail.centraltx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: "marc " <marc@centraltx.com>
Reply-To: <marc@centraltx.com>
To: Randolph Chung <randolph@tausq.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Kernel Panic
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

Okay, I've upgraded from the .iso image off of debian.org.
Now, I'm getting stranger errors with my tape drive. It looks
like the st is no longer a loadable kernel module? Anyways,
any help is appreciated.


(none):~# lsmod
Module                  Size  Used by    Not tainted
(none):~# insmod st
insmod: st: no module by that name found
(none):~# cat /proc/scsi/scsi
Attached devices: 
Host: scsi0 Channel: 00 Id: 05 Lun: 00
  Vendor: SEAGATE  Model: ST34371W         Rev: HP03
  Type:   Direct-Access                    ANSI SCSI revision: 02
Host: scsi0 Channel: 00 Id: 06 Lun: 00
  Vendor: SEAGATE  Model: ST32171W         Rev: HP03
  Type:   Direct-Access                    ANSI SCSI revision: 02
Host: scsi1 Channel: 00 Id: 01 Lun: 00
  Vendor: SONY     Model: SDT-7000         Rev: 0150
  Type:   Sequential-Access                ANSI SCSI revision: 02
(none):~# ls /dev/st*
/dev/st0   /dev/st0l  /dev/st1	 /dev/st1l  /dev/stderr  /dev/stdout
/dev/st0a  /dev/st0m  /dev/st1a  /dev/st1m  /dev/stdin
(none):~# ls nst*
/dev/nst0   /dev/nst0l	/dev/nst1   /dev/nst1l
/dev/nst0a  /dev/nst0m	/dev/nst1a  /dev/nst1m
(none):~# tar -cvpf /dev/st0 /home
st0: Block limits 1 - 16777215 bytes.
tar: Removing leading `/' from member names
home/
home/lost+found/
home/marc/
home/marc/.bashrc
home/marc/.bash_profile
st0: Error on write filemark.
st0: Error with sense data: Current st09:00: sns = 70  4
ASC=44 ASCQ= 0
Raw sense data:0x70 0x00 0x04 0x00 0x00 0x00 0x00 0x12 0x00 0x00 0x00 0x00 0x44 
0x00 0x00 0x00 0xa3 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
tar: /dev/st0: Warning: Cannot close: Input/output error
(none):/home/marc# tar -xvpf /dev/st0
tar: /dev/st0: Cannot read: Input/output error
tar: At beginning of tape, quitting now
tar: Error is not recoverable: exiting now
