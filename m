Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6FDC74832
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 13:10:54 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 157ME4-0001iG-00; Tue, 05 Jun 2001 20:10:48 +0100
Date: Tue, 5 Jun 2001 20:10:48 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: "Michael S.Zick" <mszick@pflash.com>
Cc: Andrew Shugg <andrew@neep.com.au>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: Version 0.9 of PA-RISC Linux Released
Message-ID: <20010605201048.T7349@parcelfarce.linux.theplanet.co.uk>
References: <20010605172316.A12216@neep.com.au> <01060507541700.00472@wolf01.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01060507541700.00472@wolf01.my.home>; from mszick@pflash.com on Tue, Jun 05, 2001 at 07:24:31AM -0500
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jun 05, 2001 at 07:24:31AM -0500, Michael S.Zick wrote:
> Great idea - both sites should CLEARLY cross-link their information pages.

if you have constructive suggestions for the website, please feel free to
post them.  I didn't like the original layout, and I think the redesign
made it harder to find information.  but i don't know how to make it
better, nor do i have time.

> I am using the kernel snap-shot of 06/03/2001 - in the hopes
> that it is close to what was used to build the kernels in V0.9 -
> but that is only a guess on my part

this is why i introduced the EXTRAVERSION.  it's -pa10, and that's still
head of the CVS tree.

> 2) - don't drop a built kernel into an image of even a pre-release
> CD until it compiles error (and warning) free.
> 
> Some of the problems I have found and fixed were clearly
> mentioned by the compiler.

let's see your patch then.

-- 
Revolutions do not require corporate support.
