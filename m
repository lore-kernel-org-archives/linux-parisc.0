Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 6 Oct 2003 10:20:06 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] sched_clock implementation
Message-ID: <20031006142006.GB27512@systemhalted>
References: <20030918203510.GD21596@parcelfarce.linux.theplanet.co.uk> <3F6B2199.8050402@tiscali.be> <20030919160035.GG18225@systemhalted> <3F6C9622.60402@tiscali.be> <20030921000447.GC31268@dsl2.external.hp.com> <3F803C14.4030900@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F803C14.4030900@tiscali.be>
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

On Sun, Oct 05, 2003 at 03:43:16PM +0000, Joel Soete wrote:
> +        spin_lock_irq(&pdc_lock);
> +        retval = mem_pdc_call(PDC_TOD, PDC_TOD_ITIMER, 
> __pa(pdc_result), 0);
> +        convert_to_wide(pdc_result);

Your mailer is folding lines.

Aside from that the patch looks interesting. It could be used to find
the rate at which cr16 is running, and then we can use that as an HP
timer into userspace. The next portion is solving the monotic
requirement on the clock (e.g. follow the idea of 3 cr16 reads to catch
a reschedule).

c.
