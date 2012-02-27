From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: fix longstanding build failure on prefetch
Date: Mon, 27 Feb 2012 09:24:49 -0600
Message-ID: <1330356289.2822.45.camel@dabdike.int.hansenpartnership.com>
References: <1330289478-12603-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: jejb@parisc-linux.org, kyle@mcmartin.ca, deller@gmx.de,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, rientjes@google.com,
	xiyou.wangcong@gmail.com
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1330289478-12603-1-git-send-email-paul.gortmaker@windriver.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2012-02-26 at 15:51 -0500, Paul Gortmaker wrote:
> Upstream commit e66eed651fd18a961f11cda62f3b5286c8cc4f9f
> 
>     "list: remove prefetching from regular list iterators"
> 
> removed <linux/prefetch.h> from <linux/list.h> very early in the
> v3.0 dev cycle (v2.6.39-2-ge66eed6), thereby causing build failures
> when it exposed the implicit prefetch users in parisc.

I already have this in my internal patch queue:

http://marc.info/?l=linux-parisc&m=132825467010662

James
