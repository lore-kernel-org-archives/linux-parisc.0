Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-5-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F2A3482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 08:12:35 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17D4Bj-0004KI-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 15:12:31 +0100
Date: Wed, 29 May 2002 15:12:31 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020529141231.GG9919@tykepenguin.com>
References: <20020527001321.A6629@systemhalted> <20020528142736.GA9288@tykepenguin.com> <20020528132933.B31214@systemhalted> <20020529075131.GC9919@tykepenguin.com> <20020529082107.A2794@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <20020529082107.A2794@systemhalted>
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

On Wed, May 29, 2002 at 08:21:07AM -0400, Carlos O'Donell Jr. wrote:
> > > Send your .config?
> > Attached
> 
> Here's your problem:
> ...
> CONFIG_KDB_OFF=y
> ...

That's only set like that as a last-dich attempt to get it to work :-(

I'm going to have to give up on this, I can't spend all week trying to get it to
work. What I don't understand is that I move a working .config to the new kernel
source and both the serial console AND the scsi stop working.

Ah well, it was a nice idea while it lasted. It's just a bit hard debugging code
when the only error you get is "Stack pointer and cr30 do not cor
respond" repeated endlessly....

patrick
