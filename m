Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2579748AF
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Sep 2003 15:54:55 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 19v246-0006ZU-6s; Thu, 04 Sep 2003 22:54:54 +0100
Date: Thu, 4 Sep 2003 22:54:54 +0100
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel crash with 2.6.0-test4-pa8 on 715/100
Message-ID: <20030904215454.GC18654@parcelfarce.linux.theplanet.co.uk>
References: <3F5728AB.3040501@hrzpub.tu-darmstadt.de> <20030904140615.GN18654@parcelfarce.linux.theplanet.co.uk> <3F57A22C.5050902@tiscali.be> <20030904210000.GZ18654@parcelfarce.linux.theplanet.co.uk> <20030904215127.GD3627@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030904215127.GD3627@systemhalted>
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

On Thu, Sep 04, 2003 at 05:51:27PM -0400, Carlos O'Donell wrote:
> On Thu, Sep 04, 2003 at 10:00:00PM +0100, Matthew Wilcox wrote:
> > no, a 2.4 kernel doesn't have the same problem.
> 
> Signal related? What does the problem look like?

i said earlier; tty_open calls init_dev() with a bad `driver' parameter.
my WAG i can't verify because fucking GNU link *ls* against libpthread
is that /dev/console is screwed up.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
