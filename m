From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] Add non-zero module sections to sysfs
Date: Mon, 08 Apr 2013 13:44:45 +0930
Message-ID: <878v4tbqve.fsf@rustcorp.com.au>
References: <1364994499-23708-1-git-send-email-sisewank@cip.cs.fau.de> <87mwtf3ya1.fsf@rustcorp.com.au> <515D4A7F.5070102@cip.cs.fau.de> <87vc81lj7x.fsf@rustcorp.com.au> <1365156435.1970.31.camel@dabdike> <20130406104053.GA24710@yoda.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Sebastian Wankerl <sisewank@cip.cs.fau.de>,
	linux-kernel@vger.kernel.org,
	Philip Kranz <philip.kranz@googlemail.com>,
	i4passt@lists.informatik.uni-erlangen.de,
	linux-parisc@vger.kernel.org
To: Philip Kranz <philip.kranz@googlemail.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130406104053.GA24710@yoda.lan>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Philip Kranz <philip.kranz@googlemail.com> writes:
> Hello.
>
> On Fri, Apr 05, 2013 at 12:07:15PM +0200, James Bottomley wrote:
>> Just so you know: this isn't a parisc specific problem.  Gcc produces
>> duplicate section names under various circumstances, but the one that
>> bites us is -ffunction-sections.  Note that there are proposals to use
>> -ffunction-sections on all architectures (so we can garbage collect
>> unused functions) in which case you'll induce the bug identified in
>> 35dead4235e2b67da7275b4122fed37099c2f462 on every architecture
>
> I am not able to produce an object file with duplicate section names
> using gcc on x86. Even with -ffunction-sections, every section gets a
> unique name. Is this architecture-specific behaviour of gcc?

Good point.  ld -r will collapse them into the same section (since gcc
produces them they have to have the same section attributes).

You can do it with --unique, but no arch uses that.  PARISC has a
platform-specific toolchain hack which does that for .text sections.
(Thanks to Alan Modra for that clue...)

Thanks,
Rusty.
