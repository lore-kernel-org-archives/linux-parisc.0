Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A232C482A
	for <parisc-linux@parisc-linux.org>; Wed, 23 Apr 2003 12:53:59 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 198PNW-0001Yu-35; Wed, 23 Apr 2003 19:53:58 +0100
Date: Wed, 23 Apr 2003 19:53:58 +0100
From: Matthew Wilcox <willy@debian.org>
To: "K. David Prince" <kdp@hanhet.loew.washington.edu>
Cc: parisc-linux@parisc-linux.org
Message-ID: <20030423185358.GO3140@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.44.0304211532560.8607-100000@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0304211532560.8607-100000@localhost>
Subject: [parisc-linux] Re: HPA4246A framebuffer device.
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

On Mon, Apr 21, 2003 at 03:45:36PM -0700, K. David Prince wrote:
> I'm setting up one of our C180-XL machines.  Debian 3.0 is installed and X
> runs on the internal STI device.  This machine has a second video card,
> the HPA4246A.  I'd like boot with this as our primary display.  I've

This is a Visualize-48XP graphics card.  There's no support listed for
it in stifb.  It might be able to work if anyone has specs...

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
