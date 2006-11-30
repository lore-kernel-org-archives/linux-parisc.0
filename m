From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] K410 SCSI 53c700 issue with PLEXTOR PX-R820T
Date: Thu, 30 Nov 2006 12:17:43 -0500
Message-ID: <1164907064.22826.23.camel__41974.9905042865$1416624625$gmane$org@mulgrave.il.steeleye.com>
References: <20061112160350.8b7d4afd.gmsoft@tuxicoman.be>
	<20061112191436.GY16952@parisc-linux.org>
	<20061127115832.b413fd7b.gmsoft@tuxicoman.be>
	<20061127153713.GQ14076@parisc-linux.org>
	<20061130101805.2a82273b.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061130101805.2a82273b.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Actually, your analysis isn't quite correct.  This is the real problem

On Thu, 2006-11-30 at 10:18 +0100, Guy Martin wrote:
> [42949427.280000] 53c700: scsi2, command sr 2:0:2:0: 
> [42949427.280000]         command: cdb[0]=0x43: 43 00 00 00 00 00 00 00 0c 40

READ_TOC(10) command (i.e. 10 byte command)

> [42949427.280000]  scatter block 0: move 12[0900000c] from 0x1d48e00
> [42949427.280000]  SETTING 001c0528 to 90080000
> [42949427.280000]  script, patching short field MessageCount at 30 to 0xe000001
> [42949427.280000]  script, patching ID field Device_ID at 0 to 0x41040000
> [42949427.280000]  script, patching CommandAddress at 121 to 0x1d508f8
> [42949427.280000]  script, patching short field CommandCount at 120 to 0xa00000a
> [42949427.280000]  script, patching SGScriptStartAddress at 191 to 0x1c0520
> [42949427.280000]  script, patching SGScriptStartAddress at 207 to 0x1c0520
> [42949427.290000] scsi2: istat 01 sstat0 00 dstat 84 dsp 012a[001c04a8] dsps 0x401
> [42949427.290000] scsi2: (2:0) ====>SCRIPT INTERRUPT<====
> [42949427.290000]   COMMAND COMPLETE, status=02

Returns Check Condition, causing the driver to send out a REQUEST_SENSE
command, which it begins here using the same slot:

> [42949427.290000]  script, patching short field MessageCount at 30 to 0xe000006
> [42949427.290000]  script, patching ID field Device_ID at 0 to 0x41040000
> [42949427.290000]  script, patching CommandAddress at 121 to 0x1d58c20
> [42949427.290000]  script, patching short field CommandCount at 120 to 0xa00000a

This patches the command length to ten bytes, but REQUEST_SENSE is only
a 6 byte command ... it's clearly inherited the length parameter from
the previous command.

> [42949427.290000]  script, patching SGScriptStartAddress at 191 to 0x1c0520
> [42949427.290000]  script, patching SGScriptStartAddress at 207 to 0x1c0520
> [42949427.290000] scsi2: Issuing saved command slot 4f6b8520, cmd 4f23b8c0      
> [42949427.300000] scsi2: istat 09 sstat0 00 dstat 84 dsp 00ba[001c02e8] dsps 0x250
> [42949427.300000] scsi2: (2:0) ====>SCRIPT INTERRUPT<====
> [42949427.300000] scsi2 (2:0): message before command phase: 01 03 01 3b 08 
> [42949427.300000] Attempting to resume at 1c02e8
> [42949427.320000] scsi2: istat 0a sstat0 c0 dstat 00 dsp 007a[001c01e8] dsps 0x1d58c20
> [42949427.320000] scsi2: (2:0) phase mismatch at 01e8, phase IO BSY DATA_IN

And here we get a phase mismatch in the command phase because the drive
transitions to data phase after six bytes and the driver still thinks it
has another four to send.

I'd have the maintainer shot ... he clearly forgot to set up the command
length for auto request sense.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
