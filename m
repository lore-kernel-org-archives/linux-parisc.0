Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.uct.ac.za (mail.uct.ac.za [137.158.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 91A23482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Feb 2002 02:26:00 -0700 (MST)
Received: from marmite.its.uct.ac.za ([137.158.26.155])
	by mail.uct.ac.za with esmtp (Exim 3.33 #4)
	id 16Z7I8-0009Mg-00
	for parisc-linux@lists.parisc-linux.org; Fri, 08 Feb 2002 11:26:00 +0200
Date: Fri, 8 Feb 2002 11:25:33 +0200
From: Michael Wood <mwood@its.uct.ac.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Question about RAID array
Message-ID: <20020208092533.GA12114@marmite.its.uct.ac.za>
References: <Pine.LNX.4.30.0202071217510.26774-100000@sunshine.equant.no> <20020207162240.52CB6482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020207162240.52CB6482A@dsl2.external.hp.com>
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

On Thu, Feb 07, 2002 at 09:22:40AM -0700, Grant Grundler wrote:
> =?ISO-8859-1?Q?Bj=F8rn_Djupvik?= wrote:
> > Hi, I am considering migrating a few boxes from hp-ux to
> > parisc-linux as I have done this successfully on a 712/100
> > already.. The boxes in question are D-class servers
> > (220,230,250,etc) and some of them have jurassic-era
> > (ancient) C2300 disk arrays attached to them, which I know
> > very little about.
> 
> 1) D-class is quite a different beast than 712.
>    Has anyone tried installing 0.9.3 on a D-class?
>    Are all the interface cards you care about supported with
>    linux drivers?

I've installed 0.9.3 successfully on a D270.  Just needed the
ncr53c8xx=burst:3 thing.

I can't comment on the disk array thing, though.

-- 
Michael Wood <mwood@its.uct.ac.za>
