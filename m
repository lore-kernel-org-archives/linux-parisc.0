Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22BEE482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 14 Jun 2002 17:45:07 -0600 (MDT)
Message-ID: <3D0A8018.AEE42C90@gmx.at>
Date: Sat, 15 Jun 2002 01:45:28 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: "William @ HOME" <william@zero.myftpsite.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP-9000/E45
References: <002101c213d9$0c72b430$010012ac@jonis>
Content-Type: text/plain; charset=us-ascii
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

this machine is not supported under linux yet.

But I wrote a driver half'n year ago, using the PDC console (ROM)
in Linux. You have to activate the PDC console by kernel compilation
(character device driver, non-standard drivers), and you have to 
create a device /dev/ttyB0 (see HELP button at configuration).

The kernel line parameter, add `console=ttyB0', then the box can
boot as "diskless server", as the MUX (except the ROM PDC console),
the SCSI and the parallel port is not working.

But I will start on a E55 to write drivers (I will start, but I
cannot speak about results...).

BTW: the console port is on port 0 on my MUX ! If the E45 really
can do an autodetection here in the boot monitor (PDC), then this
also works under Linux, but I cannot imagine....

Christoph P.

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
