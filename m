From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Sun, 23 Nov 2008 00:13:48 -0700
Message-ID: <20081123071348.GA31575@colo.lackof.org>
References: <49231FD0.9040409@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49231FD0.9040409@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Nov 18, 2008 at 09:04:32PM +0100, Helge Deller wrote:
> Hello PA hackers,
>
> I've tried various -rc candidates in the last few weeks, and sadly the 
> parisc kernel is in pretty bad shape.
>
> At the beginning I started to get problems only when I had USB 
> keyboard/mouse attached to the PA machine. This lead to bugzilla 
> http://bugzilla.kernel.org/show_bug.cgi?id=11913

I don't have any USB devices attached (serial console) on j6000.
Also getting occasional:
Backtrace:

with no other output when a process (usually hppa64-gcc) segfaults "randomly".
This is with kernel builds.

> Now, with -rc4 and -rc5 things got even worse.

I've tried both -rc3 and -rc5. I'm going to try 2.6.27.7 as well.

> Crashes happen often just directly at the beginning.
> I'm sure it's not USB related any more, and I assume we have some strange 
> mm-problem somewhere.

I'm inclined to agree though it's just a guess.

> The kernel crashes at various places, and mostly a null-pointer is 
> involved.

I haven't crashed the kernel per se, just getting segfaults reminiscent
of when we still had issues with mm not playing well with VIVT caches.

> Right now I'm clueless...

Sorry, I'm not better. :(
All I can do is try to work backwards a bit...but we've been in
pretty bad shape with various types of breakage since 2.6.22 about.

grant
