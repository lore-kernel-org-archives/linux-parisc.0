Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id F35E84834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 24 Oct 2002 16:44:06 -0600 (MDT)
Message-Id: <200210242240.g9OMePYu027114@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 735/125 Wide Diff scsi
To: richard@nairnconsulting.ca (Richard Nairn)
Date: Thu, 24 Oct 2002 18:40:25 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: taggart@carmen.fc.hp.com, richard@nairnconsulting.ca,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021024223421.GR26502@taurus.nairnconsulting.ca> from "Richard Nairn" at Oct 24, 2002 04:34:21 pm
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

> Is there any approx time for the WD driver? I have about 60G I can put on
> my machine if it works.. Will it work if It gets plugged in the SE Chain?

No.  It may cause damage.

There was a question about the WD driver not too long ago.  You could search
for the answer but I believe only hpux supports the WD interface at this
time.  You may be able to add a newer LVD to the SE chain and have it
work.  I'm not sure if it could be used as a boot device though.

I've been watching for this support for some time as I have a 735 with
a bunch of Seagate WD drives on it running under hpux.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
