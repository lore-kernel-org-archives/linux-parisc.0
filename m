Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E3C24831
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 Jan 2002 10:32:56 -0700 (MST)
Date: Sat, 26 Jan 2002 17:22:11 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Vlad Markov <markov@monmouth.com>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20020126172210.GP2884@sleepie.demon.co.uk>
References: <200201240200.VAA00858@monmouth.com> <20020125065501.A6537482A@dsl2.external.hp.com> <20020125095755.GH32617@sleepie.demon.co.uk> <20020126052834.1F31C482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020126052834.1F31C482A@dsl2.external.hp.com>
Subject: [parisc-linux] Re: tag starvation
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

On Fri, Jan 25, 2002 at 10:28:33PM -0700, Grant Grundler wrote:
> Ah ok...does "starvation" properly described by the following scenario?
> 
> While the drive is completing IO requests as fast as it can,
> *some* IO's don't complete because they never become the most
> optimal one to complete. This is an inherent "unfairness"
> in the normal SCSI  Queue tag. (Two other types of tags exist but
> are never used by Unix OS's AFAICT: ordered, Head)

Yes, that sums it up nicely.

> hmmm...could we just replace the following constant with
> a MODULE_PARAM() variable?
> 
> 53c700.h:#define NCR_700_MAX_TAGS               16

That sounds like a good idea; I think James was planning to add some
options like that to the driver, so we should check with him before
doing anything.

Richard
