Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from phnxpop4.phnx.uswest.net (phnxpop4.phnx.uswest.net [206.80.192.4])
	by dsl2.external.hp.com (Postfix) with SMTP id 9E2C24A19
	for <parisc-linux@parisc-linux.org>; Sat, 10 Mar 2001 10:23:30 -0700 (MST)
Date: Sat, 10 Mar 2001 10:21:54 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] segfaults with new binutils
Message-ID: <20010310102154.P18113@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20010310093942.O18113@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010310093942.O18113@tausq.org>; from randolph@tausq.org on Sat, Mar 10, 2001 at 09:39:42AM -0700
List-ID: <linux-parisc.vger.kernel.org>

> Running any of the binaries in the binutils deb gives an immediate
> segfault. This includes things like as, ld, etc... obviously this makes
> it rather difficult to compile anything.. :-(

ok, one more bit of info; removing the --enable-shared from the binutils
build line gives binaries that work, so i'm guessing there's some
problems with the shared libs (libopcodes and libbfd) ?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
