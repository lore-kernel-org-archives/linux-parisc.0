From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PA8800/ZX1 support committed to 2.6.7-rc2-pa2
Date: Mon, 14 Jun 2004 17:42:21 -0600
Message-ID: <20040614234221.GB22331@colo.lackof.org>
References: <20040614182903.GA15866@colo.lackof.org>
	<00d101c45261$4cc23d80$f463f40f@jh733133>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: 'PARISC list' <parisc-linux@lists.parisc-linux.org>
To: Jim Hull <jim.hull@hp.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <00d101c45261$4cc23d80$f463f40f@jh733133>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 14, 2004 at 03:45:32PM -0700, Jim Hull wrote:
...
> You could imagine an architecture having several variants of the cache flushing
> instructions that software could call depending on why it needed to flush; for
> example, to achieve I-cache/D-cache coherence, to resolve virtual aliasing, to
> communicate with non-coherent I/O devices, or to flush out to a battery-backed
> RAM in case of powerfail.
> 
> I think pa-linux wants the second of these.

Yes - I left out that part in my paraphrasing of "someone" 's comments.

>   Unfortunately, PA only has a single
> variant, and it was designed for the third and fourth cases.

ok.

> > 2) "borrowed" from HPUX (i80_latest, maybe HPUX wants to use
> >    Jim Hull's suggestion as well?)
> 
> This one is almost correct.  If "block" is 1 or 2, it gets the right
> answer - it's only wrong for "block" values of 3 or more.
> I suspect that HPUX appears to work only because no PDC has ever
> returned anything other than 1 for "block".

Ok. And PDC probably won't if they don't have to even if it would
be more efficient because of "pre-enablement" of existing OS.
I have no idea if PDC ever will need to.

> > 3) "New and Improved" :^)
> 
> And correct!  If you'd like a more optimized version, this is equivalent:
> 
> #define CAFL_STRIDE(cnf) (cnf.cc_line << (3 + cnf.cc_block + cnf.cc_shift))

yes - that's nicer. I'll keep the original "simple math" version
to document the origin.

> Yes, the Mako ERS says that DIAG_SPHASH_ENAB is still bit 54 in
> diag register 2.

Ok - thank you.

I'm out of ideas for the moment what might be wrong.
Maybe I'll troll the HPUX source tree for any PA8800 
or ZX1 specific code changes...

*sigh*

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
