Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BAA01484A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 08:33:21 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18X19m-0006dF-00; Fri, 10 Jan 2003 15:33:14 +0000
Date: Fri, 10 Jan 2003 15:33:13 +0000
From: Matthew Wilcox <willy@debian.org>
To: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ibm-disk on a hp 735/125
Message-ID: <20030110153313.V26554@parcelfarce.linux.theplanet.co.uk>
References: <Pine.GSO.4.51.0301091743500.9837@sunhalle66> <20030110124210.GG2160@aurinko.ntc.nokia.com> <1042203531.19627.11.camel@linux> <20030110145800.GH2160@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030110145800.GH2160@aurinko.ntc.nokia.com>; from mnahkola@trinms01.ntc.nokia.com on Fri, Jan 10, 2003 at 04:58:00PM +0200
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

On Fri, Jan 10, 2003 at 04:58:00PM +0200, Nahkola Mikko wrote:
> Well, yes on both counts. Any HVD disks should be detected... but at the 
> time these boxes were made, there were supposed to be certain differences 
> between HP and regular disks. Or maybe that was just HP marketing.
> 
> At any rate, there _was_ (and still is, BTW) a way to recognize a HP disk 
> by the firmware - and there were differences between "workstation" and 
> "server" disks too, _and_ IIRC "workstation" disks weren't "expected to 
> work" in servers, the other way round it was "expected to work" but "unsupported" 
> or something. Don't remember.

That's right.  HP (in common with other big-iron hardware vendors) has
custom disk firmware which has certain guarantees which are useful for
real world issues but slow down benchmarks.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
