From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: compile failure: pacache.S and .size
Date: Sat, 12 Mar 2011 20:28:48 -0500 (EST)
Message-ID: <20110313012849.D1A3A5014@hiauly1.hia.nrc.ca>
References: <alpine.SOC.1.00.1103130235020.7773@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: mroos@linux.ee (Meelis Roos)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1103130235020.7773@math.ut.ee> from "Meelis Roos" at Mar 13, 2011 02:38:07 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > > This preprocesses to
> > > 
> > >  .procend
> > > .size disable_sr_hashing_asm, .-disable_sr_hashing_asm
> > > 
> > >  .end
> > 
> > It looks to me like someone may have removed the necessary whitespace before
> > .size in linkage.h.  It may now be necessary for parisc to define its own
> > version of END.  Don't think this has anything to do with binutils.
> 
> But the defines of ENDPROC and END in linkage.h are from 2006, commit 
> ab7efcc9 from Jan Beulich. This has not changed, binutils has, thus my 
> idea about binutils difference. However, I do not have the old binutils 
> package easyly availbale right now so I can not test that today.

I have not seen the problem with 2.21.51.20110218.  .size is handled
by generic code.  I find it hard to believe that .-disable_sr_hashing_asm
doesn't evaluate to a constant.  GCC always outputs a similar directive.
It would seem like almost every assembly would be broken if the problem
was with binutils.

Could you send preprocessed assembler file?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
