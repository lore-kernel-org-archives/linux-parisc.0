Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id C1255482B
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Jan 2002 08:52:57 -0700 (MST)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GPDDG902.IAB for
          <parisc-linux@lists.parisc-linux.org>; Thu, 3 Jan 2002 06:52:57 -0900
Date: Thu, 3 Jan 2002 06:49:30 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Bill Ferguson <ferguson@quango.net>
Cc: <parisc-linux@lists.parisc-linux.org>,
	<debian-hppa@lists.debian.org>
Subject: Re: [parisc-linux] Upgrading 715/100 Firmware
In-Reply-To: <5.1.0.14.2.20020103010257.02f9c440@mail.quango.net>
Message-ID: <Pine.LNX.4.33.0201030645070.16499-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Thu, 3 Jan 2002, Bill Ferguson wrote:
> I know this has been asked a zillion times but bear with me.  I'm pretty
> new to Linux, but familar with many other operating systems.
>
> I've got debian 0.9.3 installed on a 715/100.  Seems to work pretty well.
>
> My question relates to getting the firmware to a "scratch disk"  which
> Grant speaks of in the archives (in my case sda1 set to type F0).  sdb1,
> sdb2, sdb3, sdb4 are the disks where the Linux install resides.
>
> Is type F0 the correct type to load firmware from?  Is there any parameters
> other than:
> dd if=c7x50016.frm of=/dev/sda1   ?   Do I need a block size parameter? eg
> bs=2k like it says with tape?    Does sda1 need to be mounted first before
> using dd ?  How does one mount an F0 disk?   What does F0 mean?  Is it HP
> format?
>
> I've tried booting from bootp, cdrom, tape, and now scratch disk and I
> can't get the LIF image to work.

I *finally* managed to upgrade mine. I used three Seagate DDS2 DAT drives
to write the tape, none of which would be read by the drive in the HP (one
of the Seagates). Each of them barfed "bad IPL checksum"... I finally
borrowed a spare HP SureStore 6000 DDS2 DAT drive from work; it wouldn't
read either tape used by the other drives, but when I used the HP drive to
burn the tape it booted and updated fine. I also told it not to interact
with IPL, and disabled compression on the drive (mt -f /dev/st0
datcompression 0).

I used 'dd if=CC2X0061.frm of=/dev/st0 bs=2k' as my command line, your
patch file will surely be different :-)
