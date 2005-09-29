From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: 2.6.14-rc2-pa2 ccio patch
Date: Thu, 29 Sep 2005 09:43:08 -0600
Message-ID: <20050929154308.GA29975@colo.lackof.org>
References: <20050929064709.GA22206@colo.lackof.org>
	<200509291513.j8TFDjxN010783@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200509291513.j8TFDjxN010783@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Sep 29, 2005 at 11:13:45AM -0400, John David Anglin wrote:
> Specifying sr0 will cause fdc to use the space id in sr0.  There's no
> mapping to sr4-7.  This mapping is available when generating PA 2.0
> code with current cvs binutils, but only if you *do not* specify sr0.
> In PA 2.0, there are two different instruction formats for fdc (2 and
> 3-bit space register formats).

Uhm, in my copy of the book, page 7-51 shows two formats, both with
a 2-bit "s" field and clearly indicates a "space_select(s,...)" operation.

>   Only the 2-bit format has the mapping
> to sr4-7.  The 2-bit format is not available when generating PA 1.x code.

page 5-171 of my PA 1.1 book shows only a 2-bit 's' field (and indexed
by register) for FDC. Did you flip to the next page and are by
accident reading the FIC (which only has 3-bit s field) instruction?

> 
> > -	asm volatile("fdc 0(%0)" : : "r" (pdir_ptr));
> > +	asm volatile("fdc %%r0(%%sr0,%0)" : : "r" (pdir_ptr));
> 
> For this to work in PA 1.x, you need to load the space id selected
> by %0 into sr0, or ensure the kernel space id is put in sr0.  Doesn't
> sr4 have the kernel space id in it?

Yes and Yes. But my reading of the PA1.1 arch says it *only* has a 2-bit
s field.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
