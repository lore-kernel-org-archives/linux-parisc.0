From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: Boot failure with 32bit kernel
Date: Thu, 26 Apr 2012 10:48:25 +0200
Message-ID: <20120426104825.06b5cec8@driller.lan>
References: <20120419102608.1834003e@driller.lan>
	<BLU0-SMTP60C76C814A1780515CC0B297200@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP60C76C814A1780515CC0B297200@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 22 Apr 2012 08:20:23 -0400
John David Anglin <dave.anglin@bell.net> wrote:
> 
> Could you try the attached patch?  It adjusts the section arrangement
> so that the long branch stubs don't appear at the start of .text.  As
> a result,
> _stext and stext now are at 10100000.

Works like a charm. I was able to boot all the kernels I had issue with.

Tested-by: Guy Martin <gmsoft@tuxicoman.be>

Thanks a lot !

  Guy

> 
> The problem arises from section merging and a few branch distances
> in the kernel exceeding the PA 2.0 limit.
> 
> The patch might not work if the long branch stubs don't work...
> 
> Another approach might be to add -mlong-calls to CFLAGS.  However,
> these calls are less efficient.
> 
> Dave
> --
> John David Anglin	dave.anglin@bell.net
> 
> 


