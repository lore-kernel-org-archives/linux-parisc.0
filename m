From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: gcc-4.5 -fdelayed-branch strikes back
Date: Fri, 4 Jun 2010 15:32:28 -0400 (EDT)
Message-ID: <20100604193229.473BB515D@hiauly1.hia.nrc.ca>
References: <20100604181712.43456ddb@borg.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: gmsoft@tuxicoman.be (Guy Martin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100604181712.43456ddb@borg.bxl.tuxicoman.be> from "Guy Martin" at Jun 4, 2010 06:17:12 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> While trying to build gcc-4.5, `gengenrtl -h` segfaults.
> As you know, gengenrtl is built using the new gcc during stage 2.
> 
> I've been doing several tests and using BOOT_FLAGS="-O2
> -fno-delayed-branch" allows gcc to build correctly.

Could you post your exact configure and bootstrap commands, and
the bootstrap compiler used?

I have been building 4.5 without problems.  There is an issue with asms
that is unresolved that would affect kernel builds.  It may be your
bootstrap compiler is broken.  Because of this, I wouldn't recommend
4.5 for kernel builds.  The annoying thing abour this bug is it doesn't
appear with checking enabled and didn't appear until 4.5 was released.
It's possible this is a delayed branch issue.

> I'll try to provide a testcase but I'm usually unsuccessful while
> trying to do so.
> 
> Is there any known issue with -fdelayed-branch ?

No.

> I know about PR38740 but the fix should be included in 4.5 by now.

The fixes for this PR are in 4.3 and later.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
