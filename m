Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A2D5D4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 05:51:20 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 190LEU-0002GC-Oe; Tue, 01 Apr 2003 13:51:18 +0100
Date: Tue, 1 Apr 2003 13:51:18 +0100
From: Matthew Wilcox <willy@debian.org>
To: Paul Weissmann <paul@doorslam.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 745i (Pace) boots
Message-ID: <20030401125118.GA29376@parcelfarce.linux.theplanet.co.uk>
References: <20030401081403.GB25299@hppa.doorslam.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030401081403.GB25299@hppa.doorslam.net>
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

On Tue, Apr 01, 2003 at 10:14:03AM +0200, Paul Weissmann wrote:
> just a quick note - the above mentioned system, a 745i/50, boots up
> fine with ``lifimage-2.4.20-pa32-20030322.gz'' over the network. it
> is basically a 725/50, just in a different enclosure with hp-ib
> support.

That's great!  Thanks for the report.

> if someone would tell me how to interrupt the debian-installer from
> coming up i could provide a dmesg or console log.

Easiest way is to boot with `init=/bin/sh'.  You do this by interacting
with IPL/ISL, editing one of the options and appending that string to it.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
