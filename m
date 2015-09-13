From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Unaligned access in scsi blk_rq_map_sg
Date: Sun, 13 Sep 2015 15:40:25 -0400
Message-ID: <4FC538D2-3433-473B-90B2-F5C144352D77@bell.net>
References: <EE9345DC-EA98-41DB-93C2-63A5F15C137B@bell.net> <2C44DC97-789E-408C-83AF-A7FDB6E6EB8A@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-21-9557822
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2C44DC97-789E-408C-83AF-A7FDB6E6EB8A@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-21-9557822
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On 2015-09-12, at 6:40 PM, John David Anglin wrote:

> On 2015-09-12, at 6:13 PM, John David Anglin wrote:
>=20
>> With Linus' tree at head, I got the following boot error today:
>>=20
>> scsi 4:0:0:0: Direct-Access     HP 73.4G ST373207LW       HPC1 PQ: 0 =
ANSI: 3   =20
>> scsi target4:0:0: Beginning Domain Validation                         =
         =20
>> scsi target4:0:0: Ending Domain Validation                            =
         =20
>> scsi target4:0:0: FAST-160 WIDE SCSI 320.0 MB/s DT IU QAS RTI WRFLOW =
PCOMP (6.2)
>> scsi 4:0:2:0: Direct-Access     HP 73.4G ST373207LW       HPC1 PQ: 0 =
ANSI: 3   =20
>> scsi target4:0:2: Beginning Domain Validation                         =
         =20
>> scsi target4:0:2: Ending Domain Validation                            =
         =20
>> scsi target4:0:2: FAST-160 WIDE SCSI 320.0 MB/s DT IU QAS RTI WRFLOW =
PCOMP (6.2)
>> ata3: SATA link down (SStatus 0 SControl 0)                           =
         =20
>> random: nonblocking pool is initialized                               =
         =20
>> ata4: SATA link up 3.0 Gbps (SStatus 123 SControl 0)                  =
         =20
>> ata4.00: ATA-9: ST3000DM001-1ER166, CC25, max UDMA/133                =
         =20
>> ata4.00: 5860533168 sectors, multi 0: LBA48 NCQ (depth 31/32)         =
         =20
>> ata4.00: configured for UDMA/100                                      =
         =20
>> scsi 3:0:0:0: Direct-Access     ATA      ST3000DM001-1ER1 CC25 PQ: 0 =
ANSI: 5   =20
>> sd 3:0:0:0: [sdc] 5860533168 512-byte logical blocks: (3.00 TB/2.72 =
TiB)       =20
>> sd 4:0:0:0: [sda] 143374738 512-byte logical blocks: (73.4 GB/68.3 =
GiB)        =20
>> sd 4:0:2:0: [sdb] 143374738 512-byte logical blocks: (73.4 GB/68.3 =
GiB)        =20
>> sd 4:0:0:0: [sda] Write Protect is off                                =
         =20
>> sd 4:0:2:0: [sdb] Write Protect is off                                =
         =20
>> sd 4:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports =
DPO and FA
>> sd 4:0:2:0: [sdb] Write cache: enabled, read cache: enabled, supports =
DPO and FA
>> mptbase: ioc1: Initiating bringup                                     =
         =20
>> sd 3:0:0:0: [sdc] 4096-byte physical blocks                           =
         =20
>> sd 3:0:0:0: [sdc] Write Protect is off                                =
         =20
>> sd 3:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't =
support DPA
>> sdc: sdc1                                                             =
        =20
>> sd 3:0:0:0: [sdc] Attached SCSI disk                                  =
         =20
>> ioc1: LSI53C1030 B2: Capabilities=3D{Initiator,Target}                =
           =20
>> scsi host5: ioc1: LSI53C1030 B2, FwRev=3D01032341h, Ports=3D1, =
MaxQ=3D255, IRQ=3D68    =20
>> sda: sda1 sda2 sda3 sda4                                              =
        =20
>> sd 4:0:2:0: [sdb] Attached SCSI disk                                  =
         =20
>> sd 4:0:0:0: [sda] Attached SCSI disk                                  =
         =20
>> scsi_id(992): unaligned access to 0x00000000fae5b009 at =
ip=3D0x00000000410039a7  =20
>> scsi_id(993): unaligned access to 0x00000000fa7b9009 at =
ip=3D0x00000000410039a7  =20
>> Backtrace:                                                            =
         =20
>> [<000000000c1bb008>] scsi_init_sgtable+0x70/0x168 [scsi_mod]          =
        =20
>> [<000000000c1bb16c>] scsi_init_io+0x6c/0x250 [scsi_mod]               =
        =20
>> [<00000000107355a0>] sd_setup_read_write_cmnd+0x58/0x940 [sd_mod]     =
        =20
>> [<0000000010735ecc>] sd_init_command+0x44/0x130 [sd_mod]              =
        =20
>> [<000000000c1bb454>] scsi_setup_cmnd+0x104/0x1c0 [scsi_mod]           =
        =20
>> [<000000000c1bb7a0>] scsi_prep_fn+0x100/0x340 [scsi_mod]              =
        =20
>> [<000000004035cc50>] blk_peek_request+0x1b8/0x298                     =
        =20
>> [<000000000c1bd3b0>] scsi_request_fn+0xf8/0xab0 [scsi_mod]            =
        =20
>> [<00000000403584ec>] __blk_run_queue+0x4c/0x70                        =
        =20
>> [<000000004038126c>] cfq_insert_request+0x2dc/0x580                   =
        =20
>> [<00000000403576ac>] __elv_add_request+0x1b4/0x300                    =
        =20
>>=20
>>=20
>> Bad Address (null pointer deref?): Code=3D15 regs=3D000000007c65d260 =
(Addr=3D0000003b)
>> CPU: 2 PID: 936 Comm: systemd-udevd Not tainted 4.2.0+ #1             =
         =20
>> task: 000000033f98a348 ti: 000000007c65c000 task.ti: 000000007c65c000 =
         =20
>>=20
>>    YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                   =
       =20
>> PSW: 00001000000001001111111100001110 Not tainted                     =
         =20
>> r00-03  000000ff0804ff0e 000000007c65d130 0000000040363660 =
000000007c65d130    =20
>> r04-07  00000000406f18f0 0000000000004000 0000000000000320 =
0000000000000000    =20
>> r08-11  0000000000000000 0000000000000001 0001003b00000000 =
000000007e650dc0    =20
>> r12-15  0000000000001000 0000000000000032 0000000000000004 =
0000000042d0d780    =20
>> r16-19  0000000000000000 000000007e4cf088 0000000000001000 =
0000000000001000    =20
>> r20-23  0000000000000000 000000007c1ce000 0000000000011000 =
000000004076d900    =20
>> r24-27  0002d12b3ff4bb53 cffd2ed4c0000000 000000007e48cb20 =
00000000406f18f0    =20
>> r28-31  0001003b00000000 000000007c65d230 000000007c65d260 =
0000000000000001    =20
>> sr00-03  0000000000019000 0000000000000000 0000000000000000 =
0000000000019000   =20
>> sr04-07  0000000000000000 0000000000000000 0000000000000000 =
0000000000000000   =20
>>=20
>> IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040363668 =
000000004036366c=20
>> IIR: 0d4010dc    ISR: 0000000000010000  IOR: 0000003b00000000         =
        =20
>> CPU:        2   CR30: 000000007c65c000 CR31: ffffffffffffffff         =
        =20
>> ORIG_R28: 0000000000000000                                            =
        =20
>> IAOQ[0]: blk_rq_map_sg+0x310/0x5d8                                    =
        =20
>> IAOQ[1]: blk_rq_map_sg+0x314/0x5d8                                    =
        =20
>> RP(r2): blk_rq_map_sg+0x308/0x5d8                                     =
        =20
>> Backtrace:                                                            =
         =20
>> [<000000000c1bb008>] scsi_init_sgtable+0x70/0x168 [scsi_mod]          =
        =20
>> [<000000000c1bb16c>] scsi_init_io+0x6c/0x250 [scsi_mod]               =
        =20
>> [<00000000107355a0>] sd_setup_read_write_cmnd+0x58/0x940 [sd_mod]     =
        =20
>> [<0000000010735ecc>] sd_init_command+0x44/0x130 [sd_mod]              =
        =20
>> [<000000000c1bb454>] scsi_setup_cmnd+0x104/0x1c0 [scsi_mod]           =
        =20
>> [<000000000c1bb7a0>] scsi_prep_fn+0x100/0x340 [scsi_mod]              =
        =20
>> [<000000004035cc50>] blk_peek_request+0x1b8/0x298                     =
        =20
>> [<000000000c1bd3b0>] scsi_request_fn+0xf8/0xab0 [scsi_mod]            =
        =20
>> [<00000000403584ec>] __blk_run_queue+0x4c/0x70                        =
        =20
>> [<000000004038126c>] cfq_insert_request+0x2dc/0x580                   =
        =20
>> [<00000000403576ac>] __elv_add_request+0x1b4/0x300                    =
        =20
>>=20
>> Kernel panic - not syncing: Bad Address (null pointer deref?)         =
         =20
>=20
>=20
> It appears the unaligned accesses were present before but didn't cause =
a panic:
>=20
> ioc1: LSI53C1030 B2: Capabilities=3D{Initiator,Target}                 =
          =20
> scsi 3:0:0:0: Direct-Access     ATA      ST3000DM001-1ER1 CC25 PQ: 0 =
ANSI: 5   =20
> sd 3:0:0:0: [sdc] 5860533168 512-byte logical blocks: (3.00 TB/2.72 =
TiB)       =20
> sd 3:0:0:0: [sdc] 4096-byte physical blocks                            =
        =20
> sd 3:0:0:0: [sdc] Write Protect is off                                 =
        =20
> sd 3:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't =
support DPA
> sdc: sdc1                                                              =
       =20
> sd 3:0:0:0: [sdc] Attached SCSI disk                                   =
        =20
> scsi host5: ioc1: LSI53C1030 B2, FwRev=3D01032341h, Ports=3D1, =
MaxQ=3D255, IRQ=3D68    =20
> sd 4:0:2:0: [sdb] Spinning up disk...                                  =
        =20
> sd 4:0:0:0: [sda] 143374738 512-byte logical blocks: (73.4 GB/68.3 =
GiB)        =20
> sd 4:0:0:0: [sda] Write Protect is off                                 =
        =20
> sd 4:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports =
DPO and FA
> .                                                                      =
        =20
> sda: sda1 sda2 sda3 sda4                                               =
       =20
> sd 4:0:0:0: [sda] Attached SCSI disk                                   =
        =20
> ...                                                                    =
        =20
> scsi_id(938): unaligned access to 0x00000000faed4009 at =
ip=3D0x00000000410038df  =20
> .....ready                                                             =
        =20
> sd 4:0:2:0: [sdb] 143374738 512-byte logical blocks: (73.4 GB/68.3 =
GiB)        =20
> sd 4:0:2:0: [sdb] Write Protect is off                                 =
        =20
> sd 4:0:2:0: [sdb] Write cache: enabled, read cache: enabled, supports =
DPO and FA
> sd 4:0:2:0: [sdb] Attached SCSI disk                                   =
        =20
> scsi_id(942): unaligned access to 0x00000000fae77009 at =
ip=3D0x00000000410038df  =20
> Begin: Loading essential drivers ... done.                             =
        =20
> Begin: Running /scripts/init-premount ... done.                        =
        =20
> Begin: Mounting root file system ... Begin: Running /scripts/local-top =
... done.
> Begin: Running /scripts/local-premount ... done.                       =
        =20
> Begin: Checking root file system ... fsck from util-linux 2.26.2       =
        =20
> ROOT: clean, 128634/4341760 files, 3291642/17343502 blocks             =
        =20
> done.                                                                  =
        =20
> kjournald starting.  Commit interval 5 seconds                         =
        =20
> EXT3-fs (sda4): mounted filesystem with writeback data mode            =
        =20
> done.                                                                  =
        =20
> Begin: Running /scripts/local-bottom ... done.                         =
        =20
> Begin: Running /scripts/init-bottom ... done.                          =
        =20
> INIT: version 2.88 booting                                             =
        =20
> [info] Using makefile-style concurrent boot in runlevel S.             =
        =20
> [....] Starting the hotplug events dispatcher: systemd-udevdstarting =
version 226
> . ok                                                                   =
        =20
> [....] Synthesizing the initial hotplug events...done.                 =
        =20
> [....] Waiting for /dev to be fully populated...sd 4:0:0:0: Attached =
scsi gener0
> sd 4:0:2:0: Attached scsi generic sg1 type 0                           =
        =20
> sd 3:0:0:0: Attached scsi generic sg2 type 0                           =
        =20
> scsi_id(1192): unaligned access to 0x00000000faeeb009 at =
ip=3D0x00000000410039a7 =20
> scsi_id(1193): unaligned access to 0x00000000faa1f009 at =
ip=3D0x00000000410039a7=20
>=20
> The above is with 4.0.8+.


I no longer think the panic had anything to do with unaligned accesses.

Attached is disassembly of blk_rq_map_sg in blk-merge.o.  The error is =
here:

 300:   e8 00 a0 00     b,l 308 <blk_rq_map_sg+0x308>,rp
 304:   08 1b 02 44     copy dp,r4
 308:   08 04 02 5b     copy r4,dp
 30c:   08 1c 02 4a     copy ret0,r10
 310:   0d 40 10 dc     ldd 0(r10),ret0

The call at 300 appears to be a call to sg_next:

Relocation section '.rela.text.blk_rq_map_sg' at offset 0x3d08 contains =
14 entries:
  Offset          Info           Type           Sym. Value    Sym. Name =
+ Addend
00000000015c  002300000022 R_PARISC_DLTIND21 0000000000000000 node_data =
+ 0
000000000168  000700000022 R_PARISC_DLTIND21 0000000000000001 =
__warned.22406 + 0
000000000178  002000000022 R_PARISC_DLTIND21 0000000000000000 .LC0 + 0
000000000204  002300000026 R_PARISC_DLTIND14 0000000000000000 node_data =
+ 0
000000000300  00300000004a R_PARISC_PCREL22F 0000000000000000 sg_next + =
0
0000000003a8  00300000004a R_PARISC_PCREL22F 0000000000000000 sg_next + =
0
0000000003e0  003100000022 R_PARISC_DLTIND21 0000000000000000 pfnnid_map =
+ 0
0000000003e4  003100000026 R_PARISC_DLTIND14 0000000000000000 pfnnid_map =
+ 0
0000000003f8  002300000022 R_PARISC_DLTIND21 0000000000000000 node_data =
+ 0
0000000003fc  002300000026 R_PARISC_DLTIND14 0000000000000000 node_data =
+ 0
000000000574  000700000026 R_PARISC_DLTIND14 0000000000000001 =
__warned.22406 + 0
000000000588  002000000026 R_PARISC_DLTIND14 0000000000000000 .LC0 + 0
000000000590  00240000004a R_PARISC_PCREL22F 0000000000000000 printk + 0
0000000005bc  00320000004a R_PARISC_PCREL22F 0000000000000000 memset + 0

The result of the call ret0 is copied to r10 and then we get page fault =
executing ldd 0(r10),ret0.

Probably, we are in this block of code:

        if (q->dma_drain_size && q->dma_drain_needed(rq)) {
                if (rq->cmd_flags & REQ_WRITE)
                        memset(q->dma_drain_buffer, 0, =
q->dma_drain_size);

                sg_unmark_end(sg);
                sg =3D sg_next(sg);
                sg_set_page(sg, virt_to_page(q->dma_drain_buffer),
                            q->dma_drain_size,
                            ((unsigned long)q->dma_drain_buffer) &
                            (PAGE_SIZE - 1));
                nsegs++;
                rq->extra_len +=3D q->dma_drain_size;
        }


Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-21-9557822
Content-Disposition: attachment;
	filename=blk_rq_map_sg.dis.txt
Content-Type: text/plain;
	name="blk_rq_map_sg.dis.txt"
Content-Transfer-Encoding: 7bit

Disassembly of section .text.blk_rq_map_sg:

0000000000000000 <blk_rq_map_sg>:
   0:   08 03 02 41     copy r3,r1
   4:   0f c2 12 c1     std rp,-10(sp)
   8:   08 1e 02 43     copy sp,r3
   c:   73 c1 02 68     std,ma r1,130(sp)
  10:   70 72 00 80     std r18,40(r3)
  14:   08 19 02 52     copy r25,r18
  18:   70 71 00 90     std r17,48(r3)
  1c:   08 1a 02 51     copy r26,r17
  20:   70 70 00 a0     std r16,50(r3)
  24:   70 6f 00 b0     std r15,58(r3)
  28:   70 6e 00 c0     std r14,60(r3)
  2c:   70 6d 00 d0     std r13,68(r3)
  30:   70 6c 00 e0     std r12,70(r3)
  34:   70 6b 00 f0     std r11,78(r3)
  38:   70 6a 01 00     std r10,80(r3)
  3c:   70 69 01 10     std r9,88(r3)
  40:   70 68 01 20     std r8,90(r3)
  44:   70 67 01 30     std r7,98(r3)
  48:   70 66 01 40     std r6,a0(r3)
  4c:   70 65 01 50     std r5,a8(r3)
  50:   70 64 01 60     std r4,b0(r3)
  54:   53 2b 00 d0     ldd 68(r25),r11
  58:   9d 60 28 20     cmpb,*= r0,r11,470 <blk_rq_map_sg+0x470>
  5c:   08 18 02 50     copy r24,r16
  60:   51 7c 00 30     ldd 18(r11),ret0
  64:   c7 1c c1 b8     bb,*>= ret0,18,148 <blk_rq_map_sg+0x148>
  68:   43 49 0b 58     ldb 5ac(r26),r9
  6c:   45 7c 00 c0     ldh 60(r11),ret0
  70:   87 80 27 f2     cmpib,=,n 0,ret0,470 <blk_rq_map_sg+0x470>
  74:   51 77 00 d0     ldd 68(r11),r23
  78:   49 7f 00 58     ldw 2c(r11),r31
  7c:   f3 ff 10 84     depd,z,* r31,59,60,r31
  80:   0b f7 0a 18     add,l r23,r31,r24
  84:   0f 10 10 95     ldw 8(r24),r21
  88:   49 73 00 60     ldw 30(r11),r19
  8c:   0a 75 04 14     sub r21,r19,r20
  90:   0f 18 10 95     ldw c(r24),r21
  94:   49 76 00 50     ldw 28(r11),r22
  98:   0a 75 0a 13     add,l r21,r19,r19
  9c:   0e 00 10 dc     ldd 0(r16),ret0
  a0:   0f f7 00 df     ldd r23(r31),r31
  a4:   db f5 0b fe     extrd,u,* r31,63,2,r21
  a8:   0a 96 b8 80     cmpclr,>> r22,r20,r0
  ac:   08 16 02 54     copy r22,r20
  b0:   be a0 27 88     cmpb,*<> r0,r21,47c <blk_rq_map_sg+0x47c>
  b4:   db 9c 0b fe     extrd,u,* ret0,63,2,ret0
  b8:   0b 9f 02 5c     or r31,ret0,ret0
  bc:   0e 13 12 90     stw r19,8(r16)
  c0:   34 0e 00 02     ldi 1,r14
  c4:   0e 1c 12 c0     std ret0,0(r16)
  c8:   0e 14 12 98     stw r20,c(r16)
  cc:   52 5c 00 80     ldd 40(r18),ret0
  d0:   db 80 cc 9f     extrd,s,*>= ret0,36,1,r0
  d4:   e8 00 08 72     b,l,n 514 <blk_rq_map_sg+0x514>,r0
  d8:   4a 3c 09 88     ldw 4c4(r17),ret0
  dc:   8f 80 25 08     cmpib,<> 0,ret0,368 <blk_rq_map_sg+0x368>
  e0:   08 1b 02 44     copy dp,r4
  e4:   9e 00 20 1a     cmpb,*=,n r0,r16,f8 <blk_rq_map_sg+0xf8>
  e8:   0e 00 10 dc     ldd 0(r16),ret0
  ec:   f7 80 04 1f     depdi,* 0,63,1,ret0
  f0:   f7 9f 04 3f     depdi,* -1,62,1,ret0
  f4:   0e 1c 12 c0     std ret0,0(r16)
  f8:   08 0e 02 5c     copy r14,ret0
  fc:   0c 61 10 c2     ldd -10(r3),rp
 100:   50 72 00 80     ldd 40(r3),r18
 104:   50 71 00 90     ldd 48(r3),r17
 108:   50 70 00 a0     ldd 50(r3),r16
 10c:   50 6f 00 b0     ldd 58(r3),r15
 110:   50 6e 00 c0     ldd 60(r3),r14
 114:   50 6d 00 d0     ldd 68(r3),r13
 118:   50 6c 00 e0     ldd 70(r3),r12
 11c:   50 6b 00 f0     ldd 78(r3),r11
 120:   50 6a 01 00     ldd 80(r3),r10
 124:   50 69 01 10     ldd 88(r3),r9
 128:   50 68 01 20     ldd 90(r3),r8
 12c:   50 67 01 30     ldd 98(r3),r7
 130:   50 66 01 40     ldd a0(r3),r6
 134:   50 65 01 50     ldd a8(r3),r5
 138:   50 64 01 60     ldd b0(r3),r4
 13c:   34 7e 00 80     ldo 40(r3),sp
 140:   e8 40 d0 00     bve (rp)
 144:   53 c3 3f 8d     ldd,mb -40(sp),r3
 148:   c6 dc 5e 57     bb,*<,n ret0,16,78 <blk_rq_map_sg+0x78>
 14c:   51 77 00 d0     ldd 68(r11),r23
 150:   37 c1 3f a1     ldo -30(sp),r1
 154:   0c 61 12 d0     std r1,8(r3)
 158:   34 0a 00 00     ldi 0,r10
 15c:   2b 60 00 00     addil L%0,dp,r1
 160:   70 61 00 20     std r1,10(r3)
 164:   34 04 00 00     ldi 0,r4
 168:   2b 60 00 00     addil L%0,dp,r1
 16c:   34 1d 00 00     ldi 0,ret1
 170:   70 61 00 40     std r1,20(r3)
 174:   34 1f 00 00     ldi 0,r31
 178:   2b 60 00 00     addil L%0,dp,r1
 17c:   70 79 00 60     std r25,30(r3)
 180:   34 0e 00 00     ldi 0,r14
 184:   70 61 00 50     std r1,28(r3)
 188:   70 78 00 30     std r24,18(r3)
 18c:   49 6d 00 58     ldw 2c(r11),r13
 190:   49 65 00 50     ldw 28(r11),r5
 194:   f0 cd 10 84     depd,z,* r13,59,60,r6
 198:   9c a0 27 70     cmpb,*= r0,r5,558 <blk_rq_map_sg+0x558>
 19c:   49 67 00 60     ldw 30(r11),r7
 1a0:   51 73 00 d0     ldd 68(r11),r19
 1a4:   08 d3 0a 1c     add,l r19,r6,ret0
 1a8:   0c d3 00 cf     ldd r19(r6),r15
 1ac:   0f 98 10 94     ldw c(ret0),r20
 1b0:   0f 90 10 93     ldw 8(ret0),r19
 1b4:   08 f4 0a 08     add,l r20,r7,r8
 1b8:   08 f3 04 13     sub r19,r7,r19
 1bc:   d9 10 0b e0     extrd,u,* r8,63,32,r16
 1c0:   08 13 02 4c     copy r19,r12
 1c4:   09 85 b8 80     cmpclr,>> r5,r12,r0
 1c8:   08 05 02 4c     copy r5,r12
 1cc:   9d 40 26 30     cmpb,*= r0,r10,4ec <blk_rq_map_sg+0x4ec>
 1d0:   d9 92 0b e0     extrd,u,* r12,63,32,r18
 1d4:   9d 20 22 22     cmpb,*=,n r0,r9,2ec <blk_rq_map_sg+0x2ec>
 1d8:   0d 58 10 96     ldw c(r10),r22
 1dc:   4a 3c 0a f8     ldw 57c(r17),ret0
 1e0:   09 96 0a 16     add,l r22,r12,r22
 1e4:   8b 96 a2 02     cmpb,>>,n r22,ret0,2ec <blk_rq_map_sg+0x2ec>
 1e8:   0f e0 10 d5     ldd 0(r31),r21
 1ec:   0d e0 10 dc     ldd 0(r15),ret0
 1f0:   da b8 00 5d     extrd,u,* r21,2,3,r24
 1f4:   db 9c 00 5d     extrd,u,* ret0,2,3,ret0
 1f8:   f3 3c 10 63     depd,z,* ret0,60,61,r25
 1fc:   50 61 00 20     ldd 10(r3),r1
 200:   f2 b8 10 63     depd,z,* r24,60,61,r21
 204:   50 37 00 00     ldd 0(r1),r23
 208:   0b 15 04 15     sub r21,r24,r21
 20c:   f2 b5 10 63     depd,z,* r21,60,61,r21
 210:   0b 15 04 15     sub r21,r24,r21
 214:   0b 99 04 18     sub r25,ret0,r24
 218:   f2 b5 10 c6     depd,z,* r21,57,58,r21
 21c:   36 b9 1a 40     ldo d20(r21),r25
 220:   0f 37 00 d9     ldd r23(r25),r25
 224:   0b 3f 04 1f     sub r31,r25,r31
 228:   db ff 1f 83     extrd,s,* r31,60,61,r31
 22c:   f3 3f 10 63     depd,z,* r31,60,61,r25
 230:   0b f9 04 19     sub r25,r31,r25
 234:   f3 39 10 84     depd,z,* r25,59,60,r25
 238:   0b f9 0a 19     add,l r25,r31,r25
 23c:   0b f9 0a 99     shladd,l r25,2,r31,r25
 240:   f0 59 10 a5     depd,z,* r25,58,59,rp
 244:   f3 18 10 63     depd,z,* r24,60,61,r24
 248:   36 b5 1a 60     ldo d30(r21),r21
 24c:   0e b7 00 da     ldd r23(r21),r26
 250:   0b 22 04 19     sub rp,r25,r25
 254:   f0 59 11 ef     depd,z,* r25,48,49,rp
 258:   08 59 0a 19     add,l r25,rp,r25
 25c:   0b 98 04 1c     sub r24,ret0,ret0
 260:   f0 59 13 de     depd,z,* r25,33,34,rp
 264:   f3 9c 10 c6     depd,z,* ret0,57,58,ret0
 268:   08 59 0a 02     add,l r25,rp,rp
 26c:   37 95 1a 40     ldo d20(ret0),r21
 270:   0e b7 00 d5     ldd r23(r21),r21
 274:   37 9c 1a 60     ldo d30(ret0),ret0
 278:   0a af 04 15     sub r15,r21,r21
 27c:   0f 97 00 dc     ldd r23(ret0),ret0
 280:   da b5 1f 83     extrd,s,* r21,60,61,r21
 284:   f3 15 10 63     depd,z,* r21,60,61,r24
 288:   0a b8 04 18     sub r24,r21,r24
 28c:   f3 18 10 84     depd,z,* r24,59,60,r24
 290:   0a b8 0a 18     add,l r24,r21,r24
 294:   0a b8 0a 98     shladd,l r24,2,r21,r24
 298:   f0 38 10 a5     depd,z,* r24,58,59,r1
 29c:   0b 01 04 18     sub r1,r24,r24
 2a0:   f3 38 11 ef     depd,z,* r24,48,49,r25
 2a4:   0b e2 0a 42     shladd,l rp,1,r31,rp
 2a8:   0b 38 0a 18     add,l r24,r25,r24
 2ac:   f0 42 10 63     depd,z,* rp,60,61,rp
 2b0:   f3 38 13 de     depd,z,* r24,33,34,r25
 2b4:   0b e2 04 02     sub rp,r31,rp
 2b8:   0b 38 0a 1f     add,l r24,r25,r31
 2bc:   0b 42 0a 1a     add,l rp,r26,r26
 2c0:   0a bf 0a 5f     shladd,l r31,1,r21,r31
 2c4:   f3 5a 11 8c     depd,z,* r26,51,52,r26
 2c8:   f3 ff 10 63     depd,z,* r31,60,61,r31
 2cc:   08 9a 0a 04     add,l r26,r4,r4
 2d0:   0a bf 04 15     sub r31,r21,r21
 2d4:   0b a4 0a 1d     add,l r4,ret1,ret1
 2d8:   0b 95 0a 15     add,l r21,ret0,r21
 2dc:   f3 95 11 8c     depd,z,* r21,51,52,ret0
 2e0:   0b 90 0a 1c     add,l r16,ret0,ret0
 2e4:   9f bc 24 10     cmpb,*= ret0,ret1,4f4 <blk_rq_map_sg+0x4f4>
 2e8:   36 5f 3f ff     ldo -1(r18),r31
 2ec:   0d 40 10 dc     ldd 0(r10),ret0
 2f0:   f7 80 04 3f     depdi,* 0,62,1,ret0
 2f4:   08 0a 02 5a     copy r10,r26
 2f8:   0d 5c 12 c0     std ret0,0(r10)
 2fc:   0c 70 10 dd     ldd 8(r3),ret1
 300:   e8 00 a0 00     b,l 308 <blk_rq_map_sg+0x308>,rp
 304:   08 1b 02 44     copy dp,r4
 308:   08 04 02 5b     copy r4,dp
 30c:   08 1c 02 4a     copy ret0,r10
 310:   0d 40 10 dc     ldd 0(r10),ret0
 314:   d9 ff 0b fe     extrd,u,* r15,63,2,r31
 318:   bf e0 22 b8     cmpb,*<> r0,r31,47c <blk_rq_map_sg+0x47c>
 31c:   db 9c 0b fe     extrd,u,* ret0,63,2,ret0
 320:   0b 8f 02 5c     or r15,ret0,ret0
 324:   35 ce 00 02     ldo 1(r14),r14
 328:   0d 5c 12 c0     std ret0,0(r10)
 32c:   0d 48 12 90     stw r8,8(r10)
 330:   d9 ce 0f e0     extrd,s,* r14,63,32,r14
 334:   0d 4c 12 98     stw r12,c(r10)
 338:   51 7c 00 30     ldd 18(r11),ret0
 33c:   34 1f 05 00     ldi 280,r31
 340:   0b fc 02 1c     and ret0,r31,ret0
 344:   9f 80 22 6a     cmpb,*=,n r0,ret0,480 <blk_rq_map_sg+0x480>
 348:   09 85 04 05     sub r5,r12,r5
 34c:   d8 a5 0b e0     extrd,u,* r5,63,32,r5
 350:   9c a0 23 e8     cmpb,*= r0,r5,54c <blk_rq_map_sg+0x54c>
 354:   f0 cd 10 84     depd,z,* r13,59,60,r6
 358:   08 12 02 5d     copy r18,ret1
 35c:   08 10 02 44     copy r16,r4
 360:   e8 1f 1c 75     b,l 1a0 <blk_rq_map_sg+0x1a0>,r0
 364:   08 0f 02 5f     copy r15,r31
 368:   52 3c 01 70     ldd b8(r17),ret0
 36c:   08 12 02 5a     copy r18,r26
 370:   37 dd 3f a1     ldo -30(sp),ret1
 374:   53 82 00 20     ldd 10(ret0),rp
 378:   e8 40 f0 00     bve,l (rp),rp
 37c:   53 9b 00 30     ldd 18(ret0),dp
 380:   9f 80 3a bd     cmpb,*= r0,ret0,e4 <blk_rq_map_sg+0xe4>
 384:   08 04 02 5b     copy r4,dp
 388:   52 5c 00 80     ldd 40(r18),ret0
 38c:   c7 fc 44 38     bb,*< ret0,1f,5b0 <blk_rq_map_sg+0x5b0>
 390:   34 19 00 00     ldi 0,r25
 394:   0e 00 10 dc     ldd 0(r16),ret0
 398:   f7 80 04 3f     depdi,* 0,62,1,ret0
 39c:   08 10 02 5a     copy r16,r26
 3a0:   0e 1c 12 c0     std ret0,0(r16)
 3a4:   37 dd 3f a1     ldo -30(sp),ret1
 3a8:   e8 00 a0 00     b,l 3b0 <blk_rq_map_sg+0x3b0>,rp
 3ac:   08 1b 02 44     copy dp,r4
 3b0:   52 34 09 90     ldd 4c8(r17),r20
 3b4:   08 1c 02 50     copy ret0,r16
 3b8:   f7 fe 0a 1c     depdi,z,* f,15,4,r31
 3bc:   23 80 08 01     ldil L%-40000000,ret0
 3c0:   0b 94 0a 1c     add,l r20,ret0,ret0
 3c4:   db 93 1a 6c     extrd,u,* ret0,51,52,r19
 3c8:   0b f3 02 15     and r19,r31,r21
 3cc:   9e bf 23 f0     cmpb,*= r31,r21,5cc <blk_rq_map_sg+0x5cc>
 3d0:   08 04 02 5b     copy r4,dp
 3d4:   db 9c 08 20     extrd,u,* ret0,33,32,ret0
 3d8:   34 1f 03 fe     ldi 1ff,r31
 3dc:   83 9f 83 e0     cmpb,<< r31,ret0,5d4 <blk_rq_map_sg+0x5d4>
 3e0:   2b 60 00 00     addil L%0,dp,r1
 3e4:   50 3f 00 00     ldd 0(r1),r31
 3e8:   0f 9f 00 1c     ldb r31(ret0),ret0
 3ec:   db 9f 0f f8     extrd,s,* ret0,63,8,r31
 3f0:   0e 00 10 d5     ldd 0(r16),r21
 3f4:   f3 9f 10 63     depd,z,* r31,60,61,ret0
 3f8:   2b 60 00 00     addil L%0,dp,r1
 3fc:   50 37 00 00     ldd 0(r1),r23
 400:   0b fc 04 1c     sub ret0,r31,ret0
 404:   f3 9c 10 63     depd,z,* ret0,60,61,ret0
 408:   4a 38 09 88     ldw 4c4(r17),r24
 40c:   0b fc 04 1c     sub ret0,r31,ret0
 410:   f3 9c 10 c6     depd,z,* ret0,57,58,ret0
 414:   37 9f 1a 40     ldo d20(ret0),r31
 418:   37 9c 1a 60     ldo d30(ret0),ret0
 41c:   0f f7 00 df     ldd r23(r31),r31
 420:   0f 97 00 dc     ldd r23(ret0),ret0
 424:   da b6 0b fe     extrd,u,* r21,63,2,r22
 428:   0b 93 04 13     sub r19,ret0,r19
 42c:   f2 b3 10 63     depd,z,* r19,60,61,r21
 430:   0a 75 04 13     sub r21,r19,r19
 434:   0b f3 0a dc     shladd,l r19,3,r31,ret0
 438:   db 9f 0b fe     extrd,u,* ret0,63,2,r31
 43c:   bf e0 20 70     cmpb,*<> r0,r31,47c <blk_rq_map_sg+0x47c>
 440:   d2 94 1b f4     extrw,u r20,31,12,r20
 444:   0e 14 12 90     stw r20,8(r16)
 448:   0b 96 02 5c     or r22,ret0,ret0
 44c:   35 ce 00 02     ldo 1(r14),r14
 450:   0e 1c 12 c0     std ret0,0(r16)
 454:   d9 ce 0f e0     extrd,s,* r14,63,32,r14
 458:   0e 18 12 98     stw r24,c(r16)
 45c:   4a 5f 02 18     ldw 10c(r18),r31
 460:   4a 3c 09 88     ldw 4c4(r17),ret0
 464:   0b 9f 0a 1c     add,l r31,ret0,ret0
 468:   e8 1f 18 ed     b,l e4 <blk_rq_map_sg+0xe4>,r0
 46c:   6a 5c 02 18     stw ret0,10c(r18)
 470:   34 10 00 00     ldi 0,r16
 474:   e8 1f 18 a5     b,l cc <blk_rq_map_sg+0xcc>,r0
 478:   34 0e 00 00     ldi 0,r14
 47c:   03 ff e0 1f     break 1f,1fff
 480:   81 85 81 d0     cmpb,<< r5,r12,570 <blk_rq_map_sg+0x570>
 484:   51 75 00 d0     ldd 68(r11),r21
 488:   9e 40 3d 95     cmpb,*= r0,r18,358 <blk_rq_map_sg+0x358>
 48c:   08 12 02 54     copy r18,r20
 490:   e8 00 00 18     b,l 4a4 <blk_rq_map_sg+0x4a4>,r0
 494:   08 14 02 53     copy r20,r19
 498:   9e 80 3d 65     cmpb,*= r0,r20,350 <blk_rq_map_sg+0x350>
 49c:   08 14 02 53     copy r20,r19
 4a0:   f0 cd 10 84     depd,z,* r13,59,60,r6
 4a4:   08 d5 0a 06     add,l r21,r6,r6
 4a8:   0c d0 10 9f     ldw 8(r6),r31
 4ac:   0a 65 b8 80     cmpclr,>> r5,r19,r0
 4b0:   08 05 02 53     copy r5,r19
 4b4:   08 ff 04 1c     sub r31,r7,ret0
 4b8:   0b 93 b8 80     cmpclr,>> r19,ret0,r0
 4bc:   08 13 02 5c     copy r19,ret0
 4c0:   0b 94 04 14     sub r20,ret0,r20
 4c4:   0b 85 04 05     sub r5,ret0,r5
 4c8:   da 94 0b e0     extrd,u,* r20,63,32,r20
 4cc:   08 fc 0a 1c     add,l ret0,r7,ret0
 4d0:   d8 a5 0b e0     extrd,u,* r5,63,32,r5
 4d4:   8b fc 3f 7d     cmpb,<> ret0,r31,498 <blk_rq_map_sg+0x498>
 4d8:   db 87 0b e0     extrd,u,* ret0,63,32,r7
 4dc:   35 ad 00 02     ldo 1(r13),r13
 4e0:   34 07 00 00     ldi 0,r7
 4e4:   e8 1f 1f 5d     b,l 498 <blk_rq_map_sg+0x498>,r0
 4e8:   d9 ad 0b e0     extrd,u,* r13,63,32,r13
 4ec:   e8 1f 1c 3d     b,l 310 <blk_rq_map_sg+0x310>,r0
 4f0:   50 6a 00 30     ldd 18(r3),r10
 4f4:   52 3c 0a c0     ldd 560(r17),ret0
 4f8:   0b 84 02 44     or r4,ret0,r4
 4fc:   0b bf 0a 1d     add,l r31,ret1,ret1
 500:   0b 9d 02 5d     or ret1,ret0,ret1
 504:   bc 9d 3b cf     cmpb,*<>,n ret1,r4,2f0 <blk_rq_map_sg+0x2f0>
 508:   0d 40 10 dc     ldd 0(r10),ret0
 50c:   e8 1f 1c 4d     b,l 338 <blk_rq_map_sg+0x338>,r0
 510:   0d 56 12 98     stw r22,c(r10)
 514:   4a 5c 00 b8     ldw 5c(r18),ret0
 518:   4a 3f 09 a0     ldw 4d0(r17),r31
 51c:   0b fc 02 13     and ret0,r31,r19
 520:   86 60 37 6f     cmpib,=,n 0,r19,dc <blk_rq_map_sg+0xdc>
 524:   4a 3c 09 88     ldw 4c4(r17),ret0
 528:   0e 18 10 93     ldw c(r16),r19
 52c:   0b 9f 00 1c     andcm r31,ret0,ret0
 530:   37 9c 00 02     ldo 1(ret0),ret0
 534:   0b 93 0a 1f     add,l r19,ret0,r31
 538:   0e 1f 12 98     stw r31,c(r16)
 53c:   4a 5f 02 18     ldw 10c(r18),r31
 540:   0b 9f 0a 1c     add,l r31,ret0,ret0
 544:   e8 1f 17 1d     b,l d8 <blk_rq_map_sg+0xd8>,r0
 548:   6a 5c 02 18     stw ret0,10c(r18)
 54c:   08 12 02 5d     copy r18,ret1
 550:   08 10 02 44     copy r16,r4
 554:   08 0f 02 5f     copy r15,r31
 558:   0d 60 10 cb     ldd 0(r11),r11
 55c:   bd 60 38 5f     cmpb,*<>,n r0,r11,190 <blk_rq_map_sg+0x190>
 560:   49 6d 00 58     ldw 2c(r11),r13
 564:   50 72 00 60     ldd 30(r3),r18
 568:   e8 1f 16 bd     b,l cc <blk_rq_map_sg+0xcc>,r0
 56c:   08 0a 02 50     copy r10,r16
 570:   50 61 00 40     ldd 20(r3),r1
 574:   50 28 00 00     ldd 0(r1),r8
 578:   0d 00 10 1c     ldb 0(r8),ret0
 57c:   8f 80 3e 0d     cmpib,<> 0,ret0,488 <blk_rq_map_sg+0x488>
 580:   50 61 00 50     ldd 28(r3),r1
 584:   08 1b 02 44     copy dp,r4
 588:   50 3a 00 00     ldd 0(r1),r26
 58c:   0c 70 10 dd     ldd 8(r3),ret1
 590:   e8 00 a0 00     b,l 598 <blk_rq_map_sg+0x598>,rp
 594:   70 75 00 70     std r21,38(r3)
 598:   08 04 02 5b     copy r4,dp
 59c:   03 ff e0 1f     break 1f,1fff
 5a0:   34 1c 00 02     ldi 1,ret0
 5a4:   0d 1c 12 00     stb ret0,0(r8)
 5a8:   e8 1f 1d b5     b,l 488 <blk_rq_map_sg+0x488>,r0
 5ac:   50 75 00 70     ldd 38(r3),r21
 5b0:   08 1b 02 44     copy dp,r4
 5b4:   52 3a 09 90     ldd 4c8(r17),r26
 5b8:   37 dd 3f a1     ldo -30(sp),ret1
 5bc:   e8 00 a0 00     b,l 5c4 <blk_rq_map_sg+0x5c4>,rp
 5c0:   4a 38 09 88     ldw 4c4(r17),r24
 5c4:   e8 1f 1b 95     b,l 394 <blk_rq_map_sg+0x394>,r0
 5c8:   08 04 02 5b     copy r4,dp
 5cc:   e8 1f 1c 3d     b,l 3f0 <blk_rq_map_sg+0x3f0>,r0
 5d0:   34 1f 00 00     ldi 0,r31
 5d4:   03 ff e0 1f     break 1f,1fff

--Apple-Mail-21-9557822--
