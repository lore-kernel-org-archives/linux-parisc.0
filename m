Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 74702482C
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 28 Mar 2004 15:57:23 -0700 (MST)
Date: Sun, 28 Mar 2004 15:36:37 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] spinlock align code triggering bug in gcc?
Message-ID: <20040328233637.GM750@tausq.org>
References: <200403282248.i2SMma2a010231@hiauly1.hia.nrc.ca>
	<200403282251.i2SMp7OD010307@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200403282251.i2SMp7OD010307@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> I think this is a coding problem.

that's what i thought too initially, but there are no special things 
in the structure that makes it unaligned. pls take a look at the test 
program i attached... the structure only has a spinlock, an int and a 
pointer.  where the heck does it get 183 from (or 23 in the test 
program)? :) i'm guessing it inlined the __ldcw_align() and did some 
constant folding to do the alignment and then the offset becomes wrong?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
