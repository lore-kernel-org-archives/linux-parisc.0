Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BB5E04829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 May 2003 16:06:33 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19Hsm7-0008E1-IY; Mon, 19 May 2003 23:06:31 +0100
Date: Mon, 19 May 2003 23:06:31 +0100
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4 and semtimedop - need kernel compat?
Message-ID: <20030519220631.GA31518@parcelfarce.linux.theplanet.co.uk>
References: <20030519201224.GB542@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030519201224.GB542@systemhalted>
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

On Mon, May 19, 2003 at 04:12:24PM -0400, Carlos O'Donell wrote:
> 
> pa,
> 
> I think I'm leaving the "filling in" of this to Randolph :)
> For now it provides enough functionality for glibc to build and be all
> happy and merry. Wether we strictly need compat code for semtimedop is
> uknown.

Uh, you don't need to do anything.  If you call an unassigned syscall,
you get -ENOSYS.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
