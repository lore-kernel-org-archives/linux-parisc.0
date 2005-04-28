From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] ssm/rsm sequences
Date: Thu, 28 Apr 2005 13:54:35 -0700
Message-ID: <1114721675.5022.22.camel@mulgrave>
References: <20050428190659.GD10171@colo.lackof.org>
	<200504281942.j3SJgQvL005780@hiauly1.hia.nrc.ca>
	<20050428202058.GG10171@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050428202058.GG10171@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, 2005-04-28 at 14:20 -0600, Grant Grundler wrote:
> That may be why I'm not seeing it more often.
> 
> jejb, any insight here?

Yes, but you're not going to like it.  For this to show up twice for the
same process, we must have done a full tlb flush so often that we've
completely cycled around the spaces.

This, in turn, looks to be because we have a total screw up in our tlb
flushing implementation.  What's supposed to happen is that the 

tlb_gather_mmu()
...
tlb_finish_mmu()

is supposed simply to say "I promise to flush the tlb when I'm done, so
don't actually flush anywhere within, just add the dirty tlbs to the
list".

Unfortunately, our implementation of tlb_end_vma() meaning either flush
this vma or add it to the tlb list seems to flush every time, which is
why we do this so often.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
