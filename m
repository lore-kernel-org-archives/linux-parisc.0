Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 28 Aug 2003 09:12:16 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
Message-ID: <20030828151216.GA23430@dsl2.external.hp.com>
References: <3F4D798800000061@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F4D798800000061@ocpmta7.freegates.net>
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

On Thu, Aug 28, 2003 at 09:04:40AM +0200, Joel Soete wrote:
> Hi Grant,
> 
> >AFAIK, a cacheline will get loaded as "shared clean"
> >until someone writes to it - which is when the cacheline ping-pong
> >starts.
> 
> Mhh would it not request some kind of ipc between cpu for cache management?

no.
IIRC instructions for purging the cache are broadcast to other CPUs.

> But to avoid usage of cache would it be possible to access global kernel's
> variable with absolute addressing mode? Is it feasible?

Since the caches use virtual indices, it would make sense when using
physically addresses to bypass the cache. But I don't know if that's
really the case or not. I would expect that described in the PA2.0 Arch
book.

> btw scaning code related to SMP I find in smp.c a very draft of
> an 'ipi_init()' but unfortunately 'Ignore for now.  *May* need this
> "hook" to register IPI handler'..., interesting isn't it :).

I wrote that. ipi_init and comments can be deleted.
I haven't seen a need for ipi_init(). When I originally
implemented the SMP support I thought it might be.

The IPI handler is statically "hooked" (aka registered) in
	arch/parisc/kernel/irq.c:cpu_irq_actions[]

See ipi_interrupt() for IPI implementation.

> Is there any other platform inplementing such stuff (I try to scan 2.4 src
> but not found anywhere else) or some reference on to implement it?

it == ?
IPI is implemented.

grant
