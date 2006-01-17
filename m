From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] alternative insn for parisc
Date: Tue, 17 Jan 2006 12:36:57 -0500
Message-ID: <20060117173657.GH4049@quicksilver.road.mcmartin.ca>
References: <20060115161419.GC21721@quicksilver.road.mcmartin.ca>
	<200601171029.22985.bjorn.helgaas@hp.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Bjorn Helgaas <bjorn.helgaas@hp.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200601171029.22985.bjorn.helgaas@hp.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jan 17, 2006 at 10:29:22AM -0700, Bjorn Helgaas wrote:
> Where's the cache flush of the modified region?  All the gory
> requirements are in the last few paragraphs of chapter 4 (page
> 4-10) of the PA 2.0 book.
>

Yeah, I forgot about that... The very next thing it does (before
it runs any effected code) was flush the entire data cache (but I missed
that it wasn't flushing icache).

I'll readd the sequence next rev.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
