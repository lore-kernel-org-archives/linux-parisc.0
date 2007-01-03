From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: [RFC][PATCH] use cycle_t instead of u64 in
	struct time_interpolator
Date: Wed, 3 Jan 2007 21:23:21 +0100
Message-ID: <200701032123.21276.deller__40609.5411316075$1416624251$gmane$org@gmx.de>
References: <200701022233.25697.deller@gmx.de>
	<200701031936.36423.deller@gmx.de>
	<1167851879.5937.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: linux-kernel@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org,
 Christoph Lameter <clameter@sgi.com>
To: john stultz <johnstul@us.ibm.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1167851879.5937.8.camel@localhost.localdomain>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed Jan 3 2007, john stultz wrote:
> On Wed, 2007-01-03 at 19:36 +0100, Helge Deller wrote:
> > On Wed Jan 3 2007, Christoph Lameter wrote:
> > > On Tue, 2 Jan 2007, Helge Deller wrote:
> > >
> > > > As far as I could see, this patch does not change anything for the
> > > > existing architectures which use this framework (IA64 and SPARC64),
> > > > since "cycles_t" is defined there as unsigned 64bit-integer anyway
> > > > (which then makes this patch a no-change for them).
> > >
> > > The 64bit nature of some entities was so far necessary to get the
> > > proper accuracy of interpolation. Maybe it can be made to work with 32 bit
> > > entities. The macro GET_TI_SECS must work correctly and the less bits are
> > > specified in shift the less self-tuning accuracy you will get.
> > 
> > Yes, it was easily possible to make it 32bit-ready without loosing the accuracy.
> > 
> > Nevertheless, in the meantime John Stultz pointed me to the CONFIG_GENERIC_TIME framework,  and I implemented it that way:
> > http://git.parisc-linux.org/?p=linux-2.6.git;a=commit;h=b6de83b58b8b07f057deacdef8a95b6c32d1c4e6
> 
> This looks pretty good, although setting the rating to 200 for a
> clocksource you don't want to use seems a bit high (there's a rough
> rating scale in clocksource.h). Zero is probably what you want to use
> there.
> 
> > http://git.parisc-linux.org/?p=linux-2.6.git;a=commit;h=f70a979c843e4610edfb2a316648fe8ae8718f69
> 
> This looks to be correct, although as the clocksource infrastructure
> evolves it looks like we'll be removing the update_callback code in the
> future. So this is fine for now, but will probably need a reevaluation
> at some point.
> 
> Also to avoid jumping between clocksources, I'd keep the initial
> disqualification that occurs before you register the clocksource
> (otherwise it will be used for one tick, then be disqualified and you're
> back to jiffies).

That's true, but James Bottomley noticed, that time_init() is called before 
we've done system inventory (which detects if we have a SMP box with multiple CPUs),
so num_online_cpus() would always be one. The update_callback function enables
us to switch back to jiffies if we actually run on a SMP box.

That said, it would be nice to keep the update_callback() functionality or provide another
nice solution around that problem...

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
