From: =?ISO-8859-1?Q?Sebastian_Br=FCckner?= <sebastian.brueckner@epost.de>
Subject: Re: [parisc-linux] HP B132L hangs
Date: Thu, 11 Sep 2003 17:03:55 +0200
Message-ID: <3F608EDB.101__24077.2891244434$1416622768$gmane$org@epost.de>
References: <3F5F24D9.7030800@epost.de> <1063208722.1984.10.camel@mulgrave> <3F5F71C8.7060605@epost.de> <20030910185834.GC21596@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: debian-hppa@lists.debian.org, parisc-linux@parisc-linux.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030910185834.GC21596@parcelfarce.linux.theplanet.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Matthew Wilcox schrieb:
> Could you redirect the output from make-kpkg to a file or /dev/null so the
> messages from the compilation aren't interleaved with the kernel messages.

I tried to backup the system and got the a similar error with very few 
messages mixed into it. Maybe this is better readable:

b132l:~# tar c / | ssh -l sb 192.168.0.2 'gzip -f > root.tar.gz'
tar: Removing leading `/' from member names
sb@192.168.0.2's password:
scsi0: ERROR on channel 0, id 2, lun 0, CDB: Request Sense 00 00 00 40 00
Info fld=0x39a27b, Current sd08:04: sense key Medium Error
Additional sense indicates Unrecovered read error
  I/O error: dev 08:04, sector 3428208
tar: /usr/share/consolefonts/lat1-08.psf.gz: Read error at byte 0, 
reading 1024 bytes: Input/output error
scsi0: ERROR on channel 0, id 2, lun 0, CDB: Request Sense 00 00 00 40 00
Info fld=0x39a5e4, Current sd08:04: sense key Medium Error
Additional sense indicates Unrecovered read error
  I/O error: dev 08:04, sector 3429080
scsi0: (2:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =Read (10) 00 00 39 a5 e8 00 00 a0 00
scsi0: Bus Reset detected, executing command 10081c00, slot 00010ff4, 
dsp 00090210[0210]
  failing command because of reset, slot 00010ff4, cmnd 10081c00
scsi0: (2:0) Synchronous at offset 8, period 100ns
scsi0: (2:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =Read (10) 00 00 39 a5 e8 00 00 a0 00
scsi0: Bus Reset detected, executing command 10081c00, slot 00010520, 
dsp 00090210[0210]
  failing command because of reset, slot 00010520, cmnd 10081c00
  failing command because of reset, slot 00010ff4, cmnd 10081a00
  failing command because of reset, slot 000115f8, cmnd 10081800
scsi0: (2:0) Synchronous at offset 8, period 100ns
scsi0: (2:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =Read (10) 00 00 39 a5 e8 00 00 a0 00
scsi0: Bus Reset detected, executing command 10081c00, slot 00010520, 
dsp 00090210[0210]
  failing command because of reset, slot 00010520, cmnd 10081c00
  failing command because of reset, slot 00010ff4, cmnd 10081a00
  failing command because of reset, slot 000115f8, cmnd 10081800
scsi0: (2:0) Synchronous at offset 8, period 100ns
scsi0: (2:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =Read (10) 00 00 39 a5 e8 00 00 a0 00
scsi0: Bus Reset detected, executing command 10081c00, slot 00010520, 
dsp 00090210[0210]
  failing command because of reset, slot 00010520, cmnd 10081c00
  failing command because of reset, slot 00010ff4, cmnd 10081a00
  failing command because of reset, slot 000115f8, cmnd 10081800
scsi0: (2:0) Synchronous at offset 8, period 100ns
scsi0: (2:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =Read (10) 00 00 39 a5 e8 00 00 a0 00


cu,
   Sebastian
