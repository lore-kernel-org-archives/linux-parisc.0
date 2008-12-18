From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Thu, 18 Dec 2008 11:16:31 -0500
Message-ID: <119aab440812180816q32367d3ek87f376dce9f9dbfd@mail.gmail.com>
References: <20081218004329.GB30438@bombadil.infradead.org>
	 <20081218030214.5CABB4E99@hiauly1.hia.nrc.ca>
	 <20081218040400.GE30438@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: "Kyle McMartin" <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081218040400.GE30438@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 17, 2008 at 11:04 PM, Kyle McMartin <kyle@infradead.org> wrote:
> On Wed, Dec 17, 2008 at 10:02:13PM -0500, John David Anglin wrote:
>> > Eh? r22 is 0020fd0e... although it's easier to spot by looking at IOR
>> > > >  IIR: 0ed5d240    ISR: 00000847  IOR: 0020fd0e
>>
>> Obviously, I can't count...
>>
>> > Although, I don't think we're supposed to ever be taking a P. Id trap on
>> > a userspace process as the kernel...
>>
>> Ok, should P and/or D be on?
>>
>
> Huh... Possibly the P-bit shouldn't be on for kernel mode... the kernel
> after all can scribble on whomevers pages it so chooses...

IMO the kernel should run with the P-Bit on.

Disabling the P-Bit could potentially mask stale TLB entry bugs.

Imagine this scenario:
1. Context switch to process A, setup protection ids, setup TLB entries.
2. Context switch to process B, setup protection ids, incorrectly
setup TLB entries (entries from process A remain).
3. Kernel tries to access process B's page but triggers TLB entry for
process A and gets a data protection id trap.

The trap in #3 is correct since we used a stale TLB entry.

What I don't know is this: Are all of process A's tlb entries purged
at context switch? Do they have to be?

Do we implement lazy tlb flushing? Do process A's tlb entries only get
flushed when they trigger a data protection id trap?

>> There might be a problem restoring access IDs after a cache purge or
>> TLB insertion.
>>
>
> I honestly have no idea how the protection id registers are loaded... I
> thought it had something do with with space registers, but I can't
> remember off the top of my head.

I would imagine protection id registers are loaded at every context switch?

Do threads have the same protection id register values (and the same
space register) such that they can access the same pages?

c.
