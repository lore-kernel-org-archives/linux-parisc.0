Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C7ED4856
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 09:46:38 -0600 (MDT)
Date: Fri, 26 Sep 2003 17:46:35 +0200
Message-ID: <3F704CAF00001DCF@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] N Class SMP pb ?  (follow up)
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>Yes - 6 is ITLB miss and 15 is Data TLB miss.
...
>
>> handle_interruption(26, ...).
>
>26 is "Data Memory Access rights Trap".
>This sounds normal for Copy-On-Write.

Yes to be sure I just finished to logon a b2k with same kernel (excepted
pdc support but I already verify it doesn't make any difference in the crash
in smp on the N) and effectively it is normal to read many 6, 15 and 26
interruptions.

>> SMP CALL FUNCTION TIMED OUT (CPU=1)
>
>The IPI handler will time out if the other CPU doesn't ack
>the function call with in a second. This is bad.

OTC This is the better messages I never get to start an analyse of this crash
:))

>It means either other CPU never got the interrupt (locked up
>with I-bit off) or the "unstarted_count" isn't coherent between the CPUs.

hmm how could I verify this hypothesis?

>>
>> Could this be a pb with sync between cpu time ref?
>> (because timeout = jiffies + HZ)
>
>I don't think so since jiffies is a global.
>And it's always be measured on the same CPU.
Ok
>
>> I have also a look for where this function is called but never see its
return
>> code tested to launch a 'stack dump' and a stop of system?
>
>You need to find out who is using smp_call_function() and which function
>they are trying to invoke. I suspect it's coming from mm/slab.c but
>would know which of the three it might be.

Effectively I don't find another place where it is called. And so add a
printk in each function calling smp_call_function_all_cpus() finaly.

That is allowing me to notice severall call to kmem_tune_cpucache() (7 exactly)
(and not other) but don't get any more 'SMP CALL FUNCTION TIMED OUT (CPU=1)'
:(
(i presume that, as previously, the system crash before having the opportunity
to flush its buffer?)

What do you think?

Thanks a lot for help,
    Joel




-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 
