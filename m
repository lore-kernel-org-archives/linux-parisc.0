From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] parisc: fix longstanding build failure on prefetch
Date: Mon, 27 Feb 2012 11:02:37 -0500
Message-ID: <4F4BA91D.7090303@windriver.com>
References: <1330289478-12603-1-git-send-email-paul.gortmaker@windriver.com> <1330356289.2822.45.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: <jejb@parisc-linux.org>, <kyle@mcmartin.ca>, <deller@gmx.de>,
	<linux-parisc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-next@vger.kernel.org>, <rientjes@google.com>,
	<xiyou.wangcong@gmail.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <1330356289.2822.45.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12-02-27 10:24 AM, James Bottomley wrote:
> On Sun, 2012-02-26 at 15:51 -0500, Paul Gortmaker wrote:
>> Upstream commit e66eed651fd18a961f11cda62f3b5286c8cc4f9f
>>
>>     "list: remove prefetching from regular list iterators"
>>
>> removed <linux/prefetch.h> from <linux/list.h> very early in the
>> v3.0 dev cycle (v2.6.39-2-ge66eed6), thereby causing build failures
>> when it exposed the implicit prefetch users in parisc.
> 
> I already have this in my internal patch queue:
> 
> http://marc.info/?l=linux-parisc&m=132825467010662

Is this in a different queue than what is in linux next?

It would be nice to see such build fixes get into linux-next
ASAP, so folks doing multi-arch coverage builds on their work
can know if they've introduced a regression.  At the moment,
the parisc builds in linux-next have been worthless for over
six months, and I'm sure I'm not the 1st one to waste time
"re-solving" old bugs like this.

Thanks,
Paul.

> 
> James
> 
> 
