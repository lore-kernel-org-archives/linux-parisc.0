From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/master
Date: Thu, 2 Apr 2009 01:43:48 GMT
Message-ID: <200904020143.n321hmK4011043@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 7cec2ef4a298605b010f1c80041de884e777ea67
Merge: 91400ac365da35b18036b46bdda27ddbcee4a663 9bc181d8d7cb6462de0c315e364780ad275f7c57
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Thu Apr 2 01:43:14 2009 +0000

    Merge branch 'rusty-cpumask-parisc' into parisc

commit 9bc181d8d7cb6462de0c315e364780ad275f7c57
Author: Rusty Russell <rusty@rustcorp.com.au>
Date:   Mon Mar 16 14:19:38 2009 +1030

    cpumask: Use accessors code.: parisc
    
    Impact: use new API
    
    Use the accessors rather than frobbing bits directly.  Most of this is
    in arch code I haven't even compiled, but it is mostly straightforward.
    
    Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
    Signed-off-by: Mike Travis <travis@sgi.com>

commit bd071e1a371d31db243edc4714ff9e8d1ea1309e
Author: Rusty Russell <rusty@rustcorp.com.au>
Date:   Mon Mar 16 14:19:37 2009 +1030

    cpumask: prepare for iterators to only go to nr_cpu_ids/nr_cpumask_bits.: parisc
    
    Impact: cleanup, futureproof
    
    In fact, all cpumask ops will only be valid (in general) for bit
    numbers < nr_cpu_ids.  So use that instead of NR_CPUS in various
    places.
    
    This is always safe: no cpu number can be >= nr_cpu_ids, and
    nr_cpu_ids is initialized to NR_CPUS at boot.
    
    Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
    Signed-off-by: Mike Travis <travis@sgi.com>
    Acked-by: Ingo Molnar <mingo@elte.hu>

commit 91887a362984324e254473e92820758c8e658f78
Author: Rusty Russell <rusty@rustcorp.com.au>
Date:   Mon Mar 16 14:19:37 2009 +1030

    cpumask: arch_send_call_function_ipi_mask: parisc
    
    We're weaning the core code off handing cpumask's around on-stack.
    This introduces arch_send_call_function_ipi_mask(), and by defining
    it, the old arch_send_call_function_ipi is defined by the core code.
    
    We also take the chance to change send_IPI_mask() and use the new
    for_each_cpu() iterator.
    
    Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>

