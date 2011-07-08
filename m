From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [PATCH 2.6.39-rc3] parsic: Fix futex support
Date: Fri, 08 Jul 2011 18:13:02 -0400
Message-ID: <4E1780EE.1010405@systemhalted.org>
References: <4E177624.1030500@systemhalted.org> <201107081742.48874.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201107081742.48874.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 7/8/2011 5:42 PM, Mike Frysinger wrote:
> On Friday, July 08, 2011 17:27:00 Carlos O'Donell wrote:
>> Implements futex op support and makes futex cmpxchg atomic.
>> Tested on 64-bit SMP kernel running on 2 x PA8700s.
> 
> seems like all the changes to this func are arch-independent and could be 
> placed into asm-generic/futex.h.  the current parisc futex.h looks like a copy 
> of the asm-generic one ...
> -mike

That's true. I didn't want to rock the boat on this one until
I hammered out all the userspace testing.

Cheers,
Carlos.
