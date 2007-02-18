From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] The parisc SMP boot problem
Date: Sun, 18 Feb 2007 14:32:37 -0500
Message-ID: <20070218193237.GB22043__2797.28349200941$1416624300$gmane$org@athena.road.mcmartin.ca>
References: <1171820653.3423.22.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1171820653.3423.22.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Feb 18, 2007 at 11:44:13AM -0600, James Bottomley wrote:
> After a bit more of an analysis of our changesets (I concluded it must
> have been something we introduced).  This is the source of the SMP boot
> hang on 2.6.20-rcX:
> 
> commit 01a9fa750904beed08814364fcbd7039eca8ec71
> Author: Randolph <tausq@debian.org>
> Date:   Mon Dec 11 16:07:51 2006 -0800
> 
>     Optimize TLB flush on SMP systems
>     
>     Signed-off-by: Randolph Chung <tausq@debian.org>
> 
> As predicted, the reason it passed all the tests at the time it was
> introduced is that because of the piggin bug, we were only scheduling on
> a single CPU, and so the SMP piece of this wasn't truly tested.
> 
> Reverting this patch allows ioz to boot correctly.
> 

Ok. I'll revert it in the for-linus tree as well.

Any idea what was wrong with it?

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
