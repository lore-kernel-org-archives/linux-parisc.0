Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C442482C
	for <parisc-linux@parisc-linux.org>; Thu, 29 Nov 2001 12:02:48 -0700 (MST)
Received: from puffin (IDENT:grundler@localhost [127.0.0.1])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id LAA02339
	for <parisc-linux@parisc-linux.org>; Thu, 29 Nov 2001 11:58:19 -0700
Message-Id: <200111291858.LAA02339@puffin.external.hp.com>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] travel backwards in time? 
In-Reply-To: Message from Randolph Chung <randolph@tausq.org>
   of "Thu, 18 Oct 2001 13:21:45 PDT." <20011018132145.H4123@tausq.org>
Date: Thu, 29 Nov 2001 11:58:19 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Randolph Chung wrote:
> Recently Grant and I have observed several hangs in do_gettimeofday on a
> c3k running 32 or 64-bit kernels (UP). 
> 
> The symptom we see is gettimeoffset returns a negative number which
> results in a huge (unsigned) usec offset in do_gettimeofday, which ends
> up spinning in a while loop.
...
> The last_tick adjustment looks a bit odd. Looking at ia64, it looks more
> like this:
> 
>         last_tick -= clocktick * (jiffies - wall_jiffies + 1);

For the record, this fix was committed in one of the 2.4.14-pa5
http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2001-November/030021.html

I'm still not 100% certain all our time keeping code is correct.
But I'm comfortable this patch fixes the problem we saw and
does not introduce any new ones.

grant
