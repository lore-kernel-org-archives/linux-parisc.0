From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Tue, 15 May 2012 10:13:32 +0100
Message-ID: <1337073212.3005.12.camel@dabdike.lan>
References: <4FA9975C.5060708@bergerie>
	 <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>
	 <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>
	 <4FAEE943.2030203@gmx.de> <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>
	 <4FB182F8.2040403@gmx.de> <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>
	 <1337069366.3005.10.camel@dabdike.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Helge Deller <deller@gmx.de>, Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1337069366.3005.10.camel@dabdike.lan>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2012-05-15 at 09:09 +0100, James Bottomley wrote:
> On Mon, 2012-05-14 at 18:38 -0400, John David Anglin wrote:
> > On 14-May-12, at 6:11 PM, Helge Deller wrote:
> > 
> > > The B160L and the 715/64 (both 32bit-only PA1.X machines) crashed  
> > > with the following trace.
> > > All logs attached.
> > >
> > > Any ideas?
> > 
> > This is exactly the same failure as reported by Vincent.
> > 
> > The most likely problem is the PA 1.1 tmpalias support in entry.S is  
> > broken.  For example,
> > the cache stride that is loaded in flush_dcache_page_asm to register  
> > r1 is wrong.  Probably,
> > the do_alias macro is wrong for PA 1.1.  This is hunk of code that  
> > should be executed
> > when a fdc non access fault occurs.
> > 
> > nadtlb_check_alias_11:
> >          do_alias        spc,t0,t1,va,pte,prot,nadtlb_emulate
> > 
> >          idtlba          pte,(va)
> >          idtlbp          prot,(va)
> > 
> >          rfir
> >          nop
> > 
> > The TLB insert instructions on PA 1.1 have a different format than on  
> > PA 2.0.  I'm not sure
> > how this would corrupt r1.
> > 
> > On the other hand, I had asked Vincent to put a "b,n ." instruction  
> > just before the fdc loop,
> > boot, hit the TOC button, and capture the setup registers for the  
> > flush operation.  It's possible
> > the stride variable has been clobbered.
> 
> Actually, I don't think it's that.  I built a PA 1.1 only kernel and
> booted it successfully on the C360.  That exercises all the _11 paths,
> so I don't think there's a code fault.  I do think there's a non PA1.1
> instruction in there somewhere that the C360 wouldn't notice.

OK, I think this is the problem.  We have a depd instruction in do_alias
which is now in the _11 fault paths.

This should be the fix, if someone wants to test it before I can get
around to building it.

James

---

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 6f05944..5350342 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -581,7 +581,11 @@
 	 */
 	cmpiclr,=	0x01,\tmp,%r0
 	ldi		(_PAGE_DIRTY|_PAGE_READ|_PAGE_WRITE),\prot
+#ifdef CONFIG_64BIT
 	depd,z		\prot,8,7,\prot
+#else
+	depw,z		\prot,8,7,\prot
+#endif
 	/*
 	 * OK, it is in the temp alias region, check whether "from" or "to".
 	 * Check "subtle" note in pacache.S re: r23/r26.


