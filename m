From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] [patch 2/2] backport of sba sg list management
	to ccio-dma
Date: Wed, 17 Oct 2007 14:44:16 -0400
Message-ID: <20071017184416.GB11502__15553.7153048956$1416624646$gmane$org@fattire.cabal.ca>
References: <4714E800.50709@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4714E800.50709@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Oct 16, 2007 at 04:34:08PM +0000, Joel Soete wrote:
> And here is the main hunk:
> 
> This consist of 'backporting' to ccio of the most of Grant's work on sg list
> management of sba-iommu.
> 
> According to some stress test on d380 it makes ncr driver more stable; 
> improve
> network perf on my d380 (from 110 to 430 kb/s);
> (would allow in a next step merge some hunk of sba code in iommu-helper.h)
> 

A long time ago (a couple months?) I merged large swaths of ccio and sba
code... unfortunately, it caused an almost measurable (~2-5%) loss of
performance on networking and scsi throughput...

I probably lost the code when my j6000 disk failed, but I'll probably
have another crack at it someday.

Anyway, the patch looks good, but it needs a bit of testing, so I think
we'll wait for 2.6.25 to merge it?

Regards,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
