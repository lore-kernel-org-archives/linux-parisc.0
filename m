Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail16.speakeasy.net [216.254.0.216])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A69F48BC
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 09:08:25 -0600 (MDT)
Date: Tue, 16 Jul 2002 08:11:18 -0700
From: Randolph Chung <randolph@tausq.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] gcc-3.[02] alignment problem
Message-ID: <20020716151118.GC641@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020716050031.GA641@tausq.org> <20020716122605.GB31977@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020716122605.GB31977@systemhalted>
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

> Preprocessed source attached?

I forgot it the first time, tried to send it again, but the source was
too large and it got stopped for moderation...

> Remember we ran into this when building glibc at OLS.... and
> we sat there scratching our heads. I'm pretty sure this was the
> reason for the hppa-align.dpatch that is part of debianzed gcc?

the hppa-align patch is for a different problem aiui, it's so that we
don't do multiple ldcw's on the same cache line. 

in any case, 3.0.4 (which has this patch) gives the same error.

> Randolph: There is a forward email inside the dpatch that says
> you were going to try get this patch upstream... ? :)
> (gcc 3.0.4 ./debian/patches/hppa-align.dpatch)

I've tried, but the gcc folks have put in a different mechanism to do
this, so the patch needs to be reworked, and i haven't gotten back to it
yet.

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
