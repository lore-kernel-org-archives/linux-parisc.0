From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Question about execve.
Date: Sun, 28 Mar 2010 19:12:53 -0400
Message-ID: <119aab441003281612j6bf4d910g52f94490824cfd81@mail.gmail.com>
References: <119aab441003281404y7bc37dddw14db435b85704b4f@mail.gmail.com>
	 <20100328212110.03F224E77@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100328212110.03F224E77@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Mar 28, 2010 at 5:21 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> If I provide you with a new glibc with the r19 fix would you be able
>> to test it out?
>
> Yes.

I know it's easier to debug a static application for these cases, so I
think a fixed glibc will help.

I have an unstable libc6 currently building with the changes to
save/restore r19 in all cases.

We still aren't any closer to explaining why my shared case doesn't work.

I still don't have a good answer to this question:

* What prevents the execve from returning to userspace?

Cheers,
Carlos.
