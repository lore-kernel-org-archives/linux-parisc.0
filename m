Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA29232
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Nov 2000 12:05:21 -0700
Message-Id: <5.0.0.25.0.20001102174648.02a4fb20@mail.webcash.com>
Date: Fri, 03 Nov 2000 11:03:23 -0800
To: Matt Taggart <taggart@carmen.fc.hp.com>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] Boot command 
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <20001103014733.4D08337C9F@carmen.fc.hp.com>
References: <Message from Kailashnath V Rampure <kailasr@webcash.com>
 <5.0.0.25.0.20001102172521.02ac5e40@mail.webcash.com>
 <5.0.0.25.0.20001102172521.02ac5e40@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

Yes I have been following the same Doc.
its tries to boot from the sda  as I can see the hard disk path. I have 2 
Hdd's one sda and other sdb. the path are 8/16/5.6 and other is 8/16/5.0. 
Here I think /dev/sda is 8/16/5.6.

It is trying to boot but give sthe following o/p:

Boot IO Dependent Code (IODC) revision 144
.... SUCCEEDED!

HARD Booted.
palo ipl bame@noam Tue Oct 31 14:18:02 MST 2000
0/vmlinux 208896 bytes @ 0x1f78c000
0/palo-cmdline '3/boot/vmlinux TERM=linux Home=/ root=/dev/sdb3'
/dev/ida1       82      62              1030688
/dev/ida2       f0      1030750 24738
/dev/ida3       83      1055488 1030750
Kernel:partition 3 file /boot/vmlinux
ext2 block size 1024
ext2_mount(partition 3) returns 0
ext2_open(/boot/vmlinux)=3
Couldn't gork your kernel executabel format failed to load kernel
Failed to load Kernel.

please suggest.

At 06:47 PM 11/2/00 -0700, Matt Taggart wrote:

>Kailashnath V Rampure writes...
>
> > Hi,
> > I have run the following command to initialize the sda harddisk. The sda3
> > is the linux native partion.
> > Wen I say boot on the HP server  it is trying to boot from /stand/vmunix
> > instead of vmlinux can any one help me about the command.
>
>This means that you are somehow still booting an HP-UX lifimage. Did you
>follow the directions on,
>
>http://www.thepuffingroup.com/parisc/install.html
>
>including the partitioning stuff? Maybe you're still booting off another 
>disk,
>are you sure you're booting from the linux disk?
>
>HTH,
>
>--
>Matt Taggart
>taggart@fc.hp.com
