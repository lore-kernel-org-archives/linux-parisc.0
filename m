From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next boot failure
Date: Mon, 21 Mar 2011 11:37:29 -0500
Message-ID: <1300725449.10634.23.camel@mulgrave.site>
References: <20110320201614.GA25287@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110320201614.GA25287@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2011-03-20 at 16:16 -0400, John David Anglin wrote:
> The current linux-next tree fails to boot on parisc.  I have seen
> the same panic on two different systems.  2.6.38-rc5-next-20110218
> is ok.  2.6.38-rc8-next-20110311 failed to boot.  The backtrace is
> the same in all cases.

I don't see this in get head as of this morning, so it's likely in an
unmerged branch.  If you can find it, I might be able to have the
culprit fix it before it does get merged.

James

P.S. I also try not to run -next around the merge window, because it
gets very unstable (all the rules violators trying to get a last fix in)

