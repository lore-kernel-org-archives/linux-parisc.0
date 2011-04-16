From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Debian bug 622997
Date: Sat, 16 Apr 2011 13:57:31 -0500
Message-ID: <1302980251.4058.11.camel@mulgrave.site>
References: <20110416180754.GA18022@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org, 622997@bugs.debian.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110416180754.GA18022@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2011-04-16 at 14:07 -0400, John David Anglin wrote:
> I posted this debian bug report because the most recent debian
> SMP kernel build fails to boot on my rp3440:
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=622997
> 
> I don't think debian kernels have worked since lenny.

Hmm, well upstream ones have: so it's likely a patch debian has but
upstream doesn't, or it could be a toolchain issue ... I didn't think
gcc-4.4.5 worked properly on 64 bit without a few patches?

James


