Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id CACF64840
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 Oct 2003 11:34:33 -0600 (MDT)
Date: Mon, 6 Oct 2003 13:31:23 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>,
	parisc-linux@lists.parisc-linux.org
Cc: Matthew Wilcox <willy@debian.org>,
	James Bottomley <James.Bottomley@steeleye.com>,
	Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] sched_clock implementation
Message-ID: <20031006173123.GD27512@systemhalted>
References: <20031006142006.GB27512@systemhalted> <3F5CB6FB0000DCF3@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F5CB6FB0000DCF3@ocpmta1.freegates.net>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Oct 06, 2003 at 05:22:15PM +0200, Joel Soete wrote:
> >>
> >>On Sun, Oct 05, 2003 at 03:43:16PM +0000, Joel Soete wrote:
> >> +        spin_lock_irq(&pdc_lock);
> >> +        retval = mem_pdc_call(PDC_TOD, PDC_TOD_ITIMER, 
> >> __pa(pdc_result), 0);
> >> +        convert_to_wide(pdc_result);
> >
> >Your mailer is folding lines.
> 
> hmm mozilla? i think much more an error in cup and paste between a xterm
> and mozilla: my bad sorry (i just forgot to attach the file)
> 
> >Aside from that the patch looks interesting.
> 
> Thanks :)
> 
> >It could be used to find
> >the rate at which cr16 is running, and then we can use that as an HP
> >timer into userspace.
> 
> Yes, still have to find out how cr16 is init (mtctl(16,...) i presume but
> which  value?) and also I still have to see how to use data in userspace?

The issue is that cr16 is going to overrun at some point. We need to
track the overrun to track an accurate tick count. If we used another
32-bit quantity to tick on every cr16 overrun then we'd get overrun 
for this value in the range of ~800 years.

Pseudo 64-bit clock:

cr16 tick tick tick ... 2^32, 0, 1, 2 ...
crOV 0 ................ 0,    1, ........

So we add code to the jiffie update to see if cr16 has overrun, if it
has we update the overrun counter. You can then use the current cr16,
the overrun counter, and the bootup cr16 to calculate time accurate to
your CPU's MHz. On my 650MHz box that's somewhere near the 2 ns mark.

We need a way to calculate a difference between two times:

NOTES: No locks needed since I'm not updating anything, just reading.

==== Kernel view ====
Kernel Light weight syscall: get_current_diff(old_cr16, old_overrun,
                                              &delta_cr16, &delta_overrun)
input:
	old_cr16
	old_overrun

- Disable interrupts
- Get CPU #
 - Get Bootup cr16 for cpu (boot_cr16)

 /* Comprise a pseudo-64 bit clock */
 - Get Overrun cr16 for cpu (overrun_cr16)
 - Get Current cr16 for cpu (current_cr16)

 /* Does normalization go away if we can accurately sync all the
    cpu cr16's at bootup? Re: Grant's discussion about loop and
    sync */

 /* Normalize based on boot_cr16 (And drift?) */
 if ( boot_cr16 > current_cr16 ){
    new_overrun = overrun_cr16 - 1;
    new_cr16 = (2<<32) - (boot_cr16 - current_cr16); 
 } else {
    new_overrun = overrun_cr16;
    new_cr16 = current_cr16 - boot_cr16;
 }

 /* overrun offset (~800 year period on 650MHz with 32-bit clock) */
 if( new_overrun > old_overrun ){
   /* First overrun is calculated by -ve delta_cr16, so -1 */
   delta_overrun = new_overrun - old_overrun - 1;
 }

 /* cr16 underflow? (~6s period on 650MHz with 32-bit clock) */
 if( old_cr16 > new_cr16 ){
   /* Adjust for 1 overrun */
   delta_cr16 = (2<<32) - (old_cr16 - new_cr16);
 } else {
   delta_cr16 = new_cr16 - old_cr16;
 }
 /* WARNING: ADJUST FOR TIME TAKEN IN THIS ROUTINE? */

output:
	delta_cr16
	delta_overrun

- Enable interrupts 
====
Kernel Light Weight Syscall: get_current_time(&user_cr16, &user_overrun)

- Disable interrupts
- Get CPU #
 - Get Bootup cr16 for cpu (boot_cr16)

 /* Comprise a pseudo-64 bit clock */
 - Get Overrun cr16 for cpu (overrun_cr16)
 - Get Current cr16 for cpu (current_cr16)

 /* Does normalization go away if we can accurately sync all the
    cpu cr16's at bootup? Re: Grant's discussion about loop and
    sync */

 /* Normalize based on boot_cr16 (And drift?) */
 if ( boot_cr16 > current_cr16 ){
    *user_overrun = overrun_cr16 - 1;
    *user_cr16 = (2<<32) - (boot_cr16 - current_cr16); 
 } else {
    *user_overrun = overrun_cr16;
    *user_cr16 = current_cr16 - boot_cr16;
 }
 /* WARNING: ADJUST FOR TIME TAKEN IN THIS ROUTINE? */

- Enable interrupts
Output:
	user_cr16
	user_overrun
====

==== Userspace View ====

cr16_bitwidth=`/proc/cpuinfo | grep cr16_bitwidth | sed 's/cr16_bitwidth=//g'`
cr16_period=`/proc/cpuinfo | grep cr16_period | sed 's/cr16_period=//g'`

get_current_time(&user_cr16, &user_overrun);
... Code ...
get_current_diff(user_cr16, user_overrun, &delta_cr16, &delta_overrun);

nano_diff = delta_overrun * (2<<cr16_bitwidth) * cr16_period +
            delta_cr16 * cr16_period

====

With a 64-bit kernel and cpu these problem all go away. 

c.
