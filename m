From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] alternate insn for parisc (ccio/sba)
Date: Mon, 6 Mar 2006 10:20:42 -0700
Message-ID: <20060306172042.GD21702@colo.lackof.org>
References: <20060303201428.GA25283@quicksilver.road.mcmartin.ca>
	<20060304003802.GB18473@colo.lackof.org>
	<20060306160515.GB3208@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060306160515.GB3208@quicksilver.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Mar 06, 2006 at 11:05:15AM -0500, Kyle McMartin wrote:
> I just got an idea for fixing the indirect calls style thing... Would it
> be possible to do "run time" relocation of certain indirect calls if we
> know they won't ever differ for a given kernel boot?

dma_ops table doesn't change once it's initialized.
But I've still got Randolph's caution rattling around in my head.

>  I guess it wouldn't
> be too terribly difficult if the linker would just leave certain relocations
> unprocessed, and make sure all possible, for example, dma_ops function
> pointers were reachable from the given stub? 

dma_ops map/unmap calls are in performance critical code path.
It would be helpful to get rid of the indirect dma_ops calls IFF the
resulting code is supportable. ie the average driver writer needs
to be able to follow it.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
