Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 25 Sep 2003 17:35:00 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] N Class SMP pb ?  (follow up)
Message-ID: <20030925233500.GA18861@dsl2.external.hp.com>
References: <3F5CC41F00008D27@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F5CC41F00008D27@ocpmta3.freegates.net>
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

On Thu, Sep 25, 2003 at 04:56:26PM +0200, Joel Soete wrote:
...
> As already mentionned in previous mail that I could read many 6, 15 (but
> it seems to be normal in UP kernel those interruption occurs)


Yes - 6 is ITLB miss and 15 is Data TLB miss.

> but (most interesting) it is the very first time that I got
> the message making failed the kernel:
> [...]
> handle_interruption(26, ...).

26 is "Data Memory Access rights Trap".
This sounds normal for Copy-On-Write.

> SMP CALL FUNCTION TIMED OUT (CPU=1)

The IPI handler will time out if the other CPU doesn't ack
the function call with in a second. This is bad.
It means either other CPU never got the interrupt (locked up
with I-bit off) or the "unstarted_count" isn't coherent
between the CPUs.

> handle_interruption(26, ...).
>
> Could this be a pb with sync between cpu time ref?
> (because timeout = jiffies + HZ)

I don't think so since jiffies is a global.
And it's always be measured on the same CPU.

> I have also a look for where this function is called but never see its return
> code tested to launch a 'stack dump' and a stop of system?

You need to find out who is using smp_call_function() and which function
they are trying to invoke. I suspect it's coming from mm/slab.c but
would know which of the three it might be.

grant
