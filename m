Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5BD9F48DC
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 28 Mar 2004 15:51:09 -0700 (MST)
Message-Id: <200403282251.i2SMp7OD010307@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] spinlock align code triggering bug in gcc?
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Sun, 28 Mar 2004 17:51:07 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200403282248.i2SMma2a010231@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Mar 28, 2004 05:48:36 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> > I'm not yet 100% sure about this one, but it seems like with the new
> > self-aligning spinlock code in the kernel, if you build the kernel with
> > hppa64-linux-gcc 3.3.3, the kernel generates incorrectly aligned code
> > when you bulid with -O2. You see something like this...
> > 
> > legolas[11:47] linux-2.6% make drivers/block/loop.o
> >   CC      drivers/block/loop.o
> > {standard input}: Assembler messages:
> > {standard input}:3701: Error: Field not properly aligned [8] (-183).
> > {standard input}:3701: Error: Invalid operands
> 
> Take a look at the assembler output for the above line.

I think this is a coding problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
