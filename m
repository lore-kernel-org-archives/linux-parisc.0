From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Boot failure with 32bit kernel
Date: Thu, 17 May 2012 08:57:18 +0100
Message-ID: <1337241438.2926.9.camel@dabdike.int.hansenpartnership.com>
References: <20120419102608.1834003e@driller.lan>
	 <BLU0-SMTP60C76C814A1780515CC0B297200@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Guy Martin <gmsoft@tuxicoman.be>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP60C76C814A1780515CC0B297200@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2012-04-22 at 08:20 -0400, John David Anglin wrote:
> On 19-Apr-12, at 4:26 AM, Guy Martin wrote:
> 
> > Hi all,
> >
> > I compiled a kernel with a few additional features and I was unable to
> > boot it. It seems that if the entry point is not 0x00100000 in  
> > vmlinux,
> > the boot process fails right after "Total Memory: 2048 MB".
> > This is the only common denominator I could find.
> >
> > I've been able to reproduce this with :
> > - C3600 and J5600
> > - kernel 3.2.12 and 3.3.1
> > - gcc 4.5.3
> > - ld 2.21 and 2.22
> > - palo 1.17 and 1.18
> 
> 
> Could you try the attached patch?  It adjusts the section arrangement so
> that the long branch stubs don't appear at the start of .text.  As a  
> result,
> _stext and stext now are at 10100000.
> 
> The problem arises from section merging and a few branch distances
> in the kernel exceeding the PA 2.0 limit.
> 
> The patch might not work if the long branch stubs don't work...
> 
> Another approach might be to add -mlong-calls to CFLAGS.  However,
> these calls are less efficient.

OK, to add this to the fixes repo, I need a change log and a signoff
(from Dave).

I think the changelog would be:

---
fix boot failure on 32 bit caused by out of range branch stubs

In certain configurations, the resulting kernel becomes too large to
boot because the branch stubs are all placed at the very start of the
image.  Fix this by placing the branch stubs after the head text so the
distances are a bit shorter.
---

Is that about right?

Thanks,

James


