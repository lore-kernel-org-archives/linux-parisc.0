From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Mon, 27 Dec 2004 23:01:03 -0500
Message-ID: <200412272301.03299.vapier@gentoo.org>
References: <200412260504.40205.vapier@gentoo.org>
	<200412272045.34143.vapier@gentoo.org>
	<20041228033520.GO11543@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_/pN0BYQa/5K4PGB"
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041228033520.GO11543@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_/pN0BYQa/5K4PGB
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 27 December 2004 10:35 pm, Matthew Wilcox wrote:
> Can you try the following patch?  We're not actually disabling ppr atm,
> depite what the comment says.

kernel panic :(

find attach dmesg
-mike

--Boundary-00=_/pN0BYQa/5K4PGB
Content-Type: text/plain; charset="iso-8859-1";
	name="2.6.10-pa1-scsi-debug-patch3"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="2.6.10-pa1-scsi-debug-patch3"

sym0: <875> rev 0x4 at pci 0000:00:13.0 irq 99
sym0: No NVRAM, ID 7, Fast-20, SE, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18m
elevator: using anticipatory as default io scheduler
  Vendor: IBM       Model: DDRS-34560WS      Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:6:0: tagged command queuing enabled, command queue depth 16.
 target0:0:6: Beginning Domain Validation
sym0:6:wide msgout: 1-2-3-1.
sym0:6:wide msgin: 1-2-3-1.
sym0:6:wdtr: wide=1 chg=0.
sym0:6:sync msgout: 1-3-1-c-0.
sym0:6:sync msgin: 1-3-1-c-0.
sym0:6:sdtr: ofs=0 per=12 div=0 fak=0 chg=0.
sym0:6: wide asynchronous.
sym0:6:sync msgout: 1-3-1-c-10.
sym0:6:sync msgin: 1-3-1-c-f.
sym0:6:sdtr: ofs=15 per=12 div=0 fak=0 chg=0.
sym0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
 target0:0:6: Domain Validation skipping write tests
 target0:0:6: Ending Domain Validation
sym0:9:ppr msgin: 1-6-4-c-0-3f-1-2.
sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
sym0:9:ppr msgout: 1-6-4-c-0-10-1-0.
  Vendor: WDIGTL    Model: WDE9150 ULTRA3    Rev: 1.30
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym0:9:0: tagged command queuing enabled, command queue depth 16.
 target0:0:9: Beginning Domain Validation
sym0:9:ppr msgout: 1-6-4-c-0-0-0-0.
sym0:9:ppr msgin: 1-6-4-a-0-0-0-0.
sym0:9: asynchronous.
sym0:9:ppr msgout: 1-6-4-c-0-0-1-0.
sym0:9:ppr msgin: 1-6-4-a-0-0-1-0.
sym0:9: wide asynchronous.
sym0:9:ppr msgout: 1-6-4-c-0-10-1-0.
sym0:9:ppr msgin: 1-6-4-a-0-10-1-0.
Backtrace:
 [<1029cf04>] sym53c8xx_intr+0x30/0x88
 [<1010708c>] do_irq+0x84/0x158
 [<1024234c>] dino_isr+0xa4/0x110
 [<1010708c>] do_irq+0x84/0x158
 [<10107214>] do_cpu_irq_mask+0xb4/0x124
 [<1010c068>] intr_return+0x0/0x14
 [<10112674>] cpu_idle+0x20/0x30
 [<101776a4>] may_open+0x58/0x20c
 [<10165b04>] dentry_open+0xd8/0x258
 [<1017a854>] dupfd+0x1e4/0x234
 [<10434610>] start_kernel+0x4/0x1e0
 [<10434610>] start_kernel+0x4/0x1e0
 [<10434610>] start_kernel+0x4/0x1e0
 [<10434610>] start_kernel+0x4/0x1e0
 [<10434610>] start_kernel+0x4/0x1e0
 [<10434610>] start_kernel+0x4/0x1e0


Kernel Fault: Code=13 regs=10428600 (Addr=00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001110 Not tainted
r00-03  00000000 ffffffff 1042858a 00000000
r04-07  00000010 00000000 10fc4000 10fc4c00
r08-11  103f6810 00000000 00000009 10fc4310
r12-15  0000000a 00000001 000000fd f0100000
r16-19  10428140 f0000154 f000014c 103f7168
r20-23  00000000 103f7168 ffffffff 1042858b
r24-27  0000000a 00000000 01312cff 103ca010
r28-31  000000fa 00000005 10428600 1029f8d8
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1023122c 10231230
 IIR: b3202000    ISR: 10240001  IOR: 0a0285f0
 CPU:        0   CR30: 10428000 CR31: 1042c000
 ORIG_R28: 00000000
 IAOQ[0]: $$divU+0xc/0x210
 IAOQ[1]: $$divU+0x10/0x210
 RP(r2): 0x1042858a
Kernel panic - not syncing: Kernel Fault
 <0>Rebooting in 3 seconds..

--Boundary-00=_/pN0BYQa/5K4PGB
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_/pN0BYQa/5K4PGB--
