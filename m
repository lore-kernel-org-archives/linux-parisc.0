Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA20544
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Dec 2000 02:49:16 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 20 Dec 2000 09:52:15 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A1AE3B005; Wed, 20 Dec 2000 09:46:08 +0000 (GMT)
Date: Wed, 20 Dec 2000 09:46:08 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: "M. Grabert" <xam@deathsdoor.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] (still) booting problems with HP9000/730
Message-ID: <20001220094608.D2554@linuxcare.com>
References: <Pine.LNX.4.21.0012172113360.11612-100000@sgate.charlysworld.de> <3A3E544E.FC5B58CB@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A3E544E.FC5B58CB@linuxcare.com>; from adevries@linuxcare.com on Mon, Dec 18, 2000 at 01:15:42PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Dec 18, 2000 at 01:15:42PM -0500, Alex deVries wrote:
> "M. Grabert" wrote:
> > The kernel starts booting, but the scsi driver (old Ncr)
> > reports some warnings/errors like
> > shared memory is not coherent (or so), failed to reset scsi bus,
> > irq probe failed etc...
> > 
> > the scsi driver finally recognizes my Quantum HD and
> > tries to boot from it (mount it)..
> > There is nothing like VFS: unable to mount blabla;
> > instead it runs in to an infinite loop of kernel oops,
> > it prints continously kernel stack/register traces
> > (seem to look all the same).
> 
> I talked to Richard Hirst about this a few hours ago, and it looks like
> there's a problem with the SCSI driver.  It's unclear how difficult it
> would be to get that going, but it certainly is possible to fix.

The following is from my 715/75, where the scsi driver works.  As Alex
said, the scsi driver has a problem on your machine, but not all the
messages indicate real problems.  At one time I had a cdrom attached
which didn't respond well to requests for synchronous working, and the
driver couldn't cope.

What devices do you have on your scsi bus?  Can you disconnect
everything except the Quantum HD as a test?

You can try booting with

	sim700=nodisc:0xff

in case it is a problem with disconnect/reselect, and you could
try

	sim700=nodisc:0xff,noneg:0xff

in case it is a probem with sync/async negotiation.


    SCSI subsystem driver Revision: 1.00
    sim700: Couldn't get consistent shared memory

    // That just indicates that we are using old hardware

    sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86

    // That line indicates it is a 53c700, and not a 53c710

    scsi0: Revision 0x0
    Post test1, istat 05, sstat0 00, dstat 84
    sim700: WARNING IRQ probe failed, (returned 0)

    // That WARNING IRQ... is expected on parisc

    scsi0: WARNING: target data areas are not dma coherent!

    // That again is just a warning, and nothing to worry about

    scsi0: test 1 completed ok.

    // That indicates the driver can talk to the chip, and the chip
    // can generate interrupts.

    scsi0 : LASI/Simple 53c7xx
      Vendor: HP        Model: HP35470A          Rev: 7 09
      Type:   Sequential-Access                  ANSI SCSI revision: 02
      Vendor: SEAGATE   Model: ST32430N          Rev: 0510
      Type:   Direct-Access                      ANSI SCSI revision: 02
      Vendor: MICROP    Model: 2112              Rev: 4024
      Type:   Direct-Access                      ANSI SCSI revision: 02
    Detected scsi tape st0 at scsi0, channel 0, id 3, lun 0
    st: bufsize 32768, wrt 30720, max init. buffers 4, s/g segs 16.
    Detected scsi disk sda at scsi0, channel 0, id 5, lun 0
    Detected scsi disk sdb at scsi0, channel 0, id 6, lun 0
    SCSI device sda: 4197405 512-byte hdwr sectors (2149 MB)
    Partition check:
     sda: sda1 sda2 sda3
    SCSI device sdb: 2051460 512-byte hdwr sectors (1050 MB)
     sdb: unknown partition table

Alex, you already have a full boot log for this machine.

Richard
