From: Meelis Roos <mroos@linux.ee>
Subject: Re: compile failure: pacache.S and .size
Date: Sun, 13 Mar 2011 20:55:46 +0200 (EET)
Message-ID: <alpine.SOC.1.00.1103132055240.23183@math.ut.ee>
References: <alpine.SOC.1.00.1103130004110.6027@math.ut.ee> <20110313000323.GA17493@hiauly1.hia.nrc.ca> <alpine.SOC.1.00.1103130235020.7773@math.ut.ee> <20110313041046.GA19769@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110313041046.GA19769@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> You are correct, there is a new error message for .size
> http://sourceware.org/bugzilla/show_bug.cgi?id=12519
> and the change was applied to the 2.21 branch.
> 
> The message was introduced because you can't size a function across
> two sections.  It's not obvious why this is happening here.  So, I think
> a binutils bug should be filed with preprocessed assembler.

http://sourceware.org/bugzilla/show_bug.cgi?id=12579 - also hase the 
preprocessed file.

-- 
Meelis Roos (mroos@linux.ee)
