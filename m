Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 10209483E
	for <parisc-linux@lists.parisc-linux.org>; Thu, 24 Oct 2002 16:38:23 -0600 (MDT)
Message-Id: <200210242234.g9OMYdrf027093@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 735/125 Wide Diff scsi
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Thu, 24 Oct 2002 18:34:38 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: taggart@carmen.fc.hp.com, richard@nairnconsulting.ca,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <200210242225.g9OMPCSE027067@hiauly1.hia.nrc.ca> from "John David Anglin" at Oct 24, 2002 06:25:12 pm
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

> > Richard Nairn writes...
> > 
> > > Hi There,
> > > 
> > > I have a number of Seagate WD drives that I would like to put on my
> > > 735/125.  It doesn't seem to recognize them.  Is the Wide scsi chain
> > > supported?
> > 
> > Well if you're plugging it in to a narrow single ended bus the drive should 
> > fall back. If you're trying to plug it in to a wide high voltage 
> > differential bus that's not going to work.

That's not correct.  Seagate WD drives must be installed on the wide
high-voltage differential bus.  They will not work on a SE bus (even
a wide one).  You also need a WD bus terminator.  They are different
from wide SE terminators.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
