Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48FFC48A9
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Aug 2003 07:47:35 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19p6pi-0007rp-Hv; Tue, 19 Aug 2003 14:47:34 +0100
Date: Tue, 19 Aug 2003 14:47:34 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] N running 2.4.21-pa13-64-SMP
Message-ID: <20030819134734.GE19630@parcelfarce.linux.theplanet.co.uk>
References: <3F2E54A800001E5E@ocpmta8.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F2E54A800001E5E@ocpmta8.freegates.net>
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

On Tue, Aug 19, 2003 at 11:39:18AM +0200, Joel Soete wrote:
> Q2: into cpuinfo (here above) I read:
> ...
> ITLB entries    : 160
> DTLB entries    : 160 - shared with ITLB
> ...
> is it right that DTLB is shared with ITLB?

Yes, that's how the PA8500 and 8600 work, at least.  We're merely
reporting how PDC tells us the processor works, not programming it
ourselves.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
