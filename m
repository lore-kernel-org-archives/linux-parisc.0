Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 96C0D488B
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Sep 2003 15:00:03 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 19v1Cz-0002kX-EI; Thu, 04 Sep 2003 22:00:01 +0100
Date: Thu, 4 Sep 2003 22:00:00 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <joel.soete@tiscali.be>
Cc: Matthew Wilcox <willy@debian.org>,
	Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel crash with 2.6.0-test4-pa8 on 715/100
Message-ID: <20030904210000.GZ18654@parcelfarce.linux.theplanet.co.uk>
References: <3F5728AB.3040501@hrzpub.tu-darmstadt.de> <20030904140615.GN18654@parcelfarce.linux.theplanet.co.uk> <3F57A22C.5050902@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F57A22C.5050902@tiscali.be>
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

On Thu, Sep 04, 2003 at 08:35:56PM +0000, Joel Soete wrote:
> Hi Willy,
> >I'm seeing the same thing on my 712 without devfs.  Not sure what the
> >problem is, and I'm having a hard time getting that box back up as it has
> >a broken root filesystem (damn tar for being linked against libpthread!)
> >
> Is that libpthread the cause of your broken fs?

no, a 2.4 kernel doesn't have the same problem.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
