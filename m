Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sfcn.org (unknown [63.117.233.198])
	by dsl2.external.hp.com (Postfix) with ESMTP id 360184856
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Jun 2003 11:28:34 -0600 (MDT)
From: Nicholas Leippe <nick@byu.edu>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc-3.3 configuration
Date: Sun, 22 Jun 2003 11:28:39 -0600
References: <16074.48509.259405.775905@gargle.gargle.HOWL> <20030521052351.GV548@tausq.org>
In-Reply-To: <20030521052351.GV548@tausq.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200306221128.39787.nick@byu.edu>
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

On Tuesday 20 May 2003 11:23 pm, Randolph Chung wrote:
> > If yes, does the following approach work: Build a libstdc++5-3.3,
> > conflicting with libstdc++5 (including libstdc++ with the same soname)
> > and doing binary uploads for hppa for all libstdc++5 dependent
> > packages? (The same could be done for m68k, but the compatibility
> > argument doesn't hold as Debian seems to be the only m68k based
> > distro).
>
> Aside from the evilness of doing binNMUs of this magnitude, I doubt a
> "transition" that doesn't change the SONAME will work. As soon as the
> new libstdc++ is installed, every c++ app on the box will instantly
> break. This means if anything happens e.g. to apt during the update, the
> system will get into a very nasty state. I don't think this is worth it.
>

How many critical apps are actually C++?  Is the apt suite itself?
As long as /sbin/* is C, I don't see this as a showstopper for migrating to 
using a superior mechanism, which imo, should be a big goal--the sooner it's  
taken care of the less problematic it will be...

just a thought...

Nick
