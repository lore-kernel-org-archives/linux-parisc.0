From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] memory barriers, spinlocks, debuglocks, oh my
Date: Sun, 29 Aug 2004 22:30:20 -0600
Message-ID: <20040830043020.GB18273@colo.lackof.org>
References: <20040827163701.GA2414@mcmartin.ca>
	<20040828221524.GT2414@mcmartin.ca> <4132001E.6060707@tiscali.be>
	<20040829161318.GU2414@mcmartin.ca>
	<20040830040635.GA18211@colo.lackof.org>
	<20040830041419.GA12022@mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040830041419.GA12022@mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Aug 30, 2004 at 12:14:19AM -0400, Kyle McMartin wrote:
> On Sun, Aug 29, 2004 at 10:06:35PM -0600, Grant Grundler wrote:
> > I think you missed Joel's point.
> > Where does SPIN_UNLOCK set the register that it stores to 1?
> > 
> Eh, that's what the "r" (...) does. As I understand it, GCC will have
> the value inside the brackets loaded into a register (in this case,
> %1 which can be any general register) when the execution path gets to
> the assembler.

Ah ok. But the original code you posted was this:
+#define SPIN_UNLOCK(x) do {  \
+                         __asm__ __volatile__ ("stw,ma %1,0(%0)" \
+                         : : "r" (&(x)->lock), "r" (0) : "memory"); \
+                       } while (0)

which used '"r" (0)' for input.

The correct version got committed though:
#define SPIN_UNLOCK(x) do {  \
		__asm__ __volatile__ ("stw,ma %1,0(%0)" \ 	 
		: : "r" (&(x)->lock), "r" (1) : "memory"); \ 	 
	} while (0)

Sorry...but why did you back this change out in the next commit?

The comment "reverting unnecessary atomic.h changes" is correct.
Strictly speaking, coherent stores are not required.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
