Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflashcom (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34BED482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 18 Oct 2001 10:19:00 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@pflash.com>
To: John Marvin <jsm@udlkern.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PCXS fixes
Date: Thu, 18 Oct 2001 11:17:11 -0500
References: <200110030832.CAA10917@udlkern.fc.hp.com>
In-Reply-To: <200110030832.CAA10917@udlkern.fc.hp.com>
Cc: Albert Strasheim <fullung@ilink.nis.za>
MIME-Version: 1.0
Message-Id: <01101811171100.00835@Wolf-01>
List-ID: <linux-parisc.vger.kernel.org>

On Wednesday 03 October 2001 03:32 am, John Marvin wrote:
> ... Note that
> although ldcw requires 16 byte alignment for correct function, it does
> not cause an unaligned fault if the address is not aligned, it just
> doesn't work correctly!
>
> Here are some suggested fixes:
>     1)  ...
>     2)  ...
>
John, Albert and Group;

I am working on a generalized solution as suggestion #3.  Diffs to follow RSN 
- as soon as I finish the coding and Albert gets it to run.

Mike
