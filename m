Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 136944891
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Jan 2004 03:06:34 -0700 (MST)
Date: Wed, 7 Jan 2004 02:14:07 -0800
From: Randolph Chung <randolph@tausq.org>
To: Riccardo <rollei@tiscalinet.it>
Subject: Re: [parisc-linux] LMBench results on for the C200 for HP-UX 10.20,
	Linux 2.4.24-pa0, and Linux 2.6.0-pa8
Message-ID: <20040107101406.GS533@tausq.org>
References: <1073466464.752.112.camel@laptop.bradetich.net>
	<3FFBD4DF.ECB0ABBC@tiscalinet.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FFBD4DF.ECB0ABBC@tiscalinet.it>
Cc: ryan_bradetich@hp.com, parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> HP-UX fork is fast! linux 2.6 seems to bring some relief here. I always
> marvel how fast HP-UX is when responding to a telnet login.
> Instantaneus. Probably fork() speed compensates the lower latency linux
> has in other areas.

The reason why fork() is so slow on palinux is that we flush the entire
cache for each fork() operation. this is clearly a very bad thing.
unfortunately this doesn't seem like a simple thing to fix. From some
previous discussions it seems like we don't need to do the cache
flushing for fork(), but when i got rid of it the system crashes very
quickly. Possibly the per-fork cache flush is masking other bugs in the
kernel cache flushing infrastructure.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
