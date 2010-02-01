From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: sys_accept4, SOCK_CLOEXEC, misc, bonghits, and others...
Date: Mon, 1 Feb 2010 17:55:39 -0500
Message-ID: <119aab441002011455kb7fde93q2441ef9e69e29105@mail.gmail.com>
References: <20091226182050.GH11593@bombadil.infradead.org>
	 <20100201135427.GA24051@bombadil.infradead.org>
	 <119aab441002010611y8977762k3ce0a827b503d3f8@mail.gmail.com>
	 <20100201213833.GE24051@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100201213833.GE24051@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Feb 1, 2010 at 4:38 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> On Mon, Feb 01, 2010 at 09:11:23AM -0500, Carlos O'Donell wrote:
>> IIUC SOCK_CLOEXEC only works in 2.6.27 or higher with accept4?
>>
>> In which case, since accept4 has never existed before, it's OK to
>> change this value?
>>
>
> Well, it's never worked either, so I assume it's safe to change. The
> main problem is glibc keeping a parallel copy of the system headers
> instead of using the sanitized ones, since this means anything which
> correctly used those headers has the right value.

Applied to libc-ports. Thanks.

Yes, I agree completely. They are here for hysterical raisins, and
eventually I think glibc will shed them with time.

> (Basically... any userspace program compiled against the old glibc will
> need to be rebuilt, but if we change it won't be any more broken than
> they already have been.)

Good, that's what I like to hear :-)

Cheers,
Carlos.
