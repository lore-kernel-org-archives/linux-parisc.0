Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 229E04829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 11:18:28 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 18vLfM-0001DF-4Z; Tue, 18 Mar 2003 18:18:24 +0000
Date: Tue, 18 Mar 2003 18:18:24 +0000
From: Matthew Wilcox <willy@debian.org>
To: Brian Beaver <beaverb@nexus.dmsc.k12.ar.us>
Cc: PA RISC Linux mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Problem with CDROM
Message-ID: <20030318181824.GK14520@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.10.10303181243080.2119-100000@nexus.dmsc.k12.ar.us>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.10303181243080.2119-100000@nexus.dmsc.k12.ar.us>
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

On Tue, Mar 18, 2003 at 12:45:55PM -0600, Brian Beaver wrote:
> One of the schools I serve has been donated a HP 9000 DE 220.  I've

You mean a D220?

> figured out the serial console, but I can't find out how to add the CDROM
> drive as a boot drive.  The IPL shows the removable media and the Lan
> module as bootable.
> 
> P0  8/16/5.6  removable media (IPL)
> P1  8/16/6.0  LAN module

You don't think a CD-ROM drive qualifies as `removable media'?  ;-)

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
