From: Helge Deller <deller@gmx.de>
Subject: Re: parisc: fix compile warnings triggered by atomic_sub(sizeof(),v)
Date: Thu, 28 Feb 2013 00:41:17 +0100
Message-ID: <512E999D.7000300@gmx.de>
References: <20130227221137.GA2806@p100.box> <20130227221552.GA2817@p100.box> <5949791.xCBY7uv0Ms@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5949791.xCBY7uv0Ms@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 02/28/2013 12:09 AM, Rolf Eike Beer wrote:
> Helge Deller wrote:
> 
>> atomic_sub() is defined as
>> and if VAL is of type unsigned int (as returned by sizeof()), negating
>> this value will overflow. Fix this by type-casting VAL to int type:
> 
> Something in the first line of the message seems missing.

Oops...
This line:
#define atomic_sub(VAL,v)        ((void)(__atomic_add_return(-(VAL),(v))))
is missing.
It was probably ignored by git am or was eaten by vi due to the "#" :-(

I'll fix that.

Thanks!
Helge 

