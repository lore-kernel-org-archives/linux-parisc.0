Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1C4B9482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 May 2003 16:50:24 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19FibG-0000EJ-IX; Tue, 13 May 2003 23:50:22 +0100
Date: Tue, 13 May 2003 23:50:22 +0100
From: Matthew Wilcox <willy@debian.org>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] build-tools bame
Message-ID: <20030513225022.GQ29534@parcelfarce.linux.theplanet.co.uk>
References: <20030513222102.33F00482D@dsl2.external.hp.com> <20030513223902.GK27494@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030513223902.GK27494@lug-owl.de>
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

On Wed, May 14, 2003 at 12:39:02AM +0200, Jan-Benedict Glaw wrote:
> ...as if you had read my thoughts, I'm currently planing a roadmap for
> pushing all ports upstream to Linus and looking for what work I could
> do. Please read it at http://www.lug-owl.de/~jbglaw/linux-ports/ and
> comment on it!

Well, it seems like a complete lie to me.

I think pretty much every architecture on your `really small userbase'
list would take issue with being placed there.  In particular, I think
PPC is the second-largest Linux userbase after x86.

The PA-RISC port doesn't have much in the way of tweaks to common drivers.

I don't understand why you say for 2.4:

"Nearly up to date, many patches need to go upstream"

and for 2.5:

"Not really up to date, but not far away; some work needs to be done..."

I don't know whether you're claiming the kernel.org tree is uptodate or
whether our repository is up to date.  Neither statement seems true for
either case.  

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
