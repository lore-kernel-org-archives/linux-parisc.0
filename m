Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] parisc Dump: lkcd port. 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Wed, 09 Jan 2002 17:46:45 +0100." <3C3C73F5.139E3A6D@admin.france.hp.com>
References: <3C3C73F5.139E3A6D@admin.france.hp.com> 
Date: Wed, 09 Jan 2002 13:21:25 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020109202125.7AA66482A@dsl2.external.hp.com>
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

Bruno Vidal wrote:
> 	Hi
> I've already ask in the past, if there was a dump driver
> for the linux parisc. The answer was no. So, because I've 
> litle time for It I've restart this port.

Oh - excellent!

> Now I've a question
> about a function used for Alpha and i386. 

and mips and mips64.

> In arch/alpha/kernel/setup.c and arch/i386/mm/init.c, there is
> a function called page_is_ram. It seems that this function is 
> used by the dump driver to know if a page is a physical page or 
> not. So my question is: does this function exist for parisc ?

No. I can think of two or three people who should offhand know how
to write this pretty quickly though - one of them is in transit
and the other won't see your mail for a few more hours.

My guess is page_is_ram() for parisc would like something like
the mips or i386 versions but use npmem_ranges (count) and
pmem_ranges[] (table physical page ranges):

/* leveraged from arch/mips/mm/init.c */
static inline int page_is_ram(unsigned long pagenr)
{
        int i;

        for (i = 0; i < npmem_ranges; i++) {
                unsigned long addr, end;

		/* Need to look for holes?
		** parisc doesn't support CONFIG_DISCONTIGMEM (yet?)

                if (pmem_holes[i].start_pfn ...)
                        continue;
		*/

                end = addr = pmem_ranges[i].start_pfn;
                end += pmem_ranges[i].pages;

                if (pagenr >= addr && pagenr < end)
                        return 1;
        }

        return 0;
}

I might be missing some shifting (PAGE_SHIFT) but that should be
easy to figure out.

hth,
grant

ps. I'm very excited to hear you are looking at this again! wohoo!
