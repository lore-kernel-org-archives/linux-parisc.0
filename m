From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: bad code with gcc-4.3 and lzma-utils ?
Date: Mon, 5 Jan 2009 23:40:57 -0500 (EST)
Message-ID: <20090106044058.7E85C4F9D@hiauly1.hia.nrc.ca>
References: <20090105105402.770fab6e@bleh.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: vapier@gentoo.org, linux-parisc@vger.kernel.org
To: gmsoft@tuxicoman.be (Guy Martin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090105105402.770fab6e@bleh.bxl.tuxicoman.be> from "Guy Martin" at Jan 5, 2009 10:54:02 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Sun, 4 Jan 2009 18:42:02 -0500 (EST)
> "John David Anglin" <dave@hiauly1.hia.nrc.ca> wrote:
> 
> > Would you please try this.
> 
> It did work too.

I installed the patch on the gcc trunk (4.4).  However, there are still
issues.  The patch didn't fix the -O0 -fdelayed-branch error.  I have
traced this to a middle-end bug:

http://gcc.gnu.org/bugzilla/show_bug.cgi?id=38740

There's also a nagging issue.  There would appear to be a problem
with the branch distance calculation.  The "be,l" instruction should
not have been used.  A "b,l" is supposed to be ok if the branch
distance is less than 7600000 bytes.  The code in this file is not
that big.  This may be the reason for the apparent regression.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
