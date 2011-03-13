From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: compile failure: pacache.S and .size
Date: Sat, 12 Mar 2011 19:03:24 -0500
Message-ID: <20110313000323.GA17493@hiauly1.hia.nrc.ca>
References: <alpine.SOC.1.00.1103130004110.6027@math.ut.ee>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1103130004110.6027@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 13 Mar 2011, Meelis Roos wrote:

> This preprocesses to
> 
>  .procend
> .size disable_sr_hashing_asm, .-disable_sr_hashing_asm
> 
>  .end

It looks to me like someone may have removed the necessary whitespace before
.size in linkage.h.  It may now be necessary for parisc to define its own
version of END.  Don't think this has anything to do with binutils.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
