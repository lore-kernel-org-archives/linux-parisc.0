Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 11 Jul 2003 10:45:20 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: alchemist@cdc712-9.cdc.polimi.it
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Tag starvation problem
Message-ID: <20030711164520.GA30259@dsl2.external.hp.com>
References: <20030711154118.GA378@cdc712-9.cdc.polimi.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030711154118.GA378@cdc712-9.cdc.polimi.it>
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

On Fri, Jul 11, 2003 at 05:41:18PM +0200, alchemist@cdc712-9.cdc.polimi.it wrote:
> Dear Sirs,
> 
> Since 2.4.20-pa35 my 712-60/128Mb suffers from the "tag starvation problem":
> 
> kernel msg: target(6.0) suffers from tag starvation problem

Problem explanation is here:
http://lists.debian.org/debian-hppa/2002/debian-hppa-200201/msg00067.html

and here:
http://licensing.steeleye.com/support/papers/ols_2002_slides.pdf

> then everything seems ok for a few seconds and then a sudden kernel panic.
> Note that until pa35 everything went ok (excluding the 712 power switch that
> does not work).

I've been seeing problems with recent 2.4.x kernels in the SCSI error
recovery path on ia64-linux as well. I haven't tried to track down
those problems yet.

grant

> I routinely use parisc-linux precompiled kernels.
> The problem also appears in 2.4.21pa2.
> 
> any help anyone ?
> thanks in advance.
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
