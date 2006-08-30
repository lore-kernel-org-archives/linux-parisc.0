From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Wed, 30 Aug 2006 16:23:38 -0400
Message-ID: <119aab440608301323w309debf2g6635ce4757ac024b@mail.gmail.com>
References: <J4TKVV$8AA4E9E98C79A1A2778C0CBF8A96F048@scarlet.be>
	<20060830165211.GA3999@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Joel Soete <soete.joel@scarlet.be>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060830165211.GA3999@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 8/30/06, Grant Grundler <grundler@parisc-linux.org> wrote:
> On Wed, Aug 30, 2006 at 06:38:19PM +0200, Joel Soete wrote:
> > > 1. The timer interrupt fires, and 'now' comes after 'next_tick'
> > mmm (just a thought) what's up if now comes after next_tick but cr16 has
> > already wrap 1, 2, ... times?
>
> Every ~4 seconds a 32-bit cycle counter running 1Ghz will wrap.
> If it wraps twice between any two interrupts, I think we are already screwed.
> There is no way to detect that with a 32-bit kernel.  My hope is the same
> bug is visible on 64-bit kernel where we have 30 billion or so seconds
> before the counter will wrap.
>
> > > reported problems. Guy, would you mind patching your kernel with this
> > > patch and testing again?
> >
> > Make sense to me but patch doesn't works for me on b2k 32bit kernel ;-(
> > it was hanging (no error msg on lcd display) just after "Memory: 262144k
> > available" then I have to force reboot power off/on cycle.
>
> I'll give it a go as well.

It actaully turns out I don't think I ever booted this patch, my
palo.conf was hosed and I was writing the wrong kernel. It was too
good to be true :)

I'll have a go at testing this again tonight.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
