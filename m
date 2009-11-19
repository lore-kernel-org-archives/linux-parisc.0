From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Changes to fcntl.h and F_* numbers?
Date: Thu, 19 Nov 2009 12:00:07 -0500
Message-ID: <119aab440911190900t62122ed8m987c55821ca64062@mail.gmail.com>
References: <119aab440911181222v79ad775ena36a4140e80847e3@mail.gmail.com>
	 <20091119032220.GG28962@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091119032220.GG28962@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Nov 18, 2009 at 10:22 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> On Wed, Nov 18, 2009 at 03:22:15PM -0500, Carlos O'Donell wrote:
>> Kyle, Helge,
>>
>> I've seen some recent churn regarding the kernel fcntl.h and F_* numbers.
>>
>> If our numbers change please keep me in the loop so I can update the C
>> library side.
>>
>
> ?

http://marc.info/?l=linux-api&m=125688056905828&w=2

> Unless you added things based on what's in git to libc, there's been no
> changes recently. It would be fairly unwise to pick things out before
> they've been in a released kernel, since they're subject to change up
> until that point...
>
> After that, the assignments are absolutely immutable...

Thanks.

Cheers,
Carlos.
