Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 73AB648EC
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 09:42:13 -0700 (MST)
Date: Wed, 24 Mar 2004 17:42:06 +0100
Message-ID: <40561E71000066FA@ocpmta2.freegates.net>
In-Reply-To: <40561EAF00005B43@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Linux only see 2Gb of ram of N4k
To: "Grant Grundler" <grundler@parisc-linux.org>,
	"Matthew Wilcox" <willy@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Grant,

Sorry but I make a typo in
arch/parisc/mm/init.c
static void __init setup_bootmem(void)
{
[snip]
        /*
         * Throw out ranges that are too far apart (controlled by
         * MAX_GAP). If CONFIG_DISCONTIGMEM wasn't implemented so
         * poorly, we would recommend enabling that option, but,
         * until it is fixed, this is the best way to go.
         */

        printk("npmem_ranges = %d.(line 171)\n", npmem_ranges);
        for (i = 1; i < npmem_ranges; i++) {
              printk("pmem_ranges[%d].start_pfn = %ld.\n", i-1, 
pmem_ranges[i-1].pages);  <=== should be start_pfn also

                printk("pmem_ranges[%d].pages = %ld.\n", i-1, 
pmem_ranges[i-1].pages);
                printk("pmem_ranges[%d].start_pfn = %ld.\n", i, 
pmem_ranges[i].pages);    <==== here the same
                printk("MAX_GAP = %ld.\n", MAX_GAP);
[snip]
           
And actual results would be:
<==== return by setup_bootmem() ====>
pmem_ranges[0].start_pfn = 0.
pmem_ranges[0].pages = 524288.
pmem_ranges[1].start_pfn = 1572864.

Is it much more in accordance to your knowledge?

Thanks for advise,
    Joel

PS: May I risk to play with CONFIG_DISCONTIGMEM?

----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
