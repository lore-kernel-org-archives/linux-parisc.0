From: kyle@mcmartin.ca (Kyle McMartin)
Subject: Re: [parisc-linux] memory barriers, spinlocks, debuglocks, oh my
Date: Mon, 30 Aug 2004 00:37:32 -0400
Message-ID: <20040830043732.GB12022@mcmartin.ca>
References: <20040827163701.GA2414@mcmartin.ca>
	<20040828221524.GT2414@mcmartin.ca> <4132001E.6060707@tiscali.be>
	<20040829161318.GU2414@mcmartin.ca>
	<20040830040635.GA18211@colo.lackof.org>
	<20040830041419.GA12022@mcmartin.ca>
	<20040830043020.GB18273@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040830043020.GB18273@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Aug 29, 2004 at 10:30:20PM -0600, Grant Grundler wrote:
> Ah ok. But the original code you posted was this:
> +#define SPIN_UNLOCK(x) do {  \
> +                         __asm__ __volatile__ ("stw,ma %1,0(%0)" \
> +                         : : "r" (&(x)->lock), "r" (0) : "memory"); \
> +                       } while (0)
> 
This was what Randolph posted earlier in the thread, and I forgot to
spot the error. :\

> Sorry...but why did you back this change out in the next commit?
> 
> The comment "reverting unnecessary atomic.h changes" is correct.
> Strictly speaking, coherent stores are not required.
>
James pointed out that it wasn't necessary, and I wanted to keep changes
to a minimum for the next version of the 2.4.27 Debian packages that
Thibaut was creating.

Sorry for any confusion.

Regards,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
