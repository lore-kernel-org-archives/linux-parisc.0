Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 26 Sep 2003 10:50:45 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] N Class SMP pb ?  (follow up)
Message-ID: <20030926165045.GB11759@dsl2.external.hp.com>
References: <3F704CAF00001DCF@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F704CAF00001DCF@ocpmta2.freegates.net>
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

On Fri, Sep 26, 2003 at 05:46:35PM +0200, Joel Soete wrote:
> >It means either other CPU never got the interrupt (locked up
> >with I-bit off) or the "unstarted_count" isn't coherent between the CPUs.
> 
> hmm how could I verify this hypothesis?

TOC the machine, "ser pim" and look at PSW in TOC Info for each CPU.
bit 0 is the I-Bit IIRC.

On second thought, I'm skeptical unstarted_count isn't coherent
since it's a kernel global as well (like jiffies).

> >You need to find out who is using smp_call_function() and which function
> >they are trying to invoke. I suspect it's coming from mm/slab.c but
> >would know which of the three it might be.
> 
> Effectively I don't find another place where it is called. And so add a
> printk in each function calling smp_call_function_all_cpus() finaly.
> 
> That is allowing me to notice severall call to kmem_tune_cpucache() (7 exactly)
> (and not other) but don't get any more 'SMP CALL FUNCTION TIMED OUT (CPU=1)'
> :(
> (i presume that, as previously, the system crash before having the opportunity
> to flush its buffer?)
> 
> What do you think?

Could be.
Add mdelay(100) (or higher) after the lines of output you've added.
The works if it's a functional problem that's not timing dependent.

Otherwise setup kernel crash dump and use tools from bruno/phi to view
contents of the kernel message buffer.

grant
