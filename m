Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 593114829
	for <parisc-linux@parisc-linux.org>; Fri, 10 Jan 2003 11:31:39 -0700 (MST)
Date: Fri, 10 Jan 2003 10:35:33 -0800
From: Randolph Chung <randolph@tausq.org>
To: Jim Hull <jim.hull@hp.com>
Cc: 'John David Anglin' <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: floating point exception error
Message-ID: <20030110183533.GH26261@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030110075441.GD31470@tausq.org> <003101c2b8d3$477c8bb0$6763f40f@cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <003101c2b8d3$477c8bb0$6763f40f@cup.hp.com>
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

> What it does not explain is why the original message reported a
> difference between a PA-8600 and a PA-8700.  According to every internal
> HP processor document and PA-RISC FP designer I've been able to track
> down, this area of the design hasn't been changed since the original
> PA-8000, so there shouldn't be any differences in behavior.

actually it happens there too. i can reproduce the trap on pa8500,
pa8600 and pa8700 A500s.

so i guess this again points to a fp emulation bug in the kernel....
this is a bit surprising because aiui the code was lifted from hpux...

will look at this some more this weekend.
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
