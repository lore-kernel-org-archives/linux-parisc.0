From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Mon, 24 Apr 2006 13:00:13 -0500
Message-ID: <200604241300.13265.mszick@morethan.org>
References: <200604241535.k3OFZmPJ027261@hiauly1.hia.nrc.ca>
	<200604241135.58306.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604241135.58306.mszick@morethan.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon April 24 2006 11:35, you wrote:
> On Mon April 24 2006 10:35, you wrote:
> > > ldcw,co target_address
> > > 
> > > Where target_address includes the magic byte[0] of 
> > > the cache line.
> > 
> > Where is this documented?
> > 
> Well, they didn't put it in the instruction RTL where
> someone could find it.  It is a footnote or mentioned
> in passing somewhere.
> 
> I will look for it, I found it about 5 years ago when
> Matt and I discussed this on the list, I can find it again.
> 

Still looking...

> But it is reasonable - you don't want to waste the cache
> coherency bandwidth with every ldcw,co in the cache line.
> 
> > > Translation:
> > > 
> > > Spin on the ldcw,co not the ldw here.
> > 
> > I believe this makes sense as the errata specifies that the ldcw,co
> > operation has to be performed in cache on PA 2.0 machines:
> > http://h21007.www2.hp.com/dspp/tech/tech_TechDocumentDetailPage_IDX/1,1701,5310,00.html
> > 
> 

Right, notice that it was at the request of HP-UX group for non-I/O
devices.

Think of it this way:

ldcw, co Cache_Line[0]

The hardware, system wide, exclusive lock for this cache line.

A cache line is a big place...

ldcw, co Cache_Line[4 .. max-4]

This cpu now owns the cache line, so the other cpus do not need
to be updated, nor the cache coherency bandwidth burned up...
The non-zero cache line offset does this trick.

These are the per-cpu (cache line owner) semaphores (and/or data) for 
the multiple threads of execution that are servicing whatever caused
the cache line to be grabbed on a machine wide, exclusive lock.

But if our cpu is going to be a polite neighbor to the other cpus
in the machine, it will have to use an instruction (+completer)
that is immediately observable by the other cpus when it is done
with the hardware wide lock.

Yo - Software Engineering, are you home?

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
