Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 83E99485D
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 08:48:05 -0700 (MST)
Message-Id: <200301101547.h0AFlvVs003368@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] ibm-disk on a hp 735/125
To: krebsj@informatik.tu-muenchen.de (Joerg Krebs)
Date: Fri, 10 Jan 2003 10:47:57 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.GSO.4.51.0301091743500.9837@sunhalle66> from "Joerg Krebs" at Jan 9, 2003 05:44:31 pm
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

> But now I want to replace the disk with a larger 4,3GB ibm dcas-34330
> disk, but I can't get it be detected by the system, I think i used the
> same jumper settings as on the old seagate drive.
> at the search for potential boot devices nothing appears.

If the ibm drive is not high-voltage differential, you can probably get
a wide to narrow adapter and put it at the end of the narrow SE bus.
Plugging a non-differential drive into a differential bus is not supposed
to damage anything but it does completely disable the bus drivers of
all devices on the bus ;-)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
