From: Meelis Roos <mroos@linux.ee>
Subject: Re: parisc 4.13-git, BUG: sleeping function called from invalid
 context at mm/slab.h:416
Date: Sun, 30 Jul 2017 22:08:02 +0300 (EEST)
Message-ID: <alpine.LRH.2.20.1707302207430.27473@math.ut.ee>
References: <alpine.LRH.2.20.1707292206210.12687@math.ut.ee>   <CEB1A532-3AAD-4A4D-9A34-12A2477BE87F@bell.net>   <alpine.LRH.2.20.1707300947250.27473@math.ut.ee>   <F79536F1-AB2B-435C-A127-A1DFB4AC9CE0@bell.net>  <1501428648.3670.1.camel@HansenPartnership.com>
  <alpine.LRH.2.20.1707302112140.27473@math.ut.ee>  <15C99B92-DFB7-4B86-A280-2D491A5907CB@bell.net> <1501439838.3670.5.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1501439838.3670.5.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > > 
> > > > 
> > > > How about this?  There's no need to take the write lock when
> > > > creating
> > > > links anyway.
> > > 
> > > No effect.
> > 
> > Is the backtrace still the same?
> 
> There's another write lock over a symlink in
> pdcs_register_pathentries() does moving it up as well finally make this
> go away (cumulative patch below).  If that doesn't work, enabling
> DEBUG_PREEMPT might show which lock is the problem.

This patch works for me too.

-- 
Meelis Roos (mroos@linux.ee)
