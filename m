Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bigw.org (BIGW.RES.CMU.EDU [128.2.156.73])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C849482C
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Dec 2001 16:08:38 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by bigw.org (8.10.2/8.10.2) with ESMTP id fB9N89B05833
	for <parisc-linux@lists.parisc-linux.org>; Sun, 9 Dec 2001 17:08:09 -0600 (CST)
Date: Sun, 9 Dec 2001 17:08:09 -0600 (CST)
From: Dan Williams <dan@bigw.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Status of HP 9000 D350
In-Reply-To: <20011210082939.A4062@silly.cloud.net.au>
Message-ID: <Pine.NEB.4.21.0112091704320.5831-100000@bigw.res.cmu.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Does this mean that fast/wide controllers on C110s would be recognized on
newer kernels, or is the C110 controller sufficiently older and
different?  I tried the 0.9.2 install CD a while ago and it would only
boot to the installer (where it then hung) if I removed ALL fast/wide
drives from the computer.  Otherwise it crashed in a fiery heap of burning
death (well, just crashed).

Dan

On Mon, 10 Dec 2001, Hamish Moffatt wrote:

> On Sun, Dec 09, 2001 at 08:01:36PM +0100, Christoph Plattner wrote:
> > What is the status of the 9000 D350 server machine and Linux.
> 
> I tried it about two months ago and it seemed to work OK. You
> need a recent kernel for the fast-wide SCSI card to be found.
> 
> 
> Hamish
> -- 
> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
