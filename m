From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Heavy Iron Reference Docs
Date: Sun, 30 Apr 2006 01:03:02 -0600
Message-ID: <20060430070302.GA32765@colo.lackof.org>
References: <200604292250.49455.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Michael S. Zick" <mszick@morethan.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604292250.49455.mszick@morethan.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Apr 29, 2006 at 10:50:49PM -0500, Michael S. Zick wrote:
...
> Although these are titled V-Class servers they seem to
> be the only documentation on the PA8x00 coherent memory
> system outside of the HP vaults.

On page "20 of 248" for V2500 doc:
    "This document does not attempt to duplicate information in that
     manual. Instead, it presents only V2500 server-specific information."

And ISTR V-class has "unique" constraints on coherency.
Sorry - I've forgotten details. But you might start on
page "71" (aka page 89 using xpdf numbering):
|  The instructions which flush based on a memory line address are PDC,
|  FDC and FIC. These instructions are broadcast to other processors
|  within a node that may be sharing the same cache lines. These
|  instructions, therefore, have global effects within a node.
...
|  Cache flush instructions must be followed by a sync instruction to ensure
|  that all flushes have made it to memory.

and Page "75" (aka page 93 of pdf):
|  CTI cache interfaces
|  The PA-RISC architecture (1.0 and 2.0) does not support the concept of a
|  CTI Cache. Thus, there are no PA-RISC architected instructions for
|  issuing the CTI cache operations.

Seems to state V2500 NUMA implementation is NOT supported by the general
PA 2.0 architecture. Be very careful to not generalize statements made in
the V-class specific documents.

I'm currently only certain cc-NUMA V-2500 has cache coherency issues
with DMA.  A seperate exciting topic for discussion once I've retired.
(at least another 20 years or so)  :)


> Contain a lot of useful information, like how to make
> coherent semaphores (spinlocks) work on the PA8x00
> server classes.

How to implement spinlocks on V2500 is not necessarily the
same set of requirements for all other classes of PA20 machines.
Keep in mind parisc-linux currently does NOT support any V-class
machines - ie we have no ability to test theories about locking
other than with HP-UX.


Lastly, if other HP employees get permission to redistribute
the V-class PDF files, I'd be happy to put them on ftp.parisc-linux.org.
Until parisc-linux kernel supports V-class, I have no interest in
pursuing permission to do redistribute those documents.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
