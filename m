Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta05-svc.ntlworld.com (mta05-svc.ntlworld.com [62.253.162.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id E31C3482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Apr 2001 16:55:13 -0600 (MDT)
From: "Jeff Arthur" <jeffa@mustain.demon.co.uk>
To: parisc-linux@lists.parisc-linux.org
Date: Mon, 9 Apr 2001 23:54:02 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Reply-To: jeffa@owlpoo.org
Cc: apul@israeli.demon.co.uk
Message-Id: <20010409225507.RNIM272.mta05-svc.ntlworld.com@mustain.demon.co.uk>
Subject: [parisc-linux] 9000/730 booting but SCSI Problems (mke2fs)
List-ID: <linux-parisc.vger.kernel.org>

After help form Christoph Plattner I resolved my init 
problems, and got a prompt!! 

(Thanks Christoph, I had the problem you 
described a couple of builds earlier so 
recreated the problem, applied your fix and it 
worked a treat)

however I now have a problem with SCSI, all 
devices are seen ok, have removed cdrom as I 
noted in some earlier posts that this could 
cause problems, but when creating filesystems 
the SCSI dies.

I have tried a couple of drives, boot log looks 
fine.  Any Suggestions or is this just down to 
lack of docs in this area, as I noted from posts 
back in Feb?

hpbox:~# mke2fs /dev/sda3
mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
71520 inodes, 142991 blocks
7149 blocks (5.00%) reserved for the super user
First data block=0
5 block groups
32768 blocks per group, 32768 fragments per group
14304 inodes per group
Superblock backups stored on blocks:
        32768, 98304

Writing inode tables: done
scsi0: Unable to abort command for target 2
scsi0: Unable to send Bus Device Reset for target 2
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 0c, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 000b2038 (script[0x080e]), dsps = 000b2cde, target = 0
scsi0: Failing command for ID2
SCSI disk error : host 0 channel 0 id 2 lun 0 return code = 2
 I/O error: dev 08:03, sector 160
 I/O error: dev 08:03, sector 162
 I/O error: dev 08:03, sector 0
 I/O error: dev 08:03, sector 288
 I/O error: dev 08:03, sector 416
 I/O error: dev 08:03, sector 544...


... I/O error: dev 08:03, sector 1052022
 I/O error: dev 08:03, sector 1052150
Warning: could not erase block 0: Attempt to write block from filesystem resulte
 I/O error: dev 08:03, sector 2
d in short write I/O error: dev 08:03, sector 8

Writing superb I/O error: dev 08:03, sector 262144
locks and filesy I/O error: dev 08:03, sector 262152
stem accounting  I/O error: dev 08:03, sector 524288
information:  I/O error: dev 08:03, sector 786432
 I/O error: dev 08:03, sector 786440
 I/O error: dev 08:03, sector 1048576
done
 I/O error: dev 08:03, sector 2
 I/O error: dev 08:03, sector 8
 I/O error: dev 08:03, sector 262144
 I/O error: dev 08:03, sector 262152
 I/O error: dev 08:03, sector 786432
 I/O error: dev 08:03, sector 786440


Thought for the Day:
   Home is where you hang your @
