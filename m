From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 3/3] fix code to find libgcc
Date: Tue, 5 Jun 2012 08:55:11 +0200
Message-ID: <20120605065511.GA29003@merkur.ravnborg.org>
References: <1338871679.5176.7.camel@dabdike> <1338872049.5176.11.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1338872049.5176.11.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 05, 2012 at 01:54:09PM +0900, James Bottomley wrote:
> Sam broke this with
Soory!
> 
> commit 1f2bfbd00e466ff3489b2ca5cc75b1cccd14c123
> Author: Sam Ravnborg <sam@ravnborg.org>
> Date:   Sat May 5 10:18:41 2012 +0200
> 
>     kbuild: link of vmlinux moved to a script
> 
> But we should be deriving the location of libgcc in the same way as all
> the other archs, so fix by adding a LIBGCC variable which is evaluated
> in the makefile
It actually took me some time to realise why the formar approach was wrong.
It is still morning here..

Thanks for fixing this!

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
