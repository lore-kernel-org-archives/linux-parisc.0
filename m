Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0CADF482C
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 28 Mar 2004 15:53:23 -0700 (MST)
Date: Sun, 28 Mar 2004 15:32:35 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] spinlock align code triggering bug in gcc?
Message-ID: <20040328233235.GL750@tausq.org>
References: <20040328203211.GK750@tausq.org>
	<200403282248.i2SMma2a010231@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200403282248.i2SMma2a010231@hiauly1.hia.nrc.ca>
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

> > legolas[11:47] linux-2.6% make drivers/block/loop.o
> >   CC      drivers/block/loop.o
> > {standard input}: Assembler messages:
> > {standard input}:3701: Error: Field not properly aligned [8] (-183).
> > {standard input}:3701: Error: Invalid operands
> 
> Take a look at the assembler output for the above line.

i did, it's a "ldd -183(%r3), %rN" (i don't remember the target register
right now)

with -g it is pointing to the if () comparision inside the function. but
removing the up()/down() calls makes the error go away. removing the
loop and making it only operate on loop_dev[0] also makes the error go
away.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
