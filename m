Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from phnxpop4.phnx.uswest.net (phnxpop4.phnx.uswest.net [206.80.192.4])
	by dsl2.external.hp.com (Postfix) with SMTP id D00A64A19
	for <parisc-linux@parisc-linux.org>; Sat, 10 Mar 2001 09:30:47 -0700 (MST)
Date: Sat, 10 Mar 2001 09:29:10 -0700
From: Randolph Chung <randolph@tausq.org>
To: Paul Bame <bame@fc.hp.com>
Cc: Matt Taggart <taggart@carmen.fc.hp.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] New native gcc debs
Message-ID: <20010310092910.N18113@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20010306085014.D58AB38BD7@carmen.fc.hp.com> <E14aklv-0002kR-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E14aklv-0002kR-00@noam.fc.hp.com>; from bame@fc.hp.com on Wed, Mar 07, 2001 at 01:42:59PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> The apt build failure seems to be that the apt compile is unable
> to see things in the 'std' namespace -- possibly a new mode of 2.9.7
> and I have no clue how to fix this (namespaces are newer than my
> working C++ knowledge).

i think taggart had a g++ flag that might help, but absent that adding
some strategic "using namespace std;" in the source might help. i am
having lots of binutils problems (segfaults -- more in a separate mail)
but will try to investigate further.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
