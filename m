From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] some more questions about __raw_write_trylock()
	hppa implementation
Date: Thu, 31 Aug 2006 08:01:30 -0500
Message-ID: <200608310801.30580.mszick@morethan.org>
References: <44F5F3CB.30806@scarlet.be> <20060831060637.GF3999@colo.lackof.org>
	<20060831123135.GC4919@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060831123135.GC4919@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu August 31 2006 07:31, Matthew Wilcox wrote:
> 
> Better ideas, anyone?
> 

better? not sure, but one thing I am looking at using is
tri-state locks, defined as:

0 == Busy, change in process
&lock == Locked
other == Unlocked

Since that can be done with load&clear and the information
already on hand in the registers.

That is also compatible with the single-linked, bi-directional
lists of requesters - I.E: the values and the lock are also
the head (or tail) of the list. (race free)

No actual code to offer at this time.

Not my idea, took it from one of the references mentioned
in my pa-risc synchronization constructs write-up.

Hmmm...
That might be usable (the tri-state logic) in dealing with
a wrapping timer cr16 also.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
