Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6BB1B482A
	for <parisc-linux@parisc-linux.org>; Mon, 22 Oct 2001 12:49:47 -0600 (MDT)
Message-ID: <000b01c15b2a$1bac1120$c064f684@hia.nrc.ca>
Reply-To: "John David Anglin" <dave.anglin@nrc.ca>
From: "John David Anglin" <dave.anglin@nrc.ca>
To: "Matt Taggart" <taggart@carmen.fc.hp.com>,
	"Grant Grundler" <grundler@puffin.external.hp.com>
Cc: <parisc-linux@parisc-linux.org>
References: <200110221801.MAA07129@puffin.external.hp.com>
Subject: Re: [parisc-linux] Large SCSI disks on a 735/125 
Date: Mon, 22 Oct 2001 14:42:38 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

> Matt Taggart wrote:
> > Last year sometime I saw Paul Bame install an 18GB 10k RPM LVD Seagate
> > Cheetah drive in a 712 and install parisc-linux on it. It worked great
:)
>
> The LVD SCSI drives can also grok SE SCSI signal.
> Not true for HVD drives.
> But perhaps adding an SE SCSI interface to a 735 is possible.
> (to address the original problem)

The 735 normally has a SE SCSI interface.  Integrating LVD drives into
a 735 would be a little more complicated than the SE drive that I suggested.

As far as I can tell, most LVD drives have16-bit interfaces.  Thus, a 8-16
bit adapter is needed.  Also, you need an external terminator since LVD
drives don't have any provision for internal termination.  The above implies
that LVD drives must be installed at the end of the bus.  I don't think it
would
be possible to install a LVD drive in the 735's internal hard drive bay
because
of these constraints.  It would have to be in an external case.

Dave
