From: =?ISO-8859-15?Q?Sebastian_Br=FCckner?= <sebastian.brueckner@epost.de>
Subject: Re: [parisc-linux] HP B132L hangs
Date: Wed, 10 Sep 2003 20:47:36 +0200
Message-ID: <3F5F71C8.7060605__23029.9987750643$1416622767$gmane$org@epost.de>
References: <3F5F24D9.7030800@epost.de> <1063208722.1984.10.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: debian-hppa@lists.debian.org, parisc-linux@parisc-linux.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <1063208722.1984.10.camel@mulgrave>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

James Bottomley schrieb:
 > That's a residue of an incorrect lasi700 driver.  Notice it thinks the
 > length is six for a ten byte command.  This has long been fixed in the
 > linux-2.4 PA tree (er, I think---I've been concentrating on 2.6
 > mainly).

Hrm...

I installed the latest available kernel image (2.4.20-32) and it worked 
- only compiling seems to raise the error... strange!

 > However, something higher up in the trace you don't attach caused the
 > actual problem that this is a response to (It's caused by the SCSI mid
 > layer putting the wrong command length back *after* error recovery, so
 > your true root cause is the error that first started this).

I ran make-kpkg again and this time captured the first messages:

/usr/bin/make -C scsi fastdep
make[6]: Entering directory `/usr/src/linux-2.4.22/drivers/scsi'
gcc -D__KERNEL__ -I/usr/src/linux-2.4.22/include -Wall 
-Wstrict-prototypes -Wnoc
| /sbin/genksyms  -k 2.4.22 > 
/usr/src/linux-2.4.22/include/linux/modules/scsi_p
mv /usr/src/linux-2.4.22/include/linux/modules/scsi_syms.ver.tmp 
/usr/src/linuxr
gcc -D__KERNEL__ -I/usr/src/linux-2.4.22/include -Wall 
-Wstrict-prototypes -Wnoc
| /sbin/genksyms  -k 2.4.22 > 
/usr/src/linux-2.4.22/include/linux/modules/53c70p
53c700.c:163:22: 53c700_d.h: No such file or directory
mv /usr/src/linux-2.4.22/include/linux/modules/53c700.ver.tmp 
/usr/src/linux-2.r
/usr/src/linux-2.4.22/scripts/mkdep -D__KERNEL__ 
-I/usr/src/linux-2.4.22/includm
vme16x.c mvme16xInfo fld=0x35e1fb.h ncr53c8xx.c n, cr53c8xx.h 
nsp32Current .c nr
_debug.c nsp32_iAdditional sense indicates Unrecovered read error
o.h oktagon_esp. I/O error: dev 08:04, sector 3182320
c oktagon_esp.h scsi0: (2:0), UNEXPECTED PHASE after command phase (CD 
BSY REQ )
          len = 6, cmd =Read (10) 00 00 35 e2 00 00 00 18 00
scsi0: Bus Reset detected, executing command 10081c00, slot 00010520, 
dsp 00090]
  failing command because of reset, slot 00010520, cmnd 10081c00
oktagon_io.S ossscsi0: (2:0) Synchronous at offset 8, period 100ns
t.c osst.h osst_detect.h osst_options.h pas16.c pas16.h pci2000.c 
pci2000.h pci)
          len = 6, cmd =Read (10) 00 00 35 e2 00 00 00 18 00
scsi0: Bus Reset detected, executing command 10081c00, slot 00010520, 
dsp 00090]
  failing command because of reset, slot 00010520, cmnd 10081c00
qlogicpti.h qlogscsi0: (2:0) Synchronous at offset 8, period 100ns
icpti_asm.c scsi.c scsi.h scsi_debug.c scsi_debug.h scsi_dma.c 
scsi_error.c scs)
          len = 6, cmd =Read (10) 00 00 35 e2 00 00 00 18 00
scsi0: Bus Reset detected, executing command 10081c00, slot 00010520, 
dsp 00090]
  failing command because of reset, slot 00010520, cmnd 10081c00
710_d.h sim710_uscsi0: (2:0) Synchronous at offset 8, period 100ns
.h sr.c sr.h sr_ioctl.c sr_vendor.c st.c st.h st_options.h 
sun3_NCR5380.c sun3_)
          len = 6, cmd =Read (10) 00 00 35 e2 00 00 00 18 00
scsi0: Bus Reset detected, executing command 10081c00, slot 000109f0, 
dsp 00090]
  failing command because of reset, slot 00010520, cmnd 10081a00
  failing command because of reset, slot 00010654, cmnd 10081800
  failing command because of reset, slot 00010788, cmnd 10082800
  failing command because of reset, slot 000108bc, cmnd 10081000
  failing command because of reset, slot 000109f0, cmnd 10081c00
  failing command because of reset, slot 00010b24, cmnd 10082e00
  failing command because of reset, slot 00010c58, cmnd 10081200
  failing command because of reset, slot 00010d8c, cmnd 10082a00
  failing command because of reset, slot 00010ec0, cmnd 10082600
  failing command because of reset, slot 00010ff4, cmnd 10081600
  failing command because of reset, slot 00011128, cmnd 10082200
  failing command because of reset, slot 0001125c, cmnd 10082c00
  failing command because of reset, slot 00011390, cmnd 10081400
  failing command because of reset, slot 000114c4, cmnd 10082400
  failing command because of reset, slot 000115f8, cmnd 10082000
  failing command because of reset, slot 0001172c, cmnd 100a4e00
7000.c wd7000.h scsi0: (2:0) Synchronous at offset 8, period 100ns
zalon7xx.c zalon7xx.h > .depend
scsi0: (2:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =Read (10) 00 00 35 e2 00 00 00 18 00
scsi0: Bus Reset detected, executing command 10081c00, slot 00010520, 
dsp 00090]
  failing command because of reset, slot 00010520, cmnd 10081c00
  failing command because of reset, slot 00010654, cmnd 10081a00
  failing command because of reset, slot 00010788, cmnd 10081800
  failing command because of reset, slot 000108bc, cmnd 10081600
  failing command because of reset, slot 000109f0, cmnd 10081400
  failing command because of reset, slot 00010b24, cmnd 10081200
  failing command because of reset, slot 00010c58, cmnd 10081000
  failing command because of reset, slot 00010d8c, cmnd 10082e00
  failing command because of reset, slot 00010ec0, cmnd 10082c00
  failing command because of reset, slot 00010ff4, cmnd 10082a00
  failing command because of reset, slot 00011128, cmnd 10082800
  failing command because of reset, slot 0001125c, cmnd 10082600
  failing command because of reset, slot 00011390, cmnd 10082400
  failing command because of reset, slot 000114c4, cmnd 10082200
  failing command because of reset, slot 000115f8, cmnd 10082000
  failing command because of reset, slot 0001172c, cmnd 100a4e00
...

I will try the newer kernel now...
However "Unrecovered read error" sounds very much like a bad disk for me 
so I suppose it will not help...

cu,
   Sebastian
