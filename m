From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] ext2 vs ext3 on hppa
Date: Fri, 11 Feb 2005 00:16:29 -0700
Message-ID: <20050211071629.GA32318@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi all,
ext3 perf isn't so good on parisc.
I've posted profile data for kernel builds:

http://lists.parisc-linux.org/pipermail/parisc-linux/2004-November/025196.html

But not for "tar". I can't find the data I collect before. :^(
ISTR the culprit in ext3 was the bitmap search using atomic ops.
On parisc, atomic ops are terrible since it requires a spinlock/op/unlock
sequence.

I was asked about tar perf again and decided to post some results.
If someone tells me which wiki page to add this, I'll pound parts
of the data below into it.

In a nut shell, I timed unpacking the linux source tree:

FS 	real		user		sys
ext2	2m10.814s	0m53.424s	0m6.084s
ext3	3m46.577s	0m54.619s	1m34.553s
xfs	1m22.205s	0m53.952s	0m9.739s
md0+xfs	1m27.740s	0m54.550s	0m12.885s

User time is predominantly bzip2 running.

I didn't realize xfs can schedule work better than ext2 on a single disk.
Adding md striping adds ~6% overhead...that's not so good.
It's possible I need bigger chunks and that would go away.

I don't know if defaults are comparable between xfs and ext3.
Is one implementing more or better features by default than the other?

I'll be looking at mdadm+xfs for future file systems to see
if I can break it. Or I'll have to live without journaling on
"stable" build machines. The ext3 "tar" performance is just
unacceptable.

BTW, I get segfaults on the ext3 G

"raw" data follows.

grant

grundler@riot:~$ uname -a
Linux riot 2.6.11-rc3-pa3 #6 SMP Mon Feb 7 04:25:07 UTC 2005 parisc64 GNU/Linux

grundler@riot:~$ cat /proc/cpuinfo 
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8700 (PCX-W2)
cpu MHz         : 650.000000
model           : 9000/800/A500-6X
...
processor       : 1
cpu family      : PA-RISC 2.0
cpu             : PA8700 (PCX-W2)
cpu MHz         : 650.000000
model           : 9000/800/A500-6X
model name      : Crescendo 650 W2
...


riot:/# lsscsi
[1:0:15:0]   disk    SEAGATE  ST336704LC       HP01  /dev/sda
[4:0:0:0]    disk    SEAGATE  ST318451LC       HP00  /dev/sdb
[4:0:1:0]    disk    SEAGATE  ST318451LC       HP01  /dev/sdc
[4:0:2:0]    disk    SEAGATE  ST318451LC       HP00  /dev/sdd
[4:0:3:0]    disk    SEAGATE  ST318451LC       HP01  /dev/sde
[4:0:8:0]    disk    SEAGATE  ST318451LC       HP00  /dev/sdf
[4:0:9:0]    disk    SEAGATE  ST318451LC       HP00  /dev/sdg
[4:0:10:0]   disk    SEAGATE  ST318451LC       HP00  /dev/sdh
[4:0:12:0]   disk    SEAGATE  ST318451LC       HP01  /dev/sdi
[4:0:13:0]   disk    SEAGATE  ST318451LC       HP01  /dev/sdj
[4:0:14:0]   enclosu HP       A5272A           HP04  -       
[5:0:0:0]    disk    SEAGATE  ST318451LC       HP01  /dev/sdk
[5:0:1:0]    disk    SEAGATE  ST318451LC       HP00  /dev/sdl
[5:0:2:0]    disk    SEAGATE  ST318451LC       HP00  /dev/sdm
[5:0:3:0]    disk    SEAGATE  ST318451LC       HP00  /dev/sdn
[5:0:8:0]    disk    SEAGATE  ST318451LC       HP00  /dev/sdo
[5:0:9:0]    disk    SEAGATE  ST318451LC       HP00  /dev/sdp
[5:0:10:0]   disk    SEAGATE  ST318451LC       HP00  /dev/sdq
[5:0:11:0]   disk    SEAGATE  ST318451LC       HP00  /dev/sdr
[5:0:12:0]   disk    SEAGATE  ST318451LC       HP01  /dev/sds
[5:0:13:0]   disk    SEAGATE  ST318451LC       HP01  /dev/sdt
[5:0:14:0]   enclosu HP       A5272A           HP05  -       
riot:/# lspci -vt
-+-[30]-+-02.0  LSI Logic / Symbios Logic 53c1010 66MHz  Ultra3 SCSI Adapter
 |      \-02.1  LSI Logic / Symbios Logic 53c1010 66MHz  Ultra3 SCSI Adapter
 +-[20]---00.0  LSI Logic / Symbios Logic 53c1010 66MHz  Ultra3 SCSI Adapter
 +-[10]---00.0  Broadcom Corporation NetXtreme BCM5701 Gigabit Ethernet
 \-[00]-+-00.0  Digital Equipment Corporation DECchip 21142/43
        +-01.0  LSI Logic / Symbios Logic 53C896/897
        +-01.1  LSI Logic / Symbios Logic 53C896/897
        +-02.0  LSI Logic / Symbios Logic 53c875
        +-02.1  LSI Logic / Symbios Logic 53c875
        +-04.0  Hewlett-Packard Company: Unknown device 128d
        \-04.1  Hewlett-Packard Company Diva Serial [GSP] Multiport UART
...

# mkfs /dev/sdk
mke2fs 1.35 (28-Feb-2004)
/dev/sdk is entire device, not just one partition!
Proceed anyway? (y,n) y
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
2223872 inodes, 4445810 blocks
222290 blocks (5.00%) reserved for the super user
First data block=0
136 block groups
32768 blocks per group, 32768 fragments per group
16352 inodes per group
...
riot:/mnt# time tar xjf linux-2.6.11-rc3-pa3.tar.bz2 

real    2m10.814s
user    0m53.424s
sys     0m6.084s
riot:/mnt#
...

riot:/# mke2fs -j /dev/sdk
mke2fs 1.35 (28-Feb-2004)
/dev/sdk is entire device, not just one partition!
Proceed anyway? (y,n) y
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
2223872 inodes, 4445810 blocks
222290 blocks (5.00%) reserved for the super user
First data block=0
136 block groups
32768 blocks per group, 32768 fragments per group
16352 inodes per group
...
riot:/# mount /dev/sdk /mnt
riot:/# cd /mnt
riot:/mnt# time tar xjf ~/linux-2.6.11-rc3-pa3.tar.bz2 

real    3m46.577s
user    0m54.619s
sys     1m34.553s
riot:/mnt# 

riot:/# mkfs -t xfs /dev/sdk
meta-data=/dev/sdk               isize=256    agcount=16, agsize=277863 blks
         =                       sectsz=512  
data     =                       bsize=4096   blocks=4445808, imaxpct=25
         =                       sunit=0      swidth=0 blks, unwritten=1
naming   =version 2              bsize=4096  
log      =internal log           bsize=4096   blocks=2560, version=1
         =                       sectsz=512   sunit=0 blks
realtime =none                   extsz=65536  blocks=0, rtextents=0

riot:/mnt# time tar xjf ~/linux-2.6.11-rc3-pa3.tar.bz2 

real    1m22.205s
user    0m53.952s
sys     0m9.739s


riot:/# mdadm -C /dev/md0 -l 0 -n 6 /dev/sdb /dev/sdk /dev/sdc /dev/sdl /dev/sdd /dev/sdm
...
riot:/# cat /proc/mdstat 
Personalities : [linear] [raid0] [raid1] 
md0 : active raid0 sdm[5] sdd[4] sdl[3] sdc[2] sdk[1] sdb[0]
      106699008 blocks 64k chunks
...
riot:/# mkfs -t xfs /dev/md0
meta-data=/dev/md0               isize=256    agcount=16, agsize=1667184 blks
         =                       sectsz=512  
data     =                       bsize=4096   blocks=26674752, imaxpct=25
         =                       sunit=16     swidth=96 blks, unwritten=1
naming   =version 2              bsize=4096  
log      =internal log           bsize=4096   blocks=13024, version=1
         =                       sectsz=512   sunit=0 blks
realtime =none                   extsz=393216 blocks=0, rtextents=0
riot:/# mount /dev/md0 /mnt
riot:/# cd /mnt
riot:/mnt# time tar xjf ~/linux-2.6.11-rc3-pa3.tar.bz2 

real    1m27.740s
user    0m54.550s
sys     0m12.885s

[ after running some kernel builds on the xfs file system ]
grundler@riot:/mnt$ time tar xjf /root/linux-2.6.11-rc3-pa3.tar.bz2 

real    2m35.000s
user    0m55.749s
sys     0m21.332s

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
