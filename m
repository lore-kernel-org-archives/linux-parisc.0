Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from boden.synopsys.com (boden.synopsys.com [204.176.20.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1661B4851
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 09:10:20 -0600 (MDT)
From: "Michael Audette" <Mike.Audette@synopsys.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	"Michael Audette" <Mike.Audette@synopsys.COM>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] SCSI Boot Problems on HP C110/9000
Date: Wed, 19 Jun 2002 11:10:13 -0400
Message-ID: <HMEKIKEAKEFFMJJOEAJNEEKEFIAA.maudette@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <200206191438.g5JEcnYt018317@hiauly1.hia.nrc.ca>
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

There are external SCSI termination blocks on the internal cable.  Both the
segate HD and Toshiba CD-ROM have sockets for the terminator resistors, but
they are removed.  The problem (and messages) occur when I have the External
SCSI terminators plugged in.  This is what I don't understand.  It does not
work with the _external_ terminators plugged in....where HP-UX wouldn't boot
unless the external terminators were plugged in. Odd.  But the system does
boot and run the "woody" beta OK without the external SCSI terminators

			-Mike

-----Original Message-----
From: John David Anglin [mailto:dave@hiauly1.hia.nrc.ca]
Sent: Wednesday, June 19, 2002 10:39 AM
To: Michael Audette
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SCSI Boot Problems on HP C110/9000


> Thanks for the help.  I searched back in the forum another month and saw a
> very similar message with a response top it that said "sounds like SCSI
> termination problem".  I think this is actually a driver problem.  Both
> disks are on the internal SCSI chain and internally terminated (2 GB
Segate
> and a Toshiba CDROM).  I did have SCSI terminator s on the external ports
> (HP-UX wouldn't boot without them) (Both the Fast-Wide and the Single
> Ended).

There should be a terminator at each end of the SCSI bus.  Typically,
you don't have to worry about the processor end.  Old Seagate drives
have internal termination resistors that need to be removed if the
drive is not at the end of the bus or you are using an external terminator.
The Seagate web site has user guides online for all models.  The Toshiba
CDROM probably has a switch to disable the internal terminator.

Dave
--
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX:
952-6605)
