Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 480B34A19
	for <parisc-linux@parisc-linux.org>; Thu,  8 Mar 2001 07:36:27 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14b1WJ-00031F-00; Thu, 08 Mar 2001 14:35:59 +0000
Date: Thu, 8 Mar 2001 14:35:59 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Bruno IGLESIAS <iglesiab@esiee.fr>
Cc: submit@bugs.parisc-linux.org, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Problem on floating calculation
Message-ID: <20010308143559.D4821@parcelfarce.linux.theplanet.co.uk>
References: <20010308141648.B672CD15EA@mail.esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010308141648.B672CD15EA@mail.esiee.fr>; from iglesiab@esiee.fr on Thu, Mar 08, 2001 at 03:16:48PM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Mar 08, 2001 at 03:16:48PM +0000, Bruno IGLESIAS wrote:
> 	When I execute Seti@home client (32 Bits executable) on a 64 Bit     
> architecture ( HP900A500-A5X i.e ESIEE's A500) ,the expression :      
>                                                                       
>    "exp(-(0.693 * SQUARE((float)(i) - (float)(ul_TOffset))) /         
> (float)(f_SigmaSq))"                                                  
>                                                                       
> doesn't work with some specific value. For example exp(-89.790901)    
> result in an illegal instruction message.                             

i had trouble with a divide performed by a prefetch benchmark program.
there's definitely something wrong with our FP stuff.  I believe this is
bug #72 in the BTS.

-- 
Revolutions do not require corporate support.
