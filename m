From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [RFC PATCH] 64bit LWS CAS
Date: Fri, 18 Jul 2014 20:38:44 -0400
Message-ID: <CAE2sS1jCtgrQKReKsdYj4Of+0pR0p+gw+RwqzncEyT=mMbQMLQ@mail.gmail.com>
References: <20140717220000.555b2bec@dellete.lux.tuxicoman.be>
	<BLU436-SMTP218A41974C191160FBF5D1097F50@phx.gbl>
	<CAE2sS1hGVBucXU+34APoWWLRVpmP9RDA0GOOUMiGSKXGhioYsA@mail.gmail.com>
	<BLU436-SMTP1308F81AF14D15C0659D6D997F50@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Guy Martin <gmsoft@tuxicoman.be>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP1308F81AF14D15C0659D6D997F50@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jul 18, 2014 at 6:12 PM, John David Anglin <dave.anglin@bell.net> wrote:
> There is no testing beyond the general testing of atomics in GCC.  There is
> masking
> in the GCC code but I think this is racy.  Another thread might modify the
> masked data
> during the CAS operation and this might be lost.  I've never seen it in the
> real world though.

The race is real IMO, but you're right that it might be hard to trigger.

My opinion is that the only way you can do this is to write new LWS
CAS variants that do half-word or byte loads, compares and stores. You
can't touch the surrounding data safely.

Cheers,
Carlos.
