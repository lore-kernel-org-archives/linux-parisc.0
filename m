From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Mysterious hangs with parisc
Date: Thu, 6 Jul 2006 14:34:09 -0400
Message-ID: <20060706183409.GB5692@athena.road.mcmartin.ca>
References: <20060624015935.GJ12481@quicksilver.road.mcmartin.ca>
	<200606240241.k5O2fALQ001885@hiauly1.hia.nrc.ca>
	<20060705164734.GB30640@athena.road.mcmartin.ca>
	<44AD54F0.90508@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 James.Bottomley@SteelEye.com,
 parisc-linux@lists.parisc-linux.org,
 John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44AD54F0.90508@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jul 06, 2006 at 06:22:40PM +0000, Joel Soete wrote:
>  [<000000001011cc08>] smp_do_timer+0x70/0x80

You're running an SMP kernel.

time.c:

static inline unsigned long
gettimeoffset (void)
{
#ifndef CONFIG_SMP
	/*
	 * FIXME: This won't work on smp because jiffies are updated by cpu 0.
	 *    Once parisc-linux learns the cr16 difference between processors,
	 *    this could be made to work.
	 */

	long last_tick;
	long elapsed_cycles;

	/* it_value is the intended time of the next tick */
	last_tick = cpu_data[smp_processor_id()].it_value;

	/* Subtract one tick and account for possible difference between
	 * when we expected the tick and when it actually arrived.
	 * (aka wall vs real)
	 */
	last_tick -= clocktick * (jiffies - wall_jiffies + 1);
	elapsed_cycles = mfctl(16) - last_tick;

	/* the precision of this math could be improved */
	return elapsed_cycles / (PAGE0->mem_10msec / 10000);
#else
	return 0;
#endif
}

Now let's look at the comment for James' change:

<quote>
Apparently gettimeoffset can return small negative values (usually in
the 100us range).  If xtime.tv_nsec is accidentally less than this,
though (a fortunately unlikely event) it triggers the loop forever.

I've added a test and correct adjustment for this case.  It has a
warning printk in there which I'd like to leave for the time being
just in case this problem implicates some other part of the kernel.
</quote>

I don't see 0 being a small negative value. ;-)

James' fix only applied to UP builds. :)

Cheers,
	Kyle M.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
