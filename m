Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from intro.peace.co.nz (intro.peace.co.nz [202.14.141.227])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2186C482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 May 2002 23:25:31 -0600 (MDT)
From: "James Braid" <james.braid@peace.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Tue, 7 May 2002 17:28:13 +1200
Message-ID: <006001c1f587$fbc0c830$5e01000a@bongo>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Subject: [parisc-linux] Dodgy SCSI in L2000
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

Okay, I have got my RAID array working now :-)

BUT...

The box dies if I thrash the array with dbench (using anymore than 10
clients), or sometimes when making a filesystem on the array (I have
been able to make a filesystem about once every ten times).

It does the same thing on both SMP and non-SMP kernels.

The raid array looks okay (its 18Gb * 3 in RAID0):

hypo:~# cat /proc/mdstat
Personalities : [linear] [raid0] [raid1] [raid5]
read_ahead 1024 sectors
md0 : active raid0 scsi/host4/bus0/target2/lun0/part1[2]
scsi/host4/bus0/target0/lun0/part1[1]
scsi/host0/bus0/target2/lun0/part1[0]
      53320656 blocks 4k chunks

unused devices: <none>

Now, I try to make a ext2 FS on the array, and it dies like so:

hypo:~# mke2fs /dev/md0
mke2fs 1.27 (8-Mar-2002)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
6668288 inodes, 13330164 blocks
666508 blocks (5.00%) reserved for the super user
First data block=0
407 block groups
32768 blocks per group, 32768 fragments per group
16384 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632,
2654208,
        4096000, 7962624, 11239424

Writing inode tables: done
Writing superblocks and filesystem accounting information:
^^^^ dies here, just hangs the login session

In the window I have open to the GSP (in a console session) on the
L2000, I see this:

sym4:0:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym0:0:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym0:0:0: ABORT operation timed-out.
sym0:0:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym0:0:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:0:0: DEVICE RESET operation started.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:0:0: DEVICE RESET operation timed-out.
sym0:2:0: DEVICE RESET operation started.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:2:0: DEVICE RESET operation timed-out.
sym0:0:0: BUS RESET operation started.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:0:0: BUS RESET operation timed-out.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:0:0: BUS RESET operation started.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:0:0: BUS RESET operation timed-out.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:2:0: BUS RESET operation started.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:2:0: BUS RESET operation timed-out.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:2:0: BUS RESET operation started.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:2:0: BUS RESET operation timed-out.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:2:0: BUS RESET operation started.
sym4:2:0: ABORT operation timed-out.
sym4:0:0: DEVICE RESET operation started.
sym0:2:0: BUS RESET operation timed-out.
sym4:0:0: DEVICE RESET operation timed-out.
sym4:2:0: DEVICE RESET operation started.
sym0:2:0: BUS RESET operation started.
sym4:2:0: DEVICE RESET operation timed-out.
sym4:0:0: BUS RESET operation started.
sym0: SCSI BUS reset detected.
sym0: SCSI BUS has been reset.
sym4: SCSI BUS reset detected.
sym4: SCSI BUS has been reset.
sym4:0:0: BUS RESET operation complete.
sym0:2:0: BUS RESET operation complete.
sym4:0:0: ABORT operation started.
sym0:0:0: ABORT operation started.
sym0:0:0: ABORT operation timed-out.
sym0:0:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym0:0:0: ABORT operation timed-out.
sym0:0:0: ABORT operation started.
sym0:0:0: ABORT operation timed-out.
sym0:0:0: ABORT operation started.
sym0:0:0: ABORT operation timed-out.
sym0:0:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:0:0: ABORT operation started.
sym4:0:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.
sym0:0:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym0:2:0: ABORT operation timed-out.
sym0:2:0: ABORT operation started.
sym4:2:0: ABORT operation timed-out.
sym4:2:0: ABORT operation started.

Which loops over and over and over and over..

It also does the same thing using the sym5c8xx version 1 driver as well
as the version 2 driver (the above errors are from the version 2
driver).

At this point the box is totally unusable.

I then hit CTRL-\, and got this:

May  7 16:23:16 hypo kernel:
May  7 16:23:16 hypo kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
May  7 16:23:16 hypo kernel: PSW: 00000000000000000000000000000000 Not
tainted
May  7 16:23:16 hypo kernel: r00-03  0000000000000000 0000000040050d00
000000004003d8bb 00000000000291a0
May  7 16:23:16 hypo kernel: r04-07  0000000000000000 0000000040051500
00000000000290a0 0000000000000004
May  7 16:23:16 hypo kernel: r08-11  0000000040051500 0000000000cb8000
0000000000000197 0000000000036890
May  7 16:23:16 hypo kernel: r12-15  0000000000038ad0 0000000000000197
0000000000000800 0000000000000040
May  7 16:23:16 hypo kernel: r16-19  000000000000ffff 0000000000000001
0000000000000004 00000000401d9ab0
May  7 16:23:16 hypo kernel: r20-23  0000000000000076 00000000401d9ab0
00000000401646a8 00000000bff005c8
May  7 16:23:16 hypo kernel: r24-27  0000000000001000 0000000000035880
0000000000000003 0000000000027b18
May  7 16:23:16 hypo kernel: r28-31  0000000000000000 0000000000000032
00000000bff00440 00000000401646b3
May  7 16:23:16 hypo kernel: sr0-3   0000000000000480 0000000000000480
0000000000000000 0000000000000480
May  7 16:23:16 hypo kernel: sr4-7   0000000000000480 0000000000000480
0000000000000480 0000000000000480
May  7 16:23:16 hypo kernel:
May  7 16:23:16 hypo kernel: IASQ: 0000000000000480 0000000000000480
IAOQ: 0000000040113a2f 0000000040113a33
May  7 16:23:16 hypo kernel:  IIR: 6b540028    ISR: 0000000000000480
IOR: 000000000003d000
May  7 16:23:16 hypo kernel:  CPU:        0   CR30: 000000004c1bc000
CR31: 0000000010460000
May  7 16:23:16 hypo kernel:  ORIG_R28: 0000000000000000


After this has finished dumping, the box is usable again.

One thing I have noticed with mke2fs is that the indode table numbers
tick away pretty fast until it gets to 205, then it slows down big time,
and then it speeds up again until it gets to ~340, at which point the
scsi ABORT errors will sometimes start happening.

I have tested all the disks individually (making filesystems, running
dbench), and the filesystems get made fine, and dbench works okay up to
about 100 odd clients.

I have *no* idea what is causing any of this....anyone else have any
hints/info/fixes for this problem? (Sorry for the long email, but I
figured it would be best to paste the full errors)

I can provide clarification or more details if needed.

Cheers, James
