Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id F296E4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Apr 2003 23:21:02 -0600 (MDT)
Date: Thu, 17 Apr 2003 22:17:10 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] some 2.5 kernel profile data
Message-ID: <20030418051710.GV25257@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030414052248.GG25257@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030414052248.GG25257@tausq.org>
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

In reference to a message from Randolph Chung, dated Apr 13:
> i ran 'readprofile' on a 2.5.67-pa3 UP kernel (a500, 64-bit) with
> several different workloads. here are the numbers if anyone is
> interested.

upon future reflection, these profiles are all wrong, because we 
really need to take a before and after measurement and diff them... 
<sigh> what was i thinking?

i'll remeasure them this weekend and post new results. meanwhile, i'm 
putting a diffprof script in cvs, since no one on #kernel seems to know
of a "standard" one, and the one i got from wli is in haskell, so 
i don't understand it, and it doesn't work on parisc :)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
