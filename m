Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C346488A
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 23:21:06 -0700 (MST)
Date: Sat, 21 Feb 2004 23:21:05 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] Hanging with kernels >= 2.4.22
Message-ID: <20040222062105.GF30849@colo.lackof.org>
References: <20040218235225.GA1623@calypso>
	<20040219062907.GC13916@colo.lackof.org>
	<20040221075849.GA1642@calypso>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040221075849.GA1642@calypso>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Feb 21, 2004 at 07:58:49AM +0000, Stuart Brady wrote:
> Thanks! Changing NCR_700_MAX_TAGS to 1 in drivers/scsi/53c700.h did the
> trick. Will I now have poor disk performance? If so, might I get away
> with setting it to something higher, like 2 or 4, maybe?

You can try, but I don't think it's worth it.

> I've not heard of tagged command queues before - the idea seems to be to
> transfer data to the drive as early as possible, but make decisions as
> to what should be written first at a later stage. Is that correct?

Sort of yes. The reasons are a bit more complicated than that.
Key reasons are better utilization of disk buffer (w/o enabling WCE)
and allow disk firmware to optimize for maximum throughput.
There are tradeoffs and caveats to both.

> > Maybe a FAQ entry for "715/xxx hangs" could be your first contribution?
> 
> That's a good idea. Where should I send the entry? Here?

Yes please. Making a diff against the file carlos pointed at
would be easiest for me. But I'll take a single paragraph
in plain text as well.

The FAQ entry should mention which machines/SCSI controllers/disks
are affected and how to set the queuedepth. Anything else is
extra credit and I reserve the right to edit it out. :^)

thanks,
grant

> -- 
> Stuart Brady
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
