From: Meelis Roos <mroos@linux.ee>
Subject: Re: compile failure: pacache.S and .size
Date: Sun, 13 Mar 2011 02:38:07 +0200 (EET)
Message-ID: <alpine.SOC.1.00.1103130235020.7773@math.ut.ee>
References: <alpine.SOC.1.00.1103130004110.6027@math.ut.ee> <20110313000323.GA17493@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110313000323.GA17493@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > This preprocesses to
> > 
> >  .procend
> > .size disable_sr_hashing_asm, .-disable_sr_hashing_asm
> > 
> >  .end
> 
> It looks to me like someone may have removed the necessary whitespace before
> .size in linkage.h.  It may now be necessary for parisc to define its own
> version of END.  Don't think this has anything to do with binutils.

But the defines of ENDPROC and END in linkage.h are from 2006, commit 
ab7efcc9 from Jan Beulich. This has not changed, binutils has, thus my 
idea about binutils difference. However, I do not have the old binutils 
package easyly availbale right now so I can not test that today.

-- 
Meelis Roos (mroos@linux.ee)
