From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.10-rc2-pa2 build failing
Date: Sun, 19 Dec 2004 21:14:04 +0000
Message-ID: <41C5EF1C.9030401@tiscali.be>
References: <Pine.LNX.4.58.0412031551120.3169@rray.drdc.mstc.ms.gov>
	<20041204190201.GC30126@colo.lackof.org>
	<Pine.LNX.4.58.0412060817380.21506@rray.drdc.mstc.ms.gov>
	<20041210192835.GF6653@colo.lackof.org>
	<41BADB3C.8000602@tiscali.be> <41BAE2D5.4010201@tiscali.be>
	<20041213044153.GD27199@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: rray@tcmail.mstc.state.ms.us,
 parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041213044153.GD27199@parcelfarce.linux.theplanet.co.uk>
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

I just experiment the same pb on my c110:
EXT3-fs: mounted filesystem with ordered data mode.
Disabled Privacy Extensions on device 103ab688(lo)
eth0: link ok.
Backtrace:
  [<10262e70>] ncr_reset_bus+0x50/0x110
  [<10267094>] ncr53c8xx_bus_reset+0x30/0x7c
  [<1025988c>] scsi_try_bus_reset+0x5c/0xd0
  [<10259a3c>] scsi_eh_bus_reset+0x6c/0x118
  [<1025a02c>] scsi_eh_ready_devs+0x64/0x9c
  [<1025a1a8>] scsi_unjam_host+0x7c/0xc0
  [<1025a2a4>] scsi_error_handler+0xb8/0x100
  [<1010bc5c>] ret_from_kernel_thread+0x1c/0x24
High Priority Machine Check (HPMC): Code=1 regs=1038e080 (Addr=00000000)

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111001100001110 Not tainted
r00-03  00000000 103ac010 10262b44 0000000f
r04-07  2ff3c000 00000000 00000002 103ac010
r08-11  00000000 2ff38110 b5a95f80 1044bb00
r12-15  2fe7d278 00000000 1039d010 1044b810
r16-19  f00010f4 f00000ac f00000a4 f3f8c80e
r20-23  00000001 0000000f 0000000e 00000031
r24-27  00000002 f3f8c800 38200002 1038b010
r28-31  00002003 7b958900 2ff38380 1025988c
sr0-3   00000000 00000000 00000000 00000003
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10262c80 10262c84
  IIR: 37340018    ISR: 00000000  IOR: f3f8c80c
  CPU:        0   CR30: 2ff38000 CR31: 103e4000
  ORIG_R28: 00000000
  IAOQ[0]: ncr_reset_scsi_bus+0x190/0x2f8
  IAOQ[1]: ncr_reset_scsi_bus+0x194/0x2f8
  RP(r2): ncr_reset_scsi_bus+0x54/0x2f8
Kernel panic - not syncing: High Priority Machine Check (HPMC)
  <0>Rebooting in 120 seconds..

with:
# uname -a
Linux hpalin 2.6.10-rc3-pa8-c110 #2 Sat Dec 18 19:00:49 CET 2004 parisc GNU/Linx

fwiw: this same kernel was booting fine yesterday evening and as well after this panic???

Any idea?

Joel

Matthew Wilcox wrote:
> On Sat, Dec 11, 2004 at 12:06:45PM +0000, Joel Soete wrote:
> 
>>>A K200 iirc?
>>
>>Sorry for auto-reply but I go back to your previous mail and compare your 
>>config file with mine and noticed some details:
>>
>>1) may be you need hppb bus option ON; the diff shows me:
>>--- k200-hp-debian-1_config	2004-12-11 12:38:46.307780990 +0100
>>+++ config-2.6.10-rc3-pa5	2004-12-11 12:36:59.434552100 +0100
>>[...]
>>-# CONFIG_HPPB is not set
>>+CONFIG_HPPB=y
> 
> 
> Shouldn't make any difference; the ncr720 is on the GSC bus.
> http://www.openpa.net/systems/hawk.html shows the K class does have HPPB
> slots, so I would suggest that you both have the HPPB option set wrongly;
> there is no HPPB on the C class workstations, but there is for K class.
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
