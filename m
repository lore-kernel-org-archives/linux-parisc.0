From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: compile failure: pacache.S and .size
Date: Sun, 13 Mar 2011 16:35:55 -0400
Message-ID: <20110313203554.GA22594@hiauly1.hia.nrc.ca>
References: <alpine.SOC.1.00.1103130004110.6027@math.ut.ee> <20110313000323.GA17493@hiauly1.hia.nrc.ca> <alpine.SOC.1.00.1103130235020.7773@math.ut.ee> <20110313041046.GA19769@hiauly1.hia.nrc.ca> <alpine.SOC.1.00.1103132139410.24035@math.ut.ee>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1103132139410.24035@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 13 Mar 2011, Meelis Roos wrote:

> Got an answer from binutils bugzilla - we have a problem with
> ENDPROC(flush_alias_page)

I thought the flush_alias_page code was deleted.

It would appear the tmpalias-flush changes from James are not merged in
Linus' kernel tree.  It seems to have gone into linux-next here:
http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=commitdiff;h=f311847c2fcebd81912e2f0caf8a461dec28db41

Your patch should fix the compilation problem but I think we really
want James' tmpalias-flush changes in 2.6.28 based on my testing.
Maybe it should be applied to some of the stable branches.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
