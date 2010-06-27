From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: vfork test case.
Date: Sun, 27 Jun 2010 11:41:49 -0400
Message-ID: <AANLkTilRe1fvdQInq5Xo_uX-wGDn94WXLx3QAWKOgrjF@mail.gmail.com>
References: <119aab440912061319y5b863203ve5dc3dc568a6ccec@mail.gmail.com>
	<20100620042814.ECC205160@hiauly1.hia.nrc.ca>
	<AANLkTilfnhsd5mWmO_qJeCv0XmZ6IYKw6Il19No3_wnF@mail.gmail.com>
	<AANLkTinFBc9524WWuwrRvuBQGY0OCqjPIZ_t9A7esb-B@mail.gmail.com>
	<20100622225035.GA13794@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca,
	James.Bottomley@hansenpartnership.com
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100622225035.GA13794@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 22, 2010 at 6:50 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> On Tue, 22 Jun 2010, Carlos O'Donell wrote:
>
>> =A0 =A0 =A0 =A0 /* Return, no need to restore the PIC register. */
>> - =A0 =A0 =A0 ldw =A0 =A0 -84(%sp), %rp
>> - =A0 =A0 =A0 bv =A0 =A0 =A0%r0(%rp)
>> - =A0 =A0 =A0 ldwm =A0 =A0-64(%sp), %r3
>> + =A0 =A0 =A0 ldw =A0 =A0 -20(%sp), %rp
>> + =A0 =A0 =A0 bv,n =A0 =A0%r0(%rp)
>
> For the reasons discussed, I don't believe that %rp should be restore=
d
> from the stack.

The final version of the patch does not restore %sp from the callers st=
ack.

This is now fixed upstream here:
http://sourceware.org/git/?p=3Dglibc-ports.git;a=3Dcommit;h=3D3680f14a7=
d12a9faa86e09aaea1b3aa20713355e

I have pushed this fix into debian-glibc, so it should be in the next
release of the library.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
