From: j.raspe@t-online.de (Johannes Raspe)
Subject: Framebuffer broken on 735/125 with 2.6-kernels (was: No 2.6 kernel on 735/125 with CRX24?)
Date: Wed, 29 Sep 2004 20:58:49 +0200
Message-ID: <200409292058.49375.j.raspe@t-online.de>
References: <4152E64500001B86@mail-3-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_pXwWBRBPUSNsQsv"
Cc: deller@gmx.de
To: parisc-linux@parisc-linux.org
Return-Path: <j.raspe@t-online.de>
In-Reply-To: <4152E64500001B86@mail-3-bnl.tiscali.it>
List-ID: <linux-parisc.vger.kernel.org>

--Boundary-00=_pXwWBRBPUSNsQsv
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

after many tries with many different kernels I got back to kernel-version 
2.6.0-pa6 checked out from cvs.
With this kernel I get the same result as with all other 2.6-kernels: a blue 
screen and a hanging machine after the initalisation of the fb-device.
But with this kernel I got a stack-dump which I appended in a txt-file.

I don't know if this dump is very useful, because when I configure the kernel 
without support for fb-device the kernel gives errors too, but the screen 
does not turn blue and the machine does not hang immediately.

After all this I checked out the "/drivers/video" directory from  Sun Sep 28 
02:27:21 2003 (this was version 1.4.2.1 of stifb.c, before the 
Precisionbook-corrections) and replaced the original 2.6.0-pa6 
"drivers/video" directory with the older one.
The kernel compiled cleanly but he symptomps were the same as above (stack 
dump appended as "output-2.6.0-pa6-with_old_video_directory.txt"), which 
brings me to the conclusion that the fb-device on my 735/125 (CRX24) broke 
with the transition from the 2.4 (I actually use 2.4.27-pa4) to the 2.6 
kernel-series.

Without "CONFIG_FB" 2.6.4 and the latest 2.6.9 boot cleanly.

Regards

Johannes
-- 
Johannes Raspe - j.raspe@t-online.de
GnuPG-Key ID: D342E105
Fingerprint: D681 F800 FB2D 913E D14C 1F17 C3DB B1F1 D342 E105

--Boundary-00=_pXwWBRBPUSNsQsv
Content-Type: text/plain;
  charset="iso-8859-15";
  name="output-2.6.0-pa6.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="output-2.6.0-pa6.txt"

Command line for kernel: 'root=/dev/sda6 HOME=/ console=ttyS0 TERM=vt102 palo_k'
Selected kernel: /vmlinux-2.6.0 from partition 2
ELF32 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 2130833 mediaptr 0x1000
Segment 1 load 0030a000 size 356536 mediaptr 0x20a000
Segment 2 load 00364000 size 192645 mediaptr 0x262000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.0-pa6 (johio@APOLLO) (gcc-Version 3.3.4 (Debian 1:3.3.4-12)) 4
FP[0] enabled: Rev 1 Model 9
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 00002060 00000481 00000000 00000000 77584fb0 ffffffff 00000004 0000000a 0a
vers  00000015
model 9000/735
Total Memory: 272 Mb
On node 0 totalpages: 69632
  DMA zone: 69632 pages, LIFO batch:16
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Building zonelist for node : 0
Kernel command line: root=/dev/sda6 HOME=/ console=ttyS0 TERM=vt102 palo_kernel0
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x128
Memory: 272636k available
Calibrating delay loop... 124.51 BogoMIPS
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
POSIX conformance testing by UNIFIX
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Coral SGC Graphics at 0xf8000000 [1] { 10, 0x0, 0x004, 0x00077 }
2. Outfield Core BA at 0xf082f000 [2] { 11, 0x0, 0x009, 0x00070 }
3. Outfield Core SCSI at 0xf0825000 [2/0/1] { 10, 0x0, 0x009, 0x00071 }
4. Outfield Core LAN (802.3) at 0xf0826000 [2/0/2] { 10, 0x0, 0x009, 0x00072 }
5. Outfield Core HIL at 0xf0821000 [2/0/3] { 10, 0x0, 0x009, 0x00073 }
6. Outfield Core RS-232 at 0xf0823000 [2/0/4] { 10, 0x0, 0x009, 0x00075 }
7. Outfield Core RS-232 at 0xf0822000 [2/0/5] { 10, 0x0, 0x009, 0x00075 }
8. Outfield Core Centronics at 0xf0824000 [2/0/6] { 10, 0x0, 0x009, 0x00074 }
9. Outfield FW SCSI at 0xf0830000 [2/0/7] { 10, 0x0, 0x009, 0x0007c }
10. Outfield Audio at 0xf1000000 [2/0/8] { 10, 0x0, 0x009, 0x0007f }
11. Cobra EISA BA at 0xfc000000 [4] { 11, 0x0, 0x004, 0x00076 }
12. Snake Cheetah (735/130) at 0xfffbe000 [8] { 0, 0x0, 0x206, 0x00004 }
13. Memory at 0xfffbf000 [9] { 1, 0x0, 0x037, 0x00009 }
CPU(s): 1 x PA7100 (PCX-T) at 125.000000 MHz
Cutoff version 4 at 0xf082f000 found.
LED (ASP-style) display at f0800020 registered
SCSI subsystem initialized
STI GSC/PCI core graphics driver Version 0.9a
    id 26d148ee-40a00499, conforms to spec rev. 8.02
    graphics card name: HPA1439A
fb0: stifb 1280x1024-32 frame buffer device, HPA1439A, id: 26d148ee, mmio: 0xf80
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Soft power switch support not available.

Stack Dump:
 10064a58:  10064a58 081a0245 6fc50080 2b602000
 10064a48:  22926000 6bc23fd9 22726000 e840c002
 10064a38:  0f131280 34130002 87002008 0f331280
 10064a28:  34130002 87202008 34370800 e81f1d05
 10064a18:  2b602000 341c3fff e81f1d9d 00000000
 10064a08:  100646c0 0000001a 0000001c 2b602000
 100649f8:  6bd43eb1 e81f1db5 6bd33ea1 10104684
 100649e8:  08930a13 4bd43eb1 4bd33ea1 08040258
 100649d8:  0000000f 10321ee0 0000000f 0000000e
 100649c8:  00000010 00000000 10321e04 08040259
 100649b8:  2b602000 86602028 49130220 1013d2cc
 100649a8:  4bd73eb1 888320a2 081c0244 d35a1ff0
 10064998:  e85f045d f9000000 ffffffff 10064508
 10064988:  00000020 4bd83ea1 343a0828 e85f0a25
 10064978:  08050257 08030259 2b602000 0ae30003
 10064968:  86c02030 0ab90403 0aa50415 0a930205
 10064958:  10321e04 10321ed0 0000000f 00000000
 10064948:  10321e04 00000000 10321e04 4bd83ea1
 10064938:  8f803f35 0806025a e85f1c75 1013d53c
 10064928:  4bd53eb1 8333a038 0b070419 d6740821
 10064918:  08180259 8e602028 0af80213 36973fff
 10064908:  0cc81094 4fc93f01 e840c000 4bc33f31
 100648f8:  4bc43f29 4bc53f21 4bc63f19 10109088
 100648e8:  4bc83f09 4bc23ed9 0938041c 08180254
 100648d8:  8b07bf45 10321e04 00000201 00000001
 100648c8:  10322140 106677b0 10321e04 37d93eb1
 100648b8:  0806025a 343a07a0 e85f0bbd 1013d53c
 100648a8:  08140258 2b602000 34370810 2b602000
 10064898:  10321e04 00000210 0000001c 00000000
 10064888:  0e742088 00000017 20ffaba0 20ffabac
 10064878:  00000020 000000d0 00000001 10255edc
 10064868:  10255ed8 00000000 00000000 00000000
 10064858:  00000000 00000000 00000000 00000000
 10064848:  00000000 00000000 00000000 00000000
 10064838:  41000000 00000000 40800000 00000000
 10064828:  40000000 00000000 40000000 fffffde0
 10064818:  41800000 00000000 40200000 00000000
 10064808:  40200000 00000000 40300000 00000000
 100647f8:  41000000 00000000 40800000 fffffde0
 100647e8:  fffffde0 00000000 41000000 fffffde0
 100647d8:  fffffde0 00000000 40800000 00000000
 100647c8:  41000000 fffffde0 fffffde0 00000000
 100647b8:  00000000 00000010 00000010 00000000
 100647a8:  41800000 00000000 00000000 00000000
 10064798:  00000000 ffffffff 7f7fffff ffffffff
 10064788:  7f7fffff fffffde0 fffffde0 00000000
 10064778:  000003c7 00000000 4471cccc 00000000
 10064768:  431c0000 00000000 42780000 00000000
 10064758:  00000000 00000000 00856606 00000000
 10064748:  00000000 00000000 08090800 10255d20
 10064738:  100646c0 00000000 00000500 1030a010
 10064728:  00002000 00000000 00000000 00000000
 10064718:  00000000 00000000 00000007 00000000
 10064708:  ffffffff 00000000 00000000 00000200
 100646f8:  00000010 000000ff 10064508 00000000
 100646e8:  00000000 00000500 00002000 20f37000
 100646d8:  00000020 10064508 ffffffff f9000000
 100646c8:  1024b0c4 00000000 0004ff0f 103b7534
 100646b8:  00000020 000000d0 00000001 1024f48c
 100646a8:  00000001 00000000 20ff5bc0 10064548
 10064698:  10321e04 00000208 0000000f 00000000
 10064688:  10321e04 00000003 10321e04 20ffab38
 10064678:  00000060 000000d0 00000001 20e9c0a0
 10064668:  ffffffff 000000a0 20e38140 00000001

Kernel addresses on the stack:
 [<10104380>] parisc_terminate+0x60/0xb8
 [<10104684>] handle_interruption+0x2ac/0x5b0
 [<1013d2cc>] rmqueue_bulk+0x78/0xa4
 [<1013d53c>] buffered_rmqueue+0xd8/0x164
 [<10109088>] intr_check_sig+0x0/0xc
 [<1013d53c>] buffered_rmqueue+0xd8/0x164
 [<10255edc>] cfb_imageblit+0x24c/0x55c
 [<1024f48c>] move_buf_aligned+0x58/0x84
 [<1024b0c4>] putcs_aligned+0x18c/0x21c
 [<102547bc>] stifb_setcolreg+0xc4/0x118
 [<1024b4ec>] accel_putcs+0xac/0xd8
 [<102533c0>] fb_set_cmap+0xec/0x1b8
 [<10207a1c>] do_update_region+0x1e0/0x234
 [<102087b0>] redraw_screen+0x120/0x1b4
 [<10208680>] set_origin+0xb0/0xc0
 [<10208e38>] vc_resize+0x374/0x430
 [<10141130>] cache_alloc_refill+0x1b4/0x270
 [<1024bce4>] fbcon_set_display+0x3a0/0x7a4
 [<10208918>] visual_init+0xb0/0x124
 [<1020d02c>] take_over_console+0x1e0/0x244
 [<10126f44>] __tasklet_schedule+0x70/0x74
 [<103714c0>] fb_console_init+0x3c/0x4c
 [<1036e760>] vty_init+0xec/0x114
 [<1036dd80>] tty_init+0x22c/0x250
 [<1036da48>] rand_initialize+0x6c/0xfc
 [<10364fa4>] do_initcalls+0x58/0xdc
 [<101001d0>] init+0x28/0xd4
 [<10108c5c>] ret_from_kernel_thread+0x1c/0x24


Kernel Fault: Code=26 regs=100646c0 (Addr=0000001c)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 00000000 1024b0c4 f9000000
r04-07  ffffffff 10064508 00000020 20f37000
r08-11  00002000 00000500 00000000 00000000
r12-15  10064508 000000ff 00000010 00000200
r16-19  00000000 00000000 ffffffff 00000000
r20-23  00000007 00000000 00000000 00000000
r24-27  00000000 00000000 00002000 1030a010
r28-31  00000500 00000000 100646c0 10255d20
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10255ed8 10255edc
 IIR: 0e742088    ISR: 00000000  IOR: 0000001c
 CPU:        0   CR30: 10064000 CR31: 10359000
 ORIG_R28: 00000020
 IAOQ[0]: cfb_imageblit+0x248/0x55c
 IAOQ[1]: cfb_imageblit+0x24c/0x55c
 RP(r2): putcs_aligned+0x18c/0x21c

--Boundary-00=_pXwWBRBPUSNsQsv
Content-Type: text/plain;
  charset="iso-8859-15";
  name="output-2.6.0-pa6-with_old_video_directory.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="output-2.6.0-pa6-with_old_video_directory.txt"

Command line for kernel: 'root=/dev/sda6 HOME=/ console=ttyS0 TERM=vt102 palo_k'
Selected kernel: /vmlinux-2.6.0 from partition 2
ELF32 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 2130833 mediaptr 0x1000
Segment 1 load 0030a000 size 356536 mediaptr 0x20a000
Segment 2 load 00364000 size 192645 mediaptr 0x262000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.0-pa6 (johio@APOLLO) (gcc-Version 3.3.4 (Debian 1:3.3.4-12)) 4
FP[0] enabled: Rev 1 Model 9
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 00002060 00000481 00000000 00000000 77584fb0 ffffffff 00000004 0000000a 0a
vers  00000015
model 9000/735
Total Memory: 272 Mb
On node 0 totalpages: 69632
  DMA zone: 69632 pages, LIFO batch:16
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Building zonelist for node : 0
Kernel command line: root=/dev/sda6 HOME=/ console=ttyS0 TERM=vt102 palo_kernel0
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x128
Memory: 272636k available
Calibrating delay loop... 124.51 BogoMIPS
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
POSIX conformance testing by UNIFIX
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Coral SGC Graphics at 0xf8000000 [1] { 10, 0x0, 0x004, 0x00077 }
2. Outfield Core BA at 0xf082f000 [2] { 11, 0x0, 0x009, 0x00070 }
3. Outfield Core SCSI at 0xf0825000 [2/0/1] { 10, 0x0, 0x009, 0x00071 }
4. Outfield Core LAN (802.3) at 0xf0826000 [2/0/2] { 10, 0x0, 0x009, 0x00072 }
5. Outfield Core HIL at 0xf0821000 [2/0/3] { 10, 0x0, 0x009, 0x00073 }
6. Outfield Core RS-232 at 0xf0823000 [2/0/4] { 10, 0x0, 0x009, 0x00075 }
7. Outfield Core RS-232 at 0xf0822000 [2/0/5] { 10, 0x0, 0x009, 0x00075 }
8. Outfield Core Centronics at 0xf0824000 [2/0/6] { 10, 0x0, 0x009, 0x00074 }
9. Outfield FW SCSI at 0xf0830000 [2/0/7] { 10, 0x0, 0x009, 0x0007c }
10. Outfield Audio at 0xf1000000 [2/0/8] { 10, 0x0, 0x009, 0x0007f }
11. Cobra EISA BA at 0xfc000000 [4] { 11, 0x0, 0x004, 0x00076 }
12. Snake Cheetah (735/130) at 0xfffbe000 [8] { 0, 0x0, 0x206, 0x00004 }
13. Memory at 0xfffbf000 [9] { 1, 0x0, 0x037, 0x00009 }
CPU(s): 1 x PA7100 (PCX-T) at 125.000000 MHz
Cutoff version 4 at 0xf082f000 found.
LED (ASP-style) display at f0800020 registered
SCSI subsystem initialized
STI GSC/PCI core graphics driver Version 0.9a
    id 26d148ee-40a00499, conforms to spec rev. 8.02
    graphics card name: HPA1439A
fb0: stifb 1280x1024-32 frame buffer device, HPA1439A, id: 26d148ee, mmio: 0xf80
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Soft power switch support not available.

Stack Dump:
 10064a58:  10064a58 081a0245 6fc50080 2b602000
 10064a48:  22926000 6bc23fd9 22726000 e840c002
 10064a38:  0f131280 34130002 87002008 0f331280
 10064a28:  34130002 87202008 34370800 e81f1d05
 10064a18:  2b602000 341c3fff e81f1d9d 00000000
 10064a08:  100646c0 0000001a 0000001c 2b602000
 100649f8:  6bd43eb1 e81f1db5 6bd33ea1 10104684
 100649e8:  08930a13 4bd43eb1 4bd33ea1 08040258
 100649d8:  0000000f 10321ee0 0000000f 0000000e
 100649c8:  00000010 00000000 10321e04 08040259
 100649b8:  2b602000 86602028 49130220 1013d2cc
 100649a8:  4bd73eb1 888320a2 081c0244 d35a1ff0
 10064998:  e85f045d f9000000 ffffffff 10064508
 10064988:  00000020 4bd83ea1 343a0828 e85f0a25
 10064978:  08050257 08030259 2b602000 0ae30003
 10064968:  86c02030 0ab90403 0aa50415 0a930205
 10064958:  10321e04 10321ed0 0000000f 00000000
 10064948:  10321e04 00000000 10321e04 4bd83ea1
 10064938:  8f803f35 0806025a e85f1c75 1013d53c
 10064928:  4bd53eb1 8333a038 0b070419 d6740821
 10064918:  08180259 8e602028 0af80213 36973fff
 10064908:  0cc81094 4fc93f01 e840c000 4bc33f31
 100648f8:  4bc43f29 4bc53f21 4bc63f19 10109088
 100648e8:  4bc83f09 4bc23ed9 0938041c 08180254
 100648d8:  8b07bf45 10321e04 00000201 00000001
 100648c8:  10322140 106677b0 10321e04 37d93eb1
 100648b8:  0806025a 343a07a0 e85f0bbd 1013d53c
 100648a8:  08140258 2b602000 34370810 2b602000
 10064898:  10321e04 00000210 0000001c 00000000
 10064888:  0e742088 00000017 20ffaba0 20ffabac
 10064878:  00000020 000000d0 00000001 10255edc
 10064868:  10255ed8 00000000 00000000 00000000
 10064858:  00000000 00000000 00000000 00000000
 10064848:  00000000 00000000 00000000 00000000
 10064838:  41000000 00000000 40800000 00000000
 10064828:  40000000 00000000 40000000 fffffde0
 10064818:  41800000 00000000 40200000 00000000
 10064808:  40200000 00000000 40300000 00000000
 100647f8:  41000000 00000000 40800000 fffffde0
 100647e8:  fffffde0 00000000 41000000 fffffde0
 100647d8:  fffffde0 00000000 40800000 00000000
 100647c8:  41000000 fffffde0 fffffde0 00000000
 100647b8:  00000000 00000010 00000010 00000000
 100647a8:  41800000 00000000 00000000 00000000
 10064798:  00000000 ffffffff 7f7fffff ffffffff
 10064788:  7f7fffff fffffde0 fffffde0 00000000
 10064778:  000003c7 00000000 4471cccc 00000000
 10064768:  431c0000 00000000 42780000 00000000
 10064758:  00000000 00000000 00856606 00000000
 10064748:  00000000 00000000 08090800 10255d20
 10064738:  100646c0 00000000 00000500 1030a010
 10064728:  00002000 00000000 00000000 00000000
 10064718:  00000000 00000000 00000007 00000000
 10064708:  ffffffff 00000000 00000000 00000200
 100646f8:  00000010 000000ff 10064508 00000000
 100646e8:  00000000 00000500 00002000 20f37000
 100646d8:  00000020 10064508 ffffffff f9000000
 100646c8:  1024b0c4 00000000 0004ff0f 103b7534
 100646b8:  00000020 000000d0 00000001 1024f48c
 100646a8:  00000001 00000000 20ff5bc0 10064548
 10064698:  10321e04 00000208 0000000f 00000000
 10064688:  10321e04 00000003 10321e04 20ffab38
 10064678:  00000060 000000d0 00000001 20e9c0a0
 10064668:  ffffffff 000000a0 20e38140 00000001

Kernel addresses on the stack:
 [<10104380>] parisc_terminate+0x60/0xb8
 [<10104684>] handle_interruption+0x2ac/0x5b0
 [<1013d2cc>] rmqueue_bulk+0x78/0xa4
 [<1013d53c>] buffered_rmqueue+0xd8/0x164
 [<10109088>] intr_check_sig+0x0/0xc
 [<1013d53c>] buffered_rmqueue+0xd8/0x164
 [<10255edc>] cfb_imageblit+0x24c/0x55c
 [<1024f48c>] move_buf_aligned+0x58/0x84
 [<1024b0c4>] putcs_aligned+0x18c/0x21c
 [<102547bc>] stifb_setcolreg+0xc4/0x118
 [<1024b4ec>] accel_putcs+0xac/0xd8
 [<102533c0>] fb_set_cmap+0xec/0x1b8
 [<10207a1c>] do_update_region+0x1e0/0x234
 [<102087b0>] redraw_screen+0x120/0x1b4
 [<10208680>] set_origin+0xb0/0xc0
 [<10208e38>] vc_resize+0x374/0x430
 [<10141130>] cache_alloc_refill+0x1b4/0x270
 [<1024bce4>] fbcon_set_display+0x3a0/0x7a4
 [<10208918>] visual_init+0xb0/0x124
 [<1020d02c>] take_over_console+0x1e0/0x244
 [<10126f44>] __tasklet_schedule+0x70/0x74
 [<103714c0>] fb_console_init+0x3c/0x4c
 [<1036e760>] vty_init+0xec/0x114
 [<1036dd80>] tty_init+0x22c/0x250
 [<1036da48>] rand_initialize+0x6c/0xfc
 [<10364fa4>] do_initcalls+0x58/0xdc
 [<101001d0>] init+0x28/0xd4
 [<10108c5c>] ret_from_kernel_thread+0x1c/0x24


Kernel Fault: Code=26 regs=100646c0 (Addr=0000001c)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 00000000 1024b0c4 f9000000
r04-07  ffffffff 10064508 00000020 20f37000
r08-11  00002000 00000500 00000000 00000000
r12-15  10064508 000000ff 00000010 00000200
r16-19  00000000 00000000 ffffffff 00000000
r20-23  00000007 00000000 00000000 00000000
r24-27  00000000 00000000 00002000 1030a010
r28-31  00000500 00000000 100646c0 10255d20
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10255ed8 10255edc
 IIR: 0e742088    ISR: 00000000  IOR: 0000001c
 CPU:        0   CR30: 10064000 CR31: 10359000
 ORIG_R28: 00000020
 IAOQ[0]: cfb_imageblit+0x248/0x55c
 IAOQ[1]: cfb_imageblit+0x24c/0x55c
 RP(r2): putcs_aligned+0x18c/0x21c

--Boundary-00=_pXwWBRBPUSNsQsv--
