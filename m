Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84A874839
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Mar 2003 05:55:12 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.12)
	id 18tSEp-0007pp-00; Thu, 13 Mar 2003 12:55:11 +0000
Date: Thu, 13 Mar 2003 12:55:11 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FYA - C3000 adventure
Message-ID: <20030313125511.GA29631@parcelfarce.linux.theplanet.co.uk>
References: <20030313070230.GB5865@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030313070230.GB5865@dsl2.external.hp.com>
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

On Thu, Mar 13, 2003 at 12:02:30AM -0700, Grant Grundler wrote:
> After powering off all 20 SCSI drives (damn SCSI subsystem is *way*
> too verbose), I was finally able to collect a full boot log via dmesg:

We can up the size of the dmesg buffer.  Might be easier ;-)

> ...
> lba version TR2.0 (0x1) found at 0xfed38000
> Can't support LBA older than TR2.1 - continuing under adversity.

Note to self: find replacement C3k IO board for grant.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
