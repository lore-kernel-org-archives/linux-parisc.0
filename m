Return-Path: <sdbrady@ntlworld.com>
Received: from mta02-svc.ntlworld.com (mta02-svc.ntlworld.com [62.253.162.42])
	by dsl2.external.hp.com (Postfix) with ESMTP id E111A4852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 00:58:48 -0700 (MST)
Received: from calypso ([62.254.21.7]) by mta02-svc.ntlworld.com
	(InterMail vM.4.01.03.37 201-229-121-137-20020806) with ESMTP
	id <20040221075816.UQTH14417.mta02-svc.ntlworld.com@calypso>
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 07:58:16 +0000
Received: from sdb by calypso with local (Exim 3.36 #1 (Debian))
	id 1AuS2D-0001H5-00 for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 07:58:49 +0000
Date: Sat, 21 Feb 2004 07:58:49 +0000
From: Stuart Brady <sdbrady@ntlworld.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Hanging with kernels >= 2.4.22
Message-ID: <20040221075849.GA1642@calypso>
References: <20040218235225.GA1623@calypso>
	<20040219062907.GC13916@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040219062907.GC13916@colo.lackof.org>
Sender: Stuart Brady <sdbrady@ntlworld.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Feb 18, 2004 at 11:29:07PM -0700, Grant Grundler wrote:
> On Wed, Feb 18, 2004 at 11:52:25PM +0000, Stuart Brady wrote:
> > I'm having problems with kernels >= 2.4.22 on a 715/100.
> 
> Stuart,
> All your symptoms point at disk IO hanging.
> Setting the default queue depth to 1 would be worth trying.
> I've forgotten the details for setting queue depth.
>  
> search parisc-linux mailing list archives "scsi queue tags".
> http://lists.parisc-linux.org/pipermail/parisc-linux/2004-January/022087.html

Thanks! Changing NCR_700_MAX_TAGS to 1 in drivers/scsi/53c700.h did the
trick. Will I now have poor disk performance? If so, might I get away
with setting it to something higher, like 2 or 4, maybe?

I've not heard of tagged command queues before - the idea seems to be to
transfer data to the drive as early as possible, but make decisions as
to what should be written first at a later stage. Is that correct?

http://lists.parisc-linux.org/pipermail/parisc-linux/2002-February/015465.html
says that no tagged queue is a bad thing. Why is that?

> btw, 715/50 is NOT the same as 715/100.
> 715/100 should have "coherent" DMA and 715/50 does not.
> 
> Maybe a FAQ entry for "715/xxx hangs" could be your first contribution?

That's a good idea. Where should I send the entry? Here?
-- 
Stuart Brady
