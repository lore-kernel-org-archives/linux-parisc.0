From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Debugging 64-bit kernel crashes involving
Date: Sun, 25 Feb 2007 23:19:32 -0600
Message-ID: <1172467172.3423.39.camel__26710.3462516845$1416624317$gmane$org@mulgrave.il.steeleye.com>
References: <200702240039.l1O0dCxG017471@hiauly1.hia.nrc.ca>
	<1172277920.3424.83.camel@mulgrave.il.steeleye.com>
	<119aab440702251819u1a070512j2cb8ca2eeadf0962@mail.gmail.com>
	<1172461983.3423.34.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1172461983.3423.34.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2007-02-25 at 21:53 -0600, James Bottomley wrote:
> On Sun, 2007-02-25 at 21:19 -0500, Carlos O'Donell wrote:
> > current->comm, and cr8 included in the dump.
> 
> Thanks!
> 
> > sr00-03  0000000000077000 0000000000000000 0000000000000000 0000000000077000
> > sr04-07  0000000000077000 0000000000077000 0000000000077000 0000000000077000
> > 
> > IASQ: 0000000000077000 0000000000077000 IAOQ: 0000000040723f2c 0000000040723f2f
> >  IIR: 43ffff40    ISR: 0000000000000000  IOR: 0000000000000000
> >  CPU:        0   CR30: 000000009af10000 CR31: 0000000040848000
> >  ORIG_R28: 0000000042c774c8
> >  CR8: 00000000000001e0
> 
> Perfect, 0x1e8 on a 64 bit kernel (where SPACEID_SHIFT is 11) is
> 0x78000.  This means that the protection and the space are indeed
> mismatched ... we just have to find out how, sigh!

OK, I have a theory.  It has to do with the way we do flush_tlb_mm by
incrementing the spaceid.  This works in a single space per process
model.  However, a process with multiple threads has >1 scheduling
context which share spaces.  So, the theory goes that when we fork from
a thread, we execute flush_tlb_mm which bumps the context (space).  Then
we schedule another thread in the same process.  However, this picks up
its space registers from the task rather than the mm->context, so it
uses the old mm.  Now, the load context has updated %cr8, the protection
ID.  However %cr8 isn't part of the task context, so we end up executing
in the old context with the protection of the new one ... resulting in a
protection ID trap.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
