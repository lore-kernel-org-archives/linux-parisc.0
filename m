Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id B2BAB482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Nov 2002 10:51:22 -0700 (MST)
Message-Id: <200211251751.gAPHpHDf017394@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Disk problems
To: james@compusmithllc.com (James Smith)
Date: Mon, 25 Nov 2002 12:51:16 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: derekengelhaupt@rocketmail.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <1038244395.441.13.camel@seventy> from "James Smith" at Nov 25, 2002 12:13:15 pm
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

> would a low level format on the mac do the same as low level using an
> adaptec card ?

If it works in a mac, the low-level formatting is probably ok.  It's
most likely the data in block 0 or possibly some of the vendor info
that's the problem.  You should also examine all switch settings and
check that the termination is correct.

Erase disk in the finder doesn't do a low-level format.  It just builds
a new file systems.  Various tools from Adaptec (FWB HDT) and other
vendors are available to do low-level formats on the Mac.  The Sedit
program can probably issue a command to format the drive but I would
only do this as a last resort.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
