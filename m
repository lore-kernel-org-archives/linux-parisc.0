Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 925FA4868
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Jan 2004 21:32:01 -0700 (MST)
Message-Id: <200401080431.i084VvaE016766@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] scsi problem on a scorpio (715)
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Wed, 7 Jan 2004 23:31:57 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20040108041405.GA2347@systemhalted> from "Carlos O'Donell" at
	Jan 7, 2004 11:14:06 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: rollei@tiscalinet.it, grundler@parisc-linux.org,
	parisc-linux@lists.parisc-linux.org, hppa@fop.ns.ca
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> My entire cluster was made up of scorpio boxes 715/50's, and I *never*
> had them run stably with anything but a tag queue depth of 1.
> 
> Grant, I'm pretty sure me and you had this exact conversation like 2
> years ago :)

Also, remember the issues that I had under HP-UX 10.20 with some Seagate
Elite drives.  I believe that I had to set the depth to 1 for these
drives to get the system to run reliably.  Tagged queuing is broken
on most old drives.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
