Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dionis.kfti.knc.ru (unknown [195.208.38.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D982482D
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Jun 2002 01:48:12 -0600 (MDT)
Message-Id: <adn_155_0_@dionis.kfti.knc.ru>
Date: Sat, 15 Jun 2002 11:43:36 +0400
From: Masliy Alex <masliy@kfti.knc.ru>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] HP PA 715/50 installation trouble
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

I have some troubles in installation of Linux on HP PA 715/50

I have the following hardvare - HP PA 715/50 WS, 64Mb RAM, 1Gb SCSI HDD
QUANTUM LPS1080, DDS Tape Drive HP6400 2000, Floppy Drive Teac and CDROM
Nec CDR84JD-1

I have downloaded the last stable release - Debian port on HP PA 0.9.3 -
469Mb iso image

At first, I tried to install from CDROM. In the proccess of booting the
following messages were printed:
---------------
Trying to scsi.4.0
Failed to initialize scsi.4.0
ENTRY_INIT status = -13
---------------

Then I decided to install from floppies. However, some problems arised:
According to readme, I try to write on the Linux PC rescue disk for HP PA.
The command "dd if=rescue.bin of=/dev/fd0 bs=1024" gave the following out:
--------------
dd: writing `/dev/fd0': No space left on device
1441+0 input records
1440+0 output records
-------------

The command "cmp /dev/fd0 rescue.bin" gave the following out:
---------------
cmp: EOF on /dev/fd0
---------------

I couldn't mount this disk on Linux PC (unrecognised filesystem)
When I try to boot from this disk on HP PA,  I get the following:
--------------------
Trying to scsi.0.0
Failed to initialize scsi.0.0
ENTRY_INIT status = -4
--------------------

Could you advise me what can I do to install Linux on my HP PA?

--
Sincerilly,  
Masliy Alex			mailto:masliy@kfti.knc.ru
