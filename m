Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07EA0483E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 19 Oct 2003 12:58:40 -0600 (MDT)
Date: Sun, 19 Oct 2003 12:03:06 -0700
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [patch] handle pagefaults on unaligned access
Message-ID: <20031019190306.GG24406@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20031019063825.GE24406@tausq.org> <200310191846.h9JIkxMq027125@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200310191846.h9JIkxMq027125@hiauly1.hia.nrc.ca>
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

> What's generating the unaligned ldh?  This will really kill performance.
> GCC shouldn't do this...

it was one of the testcases, but i haven't figured out which one yet. it
doesn't do this for every testcase...

> My system also crashed last night, probably running the gcj testsuite.

probably, it crashed my machine 3 times before i figured it out :-)

if you do "echo 0 >> /proc/sys/kernel/unaligned-trap" before you run the
test then it should SIGBUS when it does this... 

i'll try to debug this a bit more as well. but we shouldn't crash the
kernel in any case :)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
