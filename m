Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 54CB34829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Sep 2002 06:29:32 -0600 (MDT)
Subject: Re: [parisc-linux] SMP kernel problems on a D350
From: Ryan Bradetich <rbradetich@uswest.net>
To: "J.Steindlberger" <j@steindlberger.de>
Cc: Istvan Gyenes <frts@simba.sch.bme.hu>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020919122034.98BF64829@dsl2.external.hp.com>
References: <Pine.OSF.4.33.0209191111490.32375-100000@simba.sch.bme.hu>
	<20020919122034.98BF64829@dsl2.external.hp.com>
Content-Type: text/plain
Date: 19 Sep 2002 06:29:29 -0600
Message-Id: <1032438569.25418.107.camel@beavis>
Mime-Version: 1.0
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

On Thu, 2002-09-19 at 06:21, J.Steindlberger wrote:
> Hi,
> 
> You can choose 32bit/64bit in the "Processor type" section. And only if You 
> choose a processor that supports more than 32bit.

ie PA8x00 chipset.  From the hwdb the D350 has the following processor:
UL Proc 1-way T'100 (821/D250,D350) (Processor)  (PA7200 (PCX-T'))

so 64-bit would not be supported on this system.

- Ryan


> Did You try the config file included in the 2.4.18-smp kernel image package? 
> Perhaps it's different in more than that SMP-section. So far for my ideas. If 
> You still get problems, there is something to be fixed and the answering is 
> up to an expert -- not me ;-) , sorry. I hope I could help You anyway.
> 
> Joerg
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
