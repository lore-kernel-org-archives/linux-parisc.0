Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 928D0482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Nov 2001 05:21:07 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 5D35EB00D; Thu, 29 Nov 2001 12:22:05 +0000 (GMT)
Date: Thu, 29 Nov 2001 12:22:05 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] keyboard_tasklet bug?
Message-ID: <20011129122205.Z13057@linuxcare.com>
References: <1007019927.14588.9.camel@beavis>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1007019927.14588.9.camel@beavis>; from rbradetich@uswest.net on Thu, Nov 29, 2001 at 12:45:26AM -0700
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

On Thu, Nov 29, 2001 at 12:45:26AM -0700, Ryan Bradetich wrote:
> Hello parisc-linux hackers,
> 
> I have spent the last couple of evenings exploring new (to me anyways)
> parts of the kernel tracking down a SMP hang on my C200+.  What I found
> appears to be a more generic bug, so I'm posting it here for ideas on
> how to fix it, or for someone to explain to me why this isn't a bug :)

Sounds very similar to the problem I fixed with the led tasklet

#ifdef CONFIG_CHASSIS_LCD_LED
        /* Only schedule the led tasklet on cpu 0, and only if it
         * is enabled.
         */
        if (cpu == 0 && !atomic_read(&led_tasklet.count))
                tasklet_schedule(&led_tasklet);
#endif

where I added the atomic_read() call.  In that case it wasn't hanging
my (UP) machine, but it left ksoftirqd_CPU0 at 100% CPU.

Richard
