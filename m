Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB49C482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jul 2003 06:42:19 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19dr2W-0003kF-A7; Sat, 19 Jul 2003 13:42:16 +0100
Date: Sat, 19 Jul 2003 13:42:16 +0100
From: Matthew Wilcox <willy@debian.org>
To: =?iso-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] Prevent loopback traffic to be shown on the network leds
Message-ID: <20030719124216.GC1485@parcelfarce.linux.theplanet.co.uk>
References: <3F192C1D.2050701@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3F192C1D.2050701@hrzpub.tu-darmstadt.de>
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

On Sat, Jul 19, 2003 at 01:31:41PM +0200, Rüdiger Scholz wrote:
> Hi,
> 
> looking at the Download page from the ESIEE-Team I found the following 
> patch from Thibaut. It filters the traffic from/to the loopback device, 
> so network led isn't blinking when accessing the loopback device. 
> Should'nt it go into CVS?

Seems like a reasonable patch to me.  I'll ask Thibaut about it when
he gets here.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
