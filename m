Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A680E4852
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 09:23:48 -0600 (MDT)
Message-Id: <200206191523.g5JFNfar018785@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] SCSI Boot Problems on HP C110/9000
To: Mike.Audette@synopsys.com (Michael Audette)
Date: Wed, 19 Jun 2002 11:23:41 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Mike.Audette@synopsys.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <HMEKIKEAKEFFMJJOEAJNEEKEFIAA.maudette@synopsys.com> from "Michael Audette" at Jun 19, 2002 11:10:13 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> There are external SCSI termination blocks on the internal cable.  Both the
> segate HD and Toshiba CD-ROM have sockets for the terminator resistors, but
> they are removed.  The problem (and messages) occur when I have the External
> SCSI terminators plugged in.  This is what I don't understand.  It does not
> work with the _external_ terminators plugged in....where HP-UX wouldn't boot
> unless the external terminators were plugged in. Odd.  But the system does
> boot and run the "woody" beta OK without the external SCSI terminators

The problem may then be that terminator power isn't being provided to the
bus, or you have a bad cable, or wrong external terminator type (e.g.,
narrow fast differential terminator on SE bus).  You could try internal
termination of last device.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
