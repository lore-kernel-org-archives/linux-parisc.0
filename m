From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [parisc-linux] K410 SCSI 53c700 issue with PLEXTOR PX-R820T
Date: Sun, 12 Nov 2006 16:03:50 +0100
Message-ID: <20061112160350.8b7d4afd.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
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


I'm experiencing an issue with the LASI 53c700 SCSI driver. It looks similar to the problem found by Joel earlier :
http://lists.parisc-linux.org/pipermail/parisc-linux/2006-July/029506.html
http://lists.parisc-linux.org/pipermail/parisc-linux/2006-September/030202.html

My plextor cd burner works fine on an x86 and on that K410 with HP-UX or linux 2.4.

This is how 2.4 detects it :
scsi3: (4:0) Synchronous at offset 8, period 100ns
  Vendor: PLEXTOR   Model: CD-R   PX-R820T   Rev: 1.08
  Type:   CD-ROM                             ANSI SCSI revision: 02

And this is how 2.6 detects it :
[42949430.090000]   Vendor: PLEXTOR   Model: CD-R   PX-R820T   Rev: 1.08
[42949430.150000]   Type:   CD-ROM                             ANSI SCSI revision: 02
[42949430.170000]  target2:0:4: Beginning Domain Validation
[42949430.180000]  target2:0:4: asynchronous
[42949430.190000]  target2:0:4: FAST-10 SCSI 10.0 MB/s ST (100 ns, offset 8)
[42949430.200000]  target2:0:4: Domain Validation skipping write tests
[42949430.210000]  target2:0:4: Ending Domain Validation


The main difference seems that 2.4 detects and syncronous drive while 2.6 detects an async one.

Full 2.4 dmesg : https://www.tuxicoman.be/temp/dmesg-2.4-53c700
Full 2.6 dmesg : https://www.tuxicoman.be/temp/dmesg-2.6-53c700
2.6 kernel config : https://www.tuxicoman.be/temp/k410-2.6.18.2-pa0.config

On my 2.6 kernel, when you try to mount it, you get the those error messages in loop.

[  297.870000] scsi2: (4:0) phase mismatch at 01e8, phase IO BSY DATA_IN
[  297.870000] scsi2: Bus Reset detected, executing command 4f7bb840, slot 4ff50520, dsp 001c01e8[01e8]
[  297.870000]  failing command because of reset, slot 4ff50520, cmnd 4f7bb840
[  327.880000] sr 2:0:4:0: New error handler wants to abort command
[  327.880000] 	sr 2:0:4:0: 
[  327.880000]         command: cdb[0]=0x0: 00 00 00 00 00 00
[  327.880000] scsi2: Bus Reset detected, executing command 4f7bb840, slot 4ff50520, dsp 001c0010[0010]
[  327.880000]  failing command because of reset, slot 4ff50520, cmnd 4f7bb840
[  327.890000] sr 2:0:4:0: New error handler wants BUS reset, cmd 4f7bb840
[  327.890000] 	sr 2:0:4:0: 
[  327.890000]         command: cdb[0]=0x0: 00 00 00 00 00 00
[  327.890000] scsi2: Bus Reset detected, executing command 00000000, slot 00000000, dsp 001c0010[0010]


As you can see in the dmesg, I have another CDROM drive on the same SCSI bus and this one works like a charm.



Please have a look at it and let me know if you need any other info.

Thanks,
  Guy
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
