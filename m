Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA32373
	for <parisc-linux@puffin.external.hp.com>; Wed, 14 Jun 2000 15:09:16 -0600
Received: from boca210a.boca.ssc.siemens.com (boca210a.boca.ssc.siemens.com [135.1.69.210])
	by lmmx1.fl.icn.siemens.com (8.9.3/8.9.3) with ESMTP id RAA12204
	for <parisc-linux@thepuffingroup.com>; Wed, 14 Jun 2000 17:09:58 -0400 (EDT)
Message-ID: <2FF13E24F61AD41193130008C791A76031F0FA@boca215a.boca.ssc.siemens.com>
From: "D'Angelo, James" <James.D'Angelo@icn.siemens.com>
To: parisc-linux@thepuffingroup.com
Date: Wed, 14 Jun 2000 17:07:58 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Linux make dep scsi error
List-ID: <linux-parisc.vger.kernel.org>

I've been fairly successful with building the compile environment, except
for this error message I seem not to be able to get past.  Any ideas?

gmake[1]: Leaving directory `/disk2/puffin/linux-2.3/arch/parisc/hpux'
hppa1.1-linux-ld  -T /disk2/puffin/linux-2.3/arch/parisc/vmlinux.lds
arch/parisc/real/head.o  init/main.o init/version.o \
--start-group \
		arch/parisc/kernel/pdc_cons.o arch/parisc/kernel/process.o
arch/parisc/real/real.o /disk2/puffin/linux-2.3/arch/parisc/lib/lib.a
arch/parisc/mm/mm.o arch/parisc/kernel/kernel.o arch/parisc/hpux/hpux.o
kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o arch/parisc/kernel/init_task.o \
		drivers/block/block.a drivers/char/char.o drivers/net/net.o
drivers/scsi/scsi.a drivers/cdrom/cdrom.a drivers/video/video.o
drivers/gsc/gsc.a drivers/parport/parport.a \
	net/network.a \
	/disk2/puffin/linux-2.3/arch/parisc/lib/lib.a
/disk2/puffin/linux-2.3/lib/lib.a  \
	--end-group \
	-o vmlinux
	drivers/scsi/scsi.a: could not read symbols: Malformed archive
	gmake: *** [vmlinux] Error 1
jdangelo@spider> 

I am building with the gcc from puffin on a 712/80 (same as my target
platform).

Jay D'Angelo
jdangelo@techie.com <mailto:jdangelo@techie.com> 





