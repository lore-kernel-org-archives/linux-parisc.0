Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 337E348A8
	for <parisc-linux@lists.parisc-linux.org>; Sun, 24 Aug 2003 15:42:14 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 19r2cm-0001HG-87; Sun, 24 Aug 2003 22:42:12 +0100
Date: Sun, 24 Aug 2003 22:42:12 +0100
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Added a new SCSI disk, hda became hdb
Message-ID: <20030824214212.GB18834@parcelfarce.linux.theplanet.co.uk>
References: <20030824191340.GG5304@charite.de> <20030824203857.GD17595@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030824203857.GD17595@systemhalted>
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

On Sun, Aug 24, 2003 at 04:38:57PM -0400, Carlos O'Donell wrote:
> Put the disks in the reverse order?
> 
> An example is that any A500 or rp2430 labels the drives as 'scsia' and
> 'scsib', but linux finds them in the reverse order. When only one drive is
> in 'scsia' it's sda, but when a second drive is added to 'scsib' the
> order is reversed ('scsia' becomes sdb and 'scsib' becomes sda).

This is because HPUX uses the ANSI-approved scan order -- 7,6,5,...,0
and Linux uses the PC-compatible scan order -- 0,1,2,...,7.  It's kind
of possible to control it by setting shost->reverse_ordering but it's
not easy to set this in any reasonable way.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
