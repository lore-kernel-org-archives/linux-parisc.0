Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from orion.netbank.com.br (orion.netbank.com.br [200.203.199.90])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6B6A4879
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Dec 2003 16:11:28 -0700 (MST)
Date: Tue, 2 Dec 2003 21:16:25 -0200
From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20031202231624.GC17773@conectiva.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] acenic hanging the machine with 2.6.0-test11-pa0
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

Grant,
	Here is the data.

Hangs the machine after printing this:

parisc:/home/acme/bk/net-exp-2.6.1# modprobe acenic
acenic.c: v0.92 08/05/2002  Jes Sorensen, linux-acenic@SunSITE.dk
                            http://home.cern.ch/~jes/gige/acenic.html
divert: allocating divert_blk for eth1
eth1: Alteon AceNIC Gigabit Ethernet at 0xfffffffffa000000, irq 256
  Tigon II (Rev. 6), Firmware: 12.4.11, MAC: 00:30:6e:04:80:6a
  PCI bus width: 64 bits, speed: 66MHz, latency: 128 clks

Full output of "ser pim"

HPMC Chassis Codes

       Chassis Code        Extension
       ------------        ---------
       0x0000082000ff6242  0x0000000000000000
       0x1800082011006312  0xcb81000000000000
       0x0000087000ff6292  0x000000f0f0000000
       0x6000082070006062  0x0000000000100010
       0x7000082070006082  0x0000000000b92400
       0x7000082379006133  0xc1bff0fffed08040
       0x0000080080006310  0x0000000000000001
       0x000008008000631f  0x0000000000000000


General Registers 0 - 31
00-03  0000000000000000  0000000010235ae8  00000000000a103c  fffffffffa000140
04-07  0000000070af0000  000000002e6ed000  0000000000000000  00000000006e0480
08-11  000000002e87ad40  0000000000000030  fffffffffa000000  0000000000097000
12-15  0000000000000040  000000002e87aa00  0000000000000000  000000000000000c
16-19  fffffffffa000140  fffffffffa000504  0000000000000000  0000000010000000
20-23  0000000000000000  0000100001001000  000000002e87afa0  0000000000000000
24-27  0000000000000000  0000000000000000  000000002e87aee8  0000000000097000
28-31  000000002e87aee8  000000002e6744f0  000000002e674500  0000000000000070

Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000182  0000000000000000  00000000000000c0  000000000000003c
12-15  0000000000000000  0000000000000000  0000000000108000  ff00000000000000
16-19  0000003d39556b02  0000000000000000  00000000000a1084  000000000c600193
20-23  00000000ae27ffe8  c000000000000140  000000ff0804ff0f  8000000000000000
24-27  00000000003c0000  000000001f3bc000  0000000000041020  000000f0f0165670
28-31  5555555555555555  5555555555555555  000000002e674000  0000000010429000

Space Registers 0 - 7
00-03  00018580          00000000          00000000          00006080
04-07  00000000          00000000          00000000          00000000

 <Press any key to continue or 'Q' to quit>
IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x00000000000a1088
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030103b
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x000000fffa000140
System Requestor Address     = 0xfffffffffffa0000


Floating Point Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  000000001045ace0  0000000000000001  0000000010ef7530  00000000103c6000
08-11  0000000000000000  00000000104b1268  000000003ccbf700  000f41fa48c29140
12-15  000000001045ace0  000000003ccbf000  00000000101a2b48  00000000000000ff
16-19  00000000f0000390  00000000104a1da8  0000000000000002  00000000103bf040
20-23  0000000000000002  000000002fc85000  0000000000000000  0000000000000000
24-27  000007b100000000  000000002fc85000  000000001045ace0  0000000000000802
28-31  00000000f0002a7c  00000000f000022c  0000000010237964  0000000000000457

Check Summary                = 0xcb81000000000000
Available Memory             = 0x0000000020000000
CPU Diagnose Register 2      = 0x0203000200802004
CPU Status Register 0        = 0x2420c20000000000
CPU Status Register 1        = 0x8002000000000000
SADD LOG                     = 0xf4c4008411508840
Read Short LOG               = 0xc1af00fffa000140

-----------------  Processor 0 LPMC Information ------------------

Check Type                   = 0x00000000
IC Parity Info               = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000

-----------------  Processor 0 TOC Information -------------------

General Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000

Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000

IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x0000000000000000
CPU State                    = 0x00000000

--------------  Memory Error Log Information  --------------

Bus 0 Log Information

Timestamp =    Tue Dec  2 22:21:32 GMT 2003    (20:03:12:02:22:21:32)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
  X       X     ERR_ERROR       X            X

Bus Requestor Address      = 0xfffffffffffa0000
Bus Target Address         = 0x0000000000000000
Bus Responder Address      = 0xfffffffffed00000

Error Status Reg           = 0x0000000000100010
Runway Control Reg         = 0x0000021c00002818
Runway Address Reg         = 0xc1bff0fffed08040
Runway Data High Reg       = 0xf8018a1ff820ca01
Runway Data Low Reg        = 0xf8018a1ff820ca01
Memory Address Reg         = 0x000001ff3fffffff
Memory Address Corr Reg    = 0x000001ff3fffffff
Memory Syndrome Reg        = 0x0000000000000000
Memory Syndrome Corr Reg   = 0x0000000000000000

 Address/Control Parity Error Registers

   Address/Control Parity Error Bit (mem_addr_par_stat) Not Set

------------  I/O Module Error Log Information  ------------


   No I/O module errors logged



-------------------------------------------------------------------------


acme@parisc:~/bk/net-exp-2.6.1$ scripts/ver_linux
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.

Linux parisc 2.6.0-test11-pa0 #1 Tue Dec 2 14:20:21 BRST 2003 parisc64 GNU/Linux
Gnu C                  3.3.2
Gnu make               3.80
util-linux             2.12
mount                  2.12
module-init-tools      0.9.15-pre3
e2fsprogs              1.35-WIP
nfs-utils              1.0.6
Linux C Library        2.3.2
Dynamic linker (ldd)   2.3.2
Procps                 3.1.14
Net-tools              1.60
Console-tools          0.2.3
Sh-utils               5.0.91
Modules Loaded         tulip crc32 md5 ipv6
acme@parisc:~/bk/net-exp-2.6.1$

parisc:/proc/bus/pci/20# cd /
parisc:/# cat /proc/cpuinfo
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8700 (PCX-W2)
cpu MHz         : 650.000000
model           : 9000/800/A500-6X
model name      : Crescendo 650 W2
hversion        : 0x00005e20
sversion        : 0x00000491
I-cache         : 768 KB
D-cache         : 1536 KB (WB)
ITLB entries    : 240
DTLB entries    : 240 - shared with ITLB
bogomips        : 1294.33
software id     : 1840889640

parisc:/#

00:00.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
	Subsystem: Hewlett-Packard Company: Unknown device 104f
	Flags: bus master, medium devsel, latency 128, IRQ 128
	I/O ports at 0080 [size=128]
	Memory at fffffff0 (32-bit, non-prefetchable) [size=1K]
	Expansion ROM at fffff800 [size=256K]

00:01.0 SCSI storage controller: LSI Logic / Symbios Logic 53c896 (rev 07)
	Flags: bus master, medium devsel, latency 128, IRQ 129
	I/O ports at 0100 [size=256]
	Memory at fffffff0 (64-bit, non-prefetchable) [size=1K]
	Memory at fffffff0 (64-bit, non-prefetchable) [size=8K]
	Capabilities: <available only to root>

00:01.1 SCSI storage controller: LSI Logic / Symbios Logic 53c896 (rev 07)
	Flags: bus master, medium devsel, latency 128, IRQ 130
	I/O ports at 0200 [size=256]
	Memory at fffffff0 (64-bit, non-prefetchable) [size=1K]
	Memory at fffffff0 (64-bit, non-prefetchable) [size=8K]
	Capabilities: <available only to root>

00:02.0 SCSI storage controller: LSI Logic / Symbios Logic 53c875 (rev 37)
	Flags: bus master, medium devsel, latency 128, IRQ 130
	I/O ports at 0300 [size=256]
	Memory at fffffff0 (32-bit, non-prefetchable) [size=256]
	Memory at fffffff0 (32-bit, non-prefetchable) [size=4K]
	Capabilities: <available only to root>

00:02.1 SCSI storage controller: LSI Logic / Symbios Logic 53c875 (rev 37)
	Flags: bus master, medium devsel, latency 128, IRQ 131
	I/O ports at 0400 [size=256]
	Memory at fffffff0 (32-bit, non-prefetchable) [size=256]
	Memory at fffffff0 (32-bit, non-prefetchable) [size=4K]
	Capabilities: <available only to root>

00:04.0 System peripheral: Hewlett-Packard Company: Unknown device 128d (rev 01)
	Subsystem: Hewlett-Packard Company: Unknown device 128e
	Flags: medium devsel
	Capabilities: <available only to root>

00:04.1 Serial controller: Hewlett-Packard Company Diva Serial [GSP] Multiport UART (rev 03) (prog-if 02 [16550])
	Subsystem: Hewlett-Packard Company: Unknown device 1283
	Flags: medium devsel, IRQ 132
	Memory at fffffff0 (32-bit, non-prefetchable) [size=4K]
	I/O ports at 0040 [size=64]
	Capabilities: <available only to root>

20:00.0 Ethernet controller: Alteon Networks Inc. AceNIC Gigabit Ethernet (rev 01)
	Subsystem: Hewlett-Packard Company: Unknown device 106f
	Flags: 66Mhz, medium devsel, IRQ 256
	Memory at fffffff0 (32-bit, non-prefetchable) [disabled] [size=16K]


acme@parisc:~/bk/net-exp-2.6.1$ cat /proc/iomem
00000000-1fffffff : System RAM
  00000000-000009ff : PDC data (Page Zero)
  00100000-00399fff : Kernel code
  0039a000-004cee83 : Kernel data
ffffffff-100000006 : serial
fffffffff8000000-fffffffff87fffff : LBA LMMIO
  fffffffff8000000-fffffffff8000fff : 0000:00:04.1
    fffffffff8000000-fffffffff8000007 : serial
    fffffffff8000010-fffffffff8000017 : serial
    fffffffff8000030-fffffffff8000037 : serial
    fffffffff8000038-fffffffff800003f : serial
  fffffffff8001000-fffffffff8001fff : 0000:00:02.0
    fffffffff8001000-fffffffff8001fff : sym53c8xx
  fffffffff8002000-fffffffff8003fff : 0000:00:01.0
    fffffffff8002000-fffffffff8003fff : sym53c8xx
  fffffffff8004000-fffffffff8004fff : 0000:00:02.1
    fffffffff8004000-fffffffff8004fff : sym53c8xx
  fffffffff8005000-fffffffff80053ff : 0000:00:00.0
    fffffffff8005000-fffffffff80053ff : tulip
  fffffffff8006000-fffffffff80063ff : 0000:00:01.0
    fffffffff8006000-fffffffff80063ff : sym53c8xx
  fffffffff8007000-fffffffff80070ff : 0000:00:02.0
    fffffffff8007000-fffffffff80070ff : sym53c8xx
  fffffffff8008000-fffffffff80080ff : 0000:00:02.1
    fffffffff8008000-fffffffff80080ff : sym53c8xx
  fffffffff8020000-fffffffff80203ff : 0000:00:01.1
    fffffffff8020000-fffffffff80203ff : sym53c8xx
  fffffffff8040000-fffffffff8041fff : 0000:00:01.1
    fffffffff8040000-fffffffff8041fff : sym53c8xx
  fffffffff8080000-fffffffff80bffff : 0000:00:00.0
fffffffff9000000-fffffffff97fffff : LBA LMMIO
fffffffffa000000-fffffffffa7fffff : LBA LMMIO
  fffffffffa000000-fffffffffa003fff : 0000:20:00.0
fffffffffb000000-fffffffffb7fffff : LBA LMMIO
fffffffffed00000-fffffffffed00fff : SBA
fffffffffed30000-fffffffffed30fff : lba
fffffffffed34000-fffffffffed34fff : lba
fffffffffed38000-fffffffffed38fff : lba
fffffffffed3c000-fffffffffed3cfff : lba
fffffffffff80000-fffffffffffaffff : Central Bus
  fffffffffffa0000-fffffffffffa0fff : CPU
fffffffffffb0000-fffffffffffdffff : Local Broadcast
fffffffffffe0000-ffffffffffffffff : Global Broadcast

acme@parisc:~/bk/net-exp-2.6.1$ cat /proc/interrupts
           CPU00
 64:    1262318      PARISC-CPU  timer
 65:       1846      PARISC-CPU  IO-SAPIC00-L0
 66:         33      PARISC-CPU  IO-SAPIC00-L1
 67:          0      PARISC-CPU  IO-SAPIC00-L2
 68:      29457      PARISC-CPU  IO-SAPIC00-L2
 69:         30      PARISC-CPU  IO-SAPIC00-L3
 70:       4425      PARISC-CPU  IO-SAPIC00-L4
 71:          0      PARISC-CPU  IO-SAPIC02-L0
128:       1846      IO-SAPIC00  eth0
129:         33      IO-SAPIC00  sym53c8xx
130:      29457      IO-SAPIC00  sym53c8xx, sym53c8xx
131:         30      IO-SAPIC00  sym53c8xx
132:       4425      IO-SAPIC00  serial

- Arnaldo
