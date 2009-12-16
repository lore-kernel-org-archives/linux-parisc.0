From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: vfork test case.
Date: Wed, 16 Dec 2009 08:24:34 -0500
Message-ID: <119aab440912160524s71b301c8u506eb67130f317c0@mail.gmail.com>
References: <119aab440912061319y5b863203ve5dc3dc568a6ccec@mail.gmail.com>
	 <20091215222119.E6CD84ED7@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca, James.Bottomley@hansenpartnership.com
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091215222119.E6CD84ED7@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 15, 2009 at 5:21 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> I have constructed a vfork test case which shows some of the problems
>> I have using vfork reliably. This fails every time on my PA8700 system
>> running 2.6.32-rc6. It appears as though r28 (ret0) in the parent is
>> being corrupted.
>
> The test doesn't fail on two of my builds:
> Linux mx3210 2.6.31.7 #5 Wed Dec 9 22:49:53 EST 2009 parisc64
> Linux hiauly6 2.6.31.7 #18 Wed Dec 9 21:34:36 EST 2009 parisc

Interesting.

> Are you running a SMP config?

Yes, 64-bit 2.6.32-rc6.

I recently discovered that execve is actually *returning* from the
kernel, and this is a huge problem. I'm instrumenting the kernel to
determine why this is happening.

Cheers,
Carlos.
