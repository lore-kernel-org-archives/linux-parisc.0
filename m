From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Mon, 08 Sep 2008 18:00:47 -0500
Message-ID: <1220914847.8074.81.camel@localhost.localdomain>
References: <200809081213.37705.david-b@pacbell.net>
	 <1220905689.8074.68.camel@localhost.localdomain>
	 <200809081429.57805.david-b@pacbell.net>
	 <20080908.143504.121592746.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain
Cc: david-b@pacbell.net, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: David Miller <davem@davemloft.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080908.143504.121592746.davem@davemloft.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2008-09-08 at 14:35 -0700, David Miller wrote:
> From: David Brownell <david-b@pacbell.net>
> Date: Mon, 8 Sep 2008 14:29:57 -0700
> 
> > On Monday 08 September 2008, James Bottomley wrote:
> > > All the PDC real time clock calls can do are read and set, nothing else,
> > > so it's idealy suited to the GEN_RTC infrastructure ... what's the
> > > benefit in moving it to RTC_CLASS?
> > 
> > The same benefit always found in sharing infrastructure.  Lots
> > of little differences/bugs go away.  Infrastructure improvements
> > and bugfixes get leveraged.  Dead and crufticious code can vanish.
> > And so forth.
> 
> I absolutely and positively agree with David here.
> 
> I just last week converted all of both sparc ports to the generic
> RTC layer and what a huge burdon has been moved off of my shoulders.
> 
> The RTC layer is very nice and it even allows writing drivers for
> very simplistic RTC devices (even ones that cannot be written)
> with ease.  I had two such cases to handle on sparc64.

I'm guessing they're not upstream yet (since I can't find them)?

However, if you based them on rtc-ppc.c then yes, I agree, it looks
reasonably easy:  it's just a matter of converting over the GEN_RTC
PDT_TOD helpers.

On a related note ... I could do this specifically for parisc, but I
could also do a GEN_RTC conversion to PDC_CLASS ... would that be more
helpful?

James


