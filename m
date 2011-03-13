From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: compile failure: pacache.S and .size
Date: Sat, 12 Mar 2011 23:10:47 -0500
Message-ID: <20110313041046.GA19769@hiauly1.hia.nrc.ca>
References: <alpine.SOC.1.00.1103130004110.6027@math.ut.ee> <20110313000323.GA17493@hiauly1.hia.nrc.ca> <alpine.SOC.1.00.1103130235020.7773@math.ut.ee>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1103130235020.7773@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 13 Mar 2011, Meelis Roos wrote:

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

You are correct, there is a new error message for .size
http://sourceware.org/bugzilla/show_bug.cgi?id=12519
and the change was applied to the 2.21 branch.

The message was introduced because you can't size a function across
two sections.  It's not obvious why this is happening here.  So, I think
a binutils bug should be filed with preprocessed assembler.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
