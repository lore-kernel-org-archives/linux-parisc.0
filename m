Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id B4588482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Sep 2001 03:36:47 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 93F06B00C; Mon, 10 Sep 2001 10:36:58 +0100 (BST)
Date: Mon, 10 Sep 2001 10:36:58 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Boyan Lazarov <bsl@mek.dtu.dk>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Installing on Apollo 735
Message-ID: <20010910103658.T19441@linuxcare.com>
References: <3B9BA35D.9A02DD98@mek.dtu.dk> <20010910083204.P19441@linuxcare.com> <3B9C73CF.412C929@mek.dtu.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B9C73CF.412C929@mek.dtu.dk>; from bsl@mek.dtu.dk on Mon, Sep 10, 2001 at 10:03:27AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 10, 2001 at 10:03:27AM +0200, Boyan Lazarov wrote:
> This is the output:
> 
> SCSI subsystem driver Revision: 1.00
> sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
> scsi0: Revision 0x0
> scsi0: test 1 completed ok.
> scsi0 : LASI/Simple 53c7xx
>   Vendor: PLEXTOR   Model: CD-ROM PX-32TS    Rev: 1.02
>   Type:   CD-ROM                             ANSI SCSI revision: 02
>   Vendor: MICROP    Model: 2112              Rev: 4024
>   Type:   Direct-Access                      ANSI SCSI revision: 02
>   Vendor: SEAGATE   Model: ST31200N          Rev: 8714
>   Type:   Direct-Access                      ANSI SCSI revision: 02
> Detected scsi disk sda at scsi0, channel 0, id 5, lun 0
> Detected scsi disk sdb at scsi0, channel 0, id 6, lun 0
> SCSI device sda: 2051460 512-byte hdwr sectors (1050 MB)
> Partition check:
>  sda: unknown partition table
> SCSI device sdb: 2051460 512-byte hdwr sectors (1050 MB)
>  sdb: sdb1 sdb2 sdb3
> Detected scsi CD-ROM sr0 at scsi0, channel 0, id 0, lun 0
> 
> I have 2 disks which are connected to fast wide SCSI but they are not
> recognized by the kernel.
> 
> I am installing the system on /dev/sdb
> 
> When i got the message , I have waited for more than 30 min .

Can you try adding   sim700=noneg:0xff,nodisc:0xff   to the boot params
please.  Say 'yes' to the interact with IPL question if that machine
gives you one, else perhaps append 'isl' to the bo command.  Then just
modify one of the existing params to append that string.

Richard

> Boyan
> 
> Richard Hirst wrote:
> > 
> > On Sun, Sep 09, 2001 at 07:14:05PM +0200, Boyan Lazarov wrote:
> > > Hi ,
> > > I am trying to install linux on Apollo 735 . The system boots normally (
> > > serial console, from cd image 0.9.2) . When i reach the point to install
> > > the kernel  and the modules , the installer starts the installation and
> > > gives message
> > > ioctl: LOOP_CLR_FD: No such device or address
> > 
> > The installer gives that message for everyone, but normally it
> > immediately continues with the install.  What disks are you trying
> > to install on to?  I don't believe the internal wide scsi disks
> > are supported atm, but people have installed on to external narrow
> > disks.
> > 
> > Richard
> 
