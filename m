From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Re: Calling all experts... ldd, s   0(%sr0, %r26),
	%r1!!!
Date: Sun, 8 Aug 2004 02:14:32 -0400
Message-ID: <20040808061431.GT2672@baldric.uwo.ca>
References: <20040807193802.GP2672@baldric.uwo.ca>
	<200408072101.i77L1DZX016782@hiauly1.hia.nrc.ca>
	<20040807215227.GQ2672@baldric.uwo.ca>
	<1091917524.1978.35.camel@mulgrave>
	<20040808050107.GS2672@baldric.uwo.ca>
	<1091943537.1727.39.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: lamont@debian.org,
 dave.anglin@nrc-cnrc.gc.ca,
 PARISC list <parisc-linux@lists.parisc-linux.org>,
 tausq@debian.org
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1091943537.1727.39.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Aug 07, 2004 at 10:38:51PM -0700, James Bottomley wrote:
> > This would require decoding the space register that the load used, and
> > seeing if it was non-zero. The alternative is just to make the LWS
> > faster and not set sr7 to kernel space, rather use another register to
> > do kernel loads and stores. You suggested this earlier but I didn't have
> > time to work it out.
> 
> The slight problem here is that the gateway page is execute only from
> userspace.  To load data from it, you have to be in kernel space. 
> However, as long as the privilege level is set to high, this should work
> provided you set up a space register for dereferencing the lws.

Yes, the problem here is that I need lock data available for SMP to work
properly. This involves, as you mentioned on IRC, adding another fixed
tlb entry that lets the user RW from lock data. This gets tricky because
such a page is technically visible from userspace and the locks could be
read and written to, messing up *other* CAS operations to other
addresses.

I think I might have to go the following route:

a. Enter kernel space (%r0 -> %sr7)
b. Use prober/probew
c. Add an exception for the user load and store, these happen with
   interrupts off. If such a page is in swap, I need the exception
   code to reenable interrupts and wait for the page to come back.

I *really* don't like 'c.' but it's always there if I have to turn off
interrupts and lock under SMP.  I guess atomic operations need a little
more support than normal operations... :)

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
