Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maximilian.max.uni-duisburg.de (schem4145.uni-duisburg.de [134.91.69.2])
	by dsl2.external.hp.com (Postfix) with SMTP id D6D28482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Jan 2002 08:56:39 -0700 (MST)
Received: from phil by nepomuk.max.uni-duisburg.de with local (Exim 3.12 #1 (Debian))
	id 16SKKl-0006vd-00
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Jan 2002 16:56:39 +0100
Date: Sun, 20 Jan 2002 16:56:39 +0100
From: Philipp Schulte <pschulte@uni-duisburg.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020120165639.A26621@nepomuk.max.uni-duisburg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Linux doesn't detect any hard drives
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

Hello,   
I am trying to install parisc-linux 0.9.3 on a HP 735/99. I booted
from CD and the installer told me that now disks were detected.
In the boot console I see the CD-ROM mentioned as something like "P0
scsi" and the disk as "P1  fwscsi". The disks works fine, HP-UX is
installed and boots.
It looks like Linux doesn't support the fwscsi-controller even though
it should.
Does anyone know this problem and how to solve it?
Thanks a lot,
Phil

BTW: The problem with the boot console not responding was solved by
experimenting with the serial port parameters. Thanks for the help.
