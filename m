From: Zhao Hongjiang <zhaohongjiang@huawei.com>
Subject: Re: [PATCH] parisc: remove the second argument of kmap_atomic
Date: Sun, 28 Apr 2013 09:05:22 +0800
Message-ID: <517C75D2.2080007@huawei.com>
References: <517BAB83.2060308@huawei.com> <1516359.zmskQ3qPXR@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: <jejb@parisc-linux.org>, <deller@gmx.de>, <dave.anglin@bell.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	<linux-parisc@vger.kernel.org>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1516359.zmskQ3qPXR@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2013/4/27 19:43, Rolf Eike Beer wrote:
> Zhao Hongjiang wrote:
>> kmap_atomic allows only one argument now, just move the second.
> 
> Do you mean "remove"?
> 
yes, this should be "remove".

