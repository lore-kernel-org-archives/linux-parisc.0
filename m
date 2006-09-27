From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Can't write to hard drives on a K200
Date: Tue, 26 Sep 2006 21:28:36 -0500
Message-ID: <200609262128.36997.mszick@morethan.org>
References: <4518662C.6020103@emenaker.com> <45191956.4060800@scarlet.be>
	<4519BA09.5070000@emenaker.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4519BA09.5070000@emenaker.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue September 26 2006 18:38, Joe Emenaker wrote:
> Joel Soete wrote:
> >> Hrmmm.... so maybe the disks are read-only somehow, right? Well then 
> >> how come I can dd like so:
> >>
> >>   dd if=/dev/zero of=/dev/sda bs=512 count=10
> >>
> >> That works fine. So.... anybody have any idea what's going on?
> > If that doesn't matter to completely erase your disk try the same cmdl 
> > without count param, i.e.
> >     dd if=/dev/zero of=/dev/sda bs=512
> Well, I did the entire drive with:
>    dd if=/dev/zero of=/dev/sda bs=512 count=10 count=8388314
> and that worked fine.
> 
> I also tried your
>     dd if=/dev/zero of=/dev/sda bs=512k
> and that worked too (8192 records in, 8192 records out).
> 
> So... dd works, (c)fdisk doesn't. I guess I could just get someone to 
> partition a blank hd just the way I want and then send me their 
> partition table (dd if=/dev/sdX bs=512 count=1 | gzip -9 | mail ....), 
> then I could dd it on this end and I'd be all set, huh?
> 
> Well, there's another option. I could plug the drives into a SCSI card 
> on a PC... but I've tried that, and I can't get that to work. If someone 
> wants to help me with *that*, I'd appreciate that as well, since I 
> clearly don't understand all of the intricacies of SCSI, because I 
> couldn't get the PC to recognize the drive(s). I *think* it had to do 
> with the drives being (apparently) "single-ended"... but I don't know.
>

It is hard to say - 

The drive's firmware reported a model number that indicates SE - but
it also reported an HP revision number for the drive firmware.  Which,
as Dave pointed, means the model number reported may not be complete.

The driver reported that the drives where using differential - this
might stand a better chance of being correct.

The driver in pa-risc is a derivative of the {open,free,net}BSD
driver - it should negotiate with the attached drive(s) the proper
SCSI connection or tri-state the SCSI bus to prevent drive/adapter
damage.

Still with me?
differential comes in two flavors - High Voltage and Low Voltage
I am guessing from the chip's age that its version of differential is HVD.

If your pa-risc machine has connectors to external drives - they should
be labeled - now that label you can trust.

Another thing to consider - as I recall, the dmesg of your machine has 
reported two SCSI controllers - the one not using the ncr53c driver has
only the CD-ROM on it - you might consider adding a drive 
(of the proper type - check your dmesg) to the scsi chain with the 
CD-ROM on it.

Another thing that might be worth trying - DD your live-cd image onto
one of the hard drives - if there are no read/write problems with DD, 
it should work.

An cd-rom image on a hard drive?  Yes, that does work for me - I have
an iso image DD copied to a 100Mb removable (zip) SCSI-2 drive.  Linux
doesn't care about media type vs filesystem type.

Mike
 
> - Joe
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
