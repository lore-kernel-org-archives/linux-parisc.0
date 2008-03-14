From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: 'Trace patches test' [Was: ccio_clear_io_tlb() and
	__raw_write() more question?]
Date: Thu, 13 Mar 2008 23:47:53 -0600
Message-ID: <20080314054753.GH24794@colo.lackof.org>
References: <JV7395$DBAE1F0684DA4A107D72A32A8088590F@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <JV7395$DBAE1F0684DA4A107D72A32A8088590F@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 25, 2008 at 11:17:29AM +0100, rubisher wrote:
...

Sorry for not replying to this sooner. This got "lost" in my inbox.

> > > (just what would give me DEBUG_RUN() printk() but without
> > >  degrading system performance)
> >
> > I don't believe that. :)
> > Measure the CPU utilization and/or compare pktgen performance with
> > and without the tracing compiled into the kernel.
> >
> Having no clue about pktgen, I have a look and rebuild kernels with this
> option and here are some results:

Thanks! This is excellent data - well done!


> I use a pktgen-single script like:

[ deleted sh script to drive pktgen ]

...
> # With Kernel including ccio_trace_marker but ccio_trace module not running
...
> Result: OK: 59844395(c59626778+d217617) usec, 455759 (60byte,0frags)
>   7615pps 3Mb/sec (3655200bps) errors: 0

vs.

> # With Kernel including ccio_trace_marker and ccio_trace module running
...
> Result: OK: 63882397(c59547733+d4334664) usec, 138863 (60byte,0frags)
>   2173pps 1Mb/sec (1043040bps) errors: 0

vs.

> # With Kernel without ccio_trace_marker
...
> Result: OK: 61980765(c61791828+d188937) usec, 474350 (60byte,0frags)
>   7653pps 3Mb/sec (3673440bps) errors: 0
> 
> I am not sure how to read those results so I also do some ftp and grab
> following data:

Compare the "pps" numbers.
The ccio_trace_marker code reduces performance by 0.49%.

(7653-7615)/7653

It's no surprise with tracing on, performance is 3.6x lower.

But those pps numbers look really low to me.
Was that with 100BT or GigE NIC?

If it was 100BT, then we probably are not CPU bound and are more
likely perf limited by the NIC. We'd need HW counters to determine
the exact CPU utilization and we never got CPU perf counters working.

I've not tested pktgen with gige NIC on parisc...only on ia64 (ZX1).
On ZX1 chipset I got up to 880,000 pps with careful tuning.
Given the 64-bit x 66Mhz PCI bus is running 1/2 as fast and parisc
generally is running a much older chipset (Astro has higher mem latency),
I expect the parisc gigE numbers to be substantially lower but still
in the 50-100K pps range.


> # With Kernel including ccio_trace_marker but ccio_trace module not running
> ftp> put linux-2.6.24-rc4-pa-git-20071206.tar.bz2
...
> 47631536 bytes sent in 54.42 secs (854.8 kB/s)
> 
> # With Kernel including ccio_trace_marker and ccio_trace module running
...
> 47631536 bytes sent in 59.26 secs (784.9 kB/s)
> 
> # With kernel without ccio_trace_marker
...
> 47631536 bytes sent in 55.66 secs (835.8 kB/s)

The ftp results don't match the pktgen results.  The last result
(without ccio_trace_marker) should be fastest.

One thing I love about pktgen is the results are _very_ consistent
given a particular HW config. I trust those numbers much more than
the ftp or any other "real" network test for in-system comparisions.

> I agree it decrease a bit the system performance but doesn't slow it down so
> much that it would take several hours to boot has printk() did to me ;-)

*nod* definitely true.

> > However, that doesn't mean this is useless. This is alot better than
> > rolling our own "light weight" tracing mechanism and it's certainly
> > alot better than using printk's to debug DMA issues (as long as
> > the system doesn't crash - e.g. HPMC).
> 
> Yes there are limits to this method but for parisc I know so few kernel
> debugging tools that I would like to mentioned here the easiness of this patch
> implementation (even for a non C programmer as I ;<)
> 
> Cheers,
>     r.
> 
> PS: I didn't put this code here just because all what I have wouldn't apply on
> the current p-l ccio-dma.c src.

That's ok. Like I said before, I'd be willing to accept the patch
as long as it has "#ifdef" around all the code. Kernel developers
can enable/use it if they want. I see no reason to have it on
by default for anyone else.

thanks,
grant

> 
> 
> > hth,
> > grant
> >
> > > I still have to had some more DEBUG_RUN_SG() stuff and hope to be able to
> > > collect more.
> > >
> > > Cheers,
> > >     r.
> > >
> > > ---
> > > Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
> > > http://www.scarlet.be/
> > >
> > > -
> > > To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> > 
> ---
> Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
> http://www.scarlet.be/
