Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2707482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 15:05:29 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id F3FA7B00C; Fri, 21 Sep 2001 22:04:27 +0100 (BST)
Date: Fri, 21 Sep 2001 22:04:27 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Bdale Garbee <bdale@gag.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 712/60 boots fine
Message-ID: <20010921220427.L24917@linuxcare.com>
References: <andreas@malcolm.in-chemnitz.de> <200109211603.KAA01633@puffin.external.hp.com> <87g09gpkac.fsf@rover.gag.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87g09gpkac.fsf@rover.gag.com>; from bdale@gag.com on Fri, Sep 21, 2001 at 10:42:51AM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 21, 2001 at 10:42:51AM -0600, Bdale Garbee wrote:
> grundler@puffin.external.hp.com (Grant Grundler) writes:
> 
> > =?iso-8859-1?Q?Andreas_H=E4rtel?= wrote:
> > > It is difficult to understand for a newbie, that PALO needs file system type
> >> 'F0' but this type is unknown by fdisk.
> >> Or the 2. mistake, the partition where vmlinux is located must be lower or
> >> equal 2 GByte.
> >
> > Both issues are documented in the palo documentation.
> 
> Clearly, then, "just" having them documented is insufficient.
> 
> I noted when doing an install from the 0.9.2 CD myself the other day that we
> paint a splash screen before disk partitioning explaining that there needs to
> be a palo partition, but that splash screen doesn't mention the 2G issue.  
> Perhaps it could be updated with some additional text?

Done.  Now says:

  | PALO, the PArisc LOader, requires a partition of type 'f0' on the disk   #  
  | it is loaded from.  Therefore, if this disk will contain the boot        #  
  | loader you must create a partition of type 'f0' of at least 16MB.        #  
  |                                                                          #  
  | A further important restriction is that the partition you load your      #  
  | kernel from must reside within the first 2GB of your disk.  The kernel   #  
  | lives in /boot, so you can either keep your root file system within the  #  
  | first 2GB, or you can create a small partition and mount it as /boot.    #  

> Also, since cfdisk is the default partitioning tool called by the Debian install
> process, if the definition of partition type F0 isn't already part of the 
> list of partition types displayed by cfdisk when you pick the command to change
> the partition type, perhaps it should get added?  It might well be disconcerting

                                  cfdisk 2.11h

                              Disk Drive: /dev/sda
                             Size: 9100044288 bytes
              Heads: 64   Sectors per Track: 32   Cylinders: 8678

    Name        Flags      Part Type  FS Type          [Label]        Size (MB)
 ------------------------------------------------------------------------------
    sda1                    Primary   Linux swap                         135.27 
    sda2                    Primary   Linux/PA-RISC boot                  17.83
    sda3                    Primary   Linux ext2                        1999.64
                            Pri/Log   Free Space                        6946.82


So F0 is recognised as "Linux/PA-RISC boot" now, at least.

Richard
