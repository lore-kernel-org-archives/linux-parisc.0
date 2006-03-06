From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] alternate insn for parisc (ccio/sba)
Date: Mon, 6 Mar 2006 11:05:15 -0500
Message-ID: <20060306160515.GB3208@quicksilver.road.mcmartin.ca>
References: <20060303201428.GA25283@quicksilver.road.mcmartin.ca>
	<20060304003802.GB18473@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060304003802.GB18473@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Mar 03, 2006 at 05:38:02PM -0700, Grant Grundler wrote:
> hrm...are kernel modules loaded into write protected space as well?
> If so, then we can't apply this to kernel modules...would kinda limit
> how it could be used. E.g. we couldn't get rid of dma_ops indirect
> calls.
>

I just got an idea for fixing the indirect calls style thing... Would it
be possible to do "run time" relocation of certain indirect calls if we
know they won't ever differ for a given kernel boot? I guess it wouldn't
be too terribly difficult if the linker would just leave certain relocations
unprocessed, and make sure all possible, for example, dma_ops function
pointers were reachable from the given stub? 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
