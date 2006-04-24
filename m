From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Mon, 24 Apr 2006 11:35:58 -0500
Message-ID: <200604241135.58306.mszick@morethan.org>
References: <200604241535.k3OFZmPJ027261@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604241535.k3OFZmPJ027261@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon April 24 2006 10:35, you wrote:
> > ldcw,co target_address
> > 
> > Where target_address includes the magic byte[0] of 
> > the cache line.
> 
> Where is this documented?
> 
Well, they didn't put it in the instruction RTL where
someone could find it.  It is a footnote or mentioned
in passing somewhere.

I will look for it, I found it about 5 years ago when
Matt and I discussed this on the list, I can find it again.

But it is reasonable - you don't want to waste the cache
coherency bandwidth with every ldcw,co in the cache line.

> > Translation:
> > 
> > Spin on the ldcw,co not the ldw here.
> 
> I believe this makes sense as the errata specifies that the ldcw,co
> operation has to be performed in cache on PA 2.0 machines:
> http://h21007.www2.hp.com/dspp/tech/tech_TechDocumentDetailPage_IDX/1,1701,5310,00.html
> 

Now there is a footnote that applies here...

Those instruction descriptions do not always mention side-effects,
even less often do they mention the exceptions to the side-effects.

An exception (footnoted somewhere):
ldcw,co does not set the dirty bit on the dcache line.

Which makes sense, if you recall that we are in the first clause
of that indivisible RTL block - the one that avoids the Dcache flush
and corresponding memory cycles.

If the instruction had the usual side-effect of setting the dirty
bit on the cache line, then we would not be avoiding the Dcache flush
and the memory cycle (sooner or later).

So spinning on the ldcw,co is evidently what the hardware people had
in mind.  It will not generate a bunch of Dcache flushes.

Since there is no way to clear the lock with ldcw,co then when the
lock is cleared, then there must be another magic completer that needs
to be used on the instruction that resets the condition to '1' (unlocked).

Something that triggers the cache coherency system so the change is
immediately observable by all cpus.

But this is also reasonable - since the lifetime of the release period
could well be longer than the lifetime of the cache line.  Common memory
is the only place for long term storage of the released lock.

I have not found that reference yet either.  It will be one of the cache
'hints' (actually a command in this case).

> > On the systems with 128 byte long cache lines,
> > ensure these spinlocks are 128 byte aligned not
> > 64 byte aligned as in this dump.
> 
> As a practical note, this is very difficult to achieve for dynamically
> allocated spinlocks.
> 

Yea, I understand, will have to refer that to the software engineering
department.  This is the non-HP Hardware Engineering (retired) Department.

Just imagine that the non-HP Hardware Engineering (retired) Department is
temporarily out of hyper-link ink.

> The intent of the errata seems to be to relax the alignment requirement
> for ldc[dw],co in cases where the spinlock is not being shared with a
> non-coherent I/O device.  If spinlocks have to be aligned to the start
> of a cacheline, there doesn't seem to be any point to the errata.
> 

This really applies more to the second clause and/or when you have
multiple semaphores per cache line.  Also, for I/O, there is normally
no cache coherency signals between the I/O devices and the cpu(s).

Which is why non-HP systems do cache snooping.

Mike

> Dave
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
