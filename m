Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tux.mkp.net (tux.mkp.net [130.225.60.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 69CC8482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 Aug 2001 08:58:05 -0600 (MDT)
Sender: mkp@mkp.net
To: Reinhard.Gimbel@freenet.de
Cc: Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180: no real progress :-(
References: <01080622381300.01641@octopus>
	<20010806231339.Z1011@linuxcare.com> <01080714390400.00937@octopus>
From: "Martin K. Petersen" <mkp@mkp.net>
Date: 07 Aug 2001 10:57:09 -0400
In-Reply-To: <01080714390400.00937@octopus>
Message-ID: <yq1k80fex4q.fsf@jcb.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Reinhard" == Reinhard Gimbel <Reinhard.Gimbel@freenet.de> writes:

>> I have heard of a C160 with what could be similar problems.  The
>> C160 has internal diff scsi drives, and it seems that using that
>> interface causes disk corruption.  The only way he managed an
>> install was to disconnect all devices from the diff scsi interface,
>> and install to disks on the external scsi.  Is that something you
>> can try easily? Note, he had to physically disconnect the diff
>> disks, it wasn't sufficient to simply not use them.

The `external' SCSI Richard is referring to in my C160 is a Symbios
53C875 PCI board.

If you shop for one you have to be careful.  Most PC branded
controllers only support 5V PCI.  You need a controller with 3.3V PCI
support for the C180.  So I ended up buying a couple of Symbios
branded ones.  They support both voltages.

If you want to use the differential drives you got with the box, you
should buy the differential version of the controller.

And you need an external enclosure for the disks as it is close to
impossible to do internal cable routing in the box.  The 53C720 pins
go directly to the I/O bay edge connector.

Another alternative is to shop around for a dead C200/C240/C360 I/O
daughterboard which has an 875 instead of a 720.  That way you can use
the internal disk bay.  But you need Ultra Wide SCSI disks and not
differential ones in that case.

And finally - if you don't feel like spending money - keep bugging
Richard until he fixes the 710/720 problems ;)

-- 
Martin K. Petersen      Cereal Bowl Engineer, Linuxcare, Inc.
http://mkp.net/         SGI XFS, Linux/PA-RISC, GNOME
