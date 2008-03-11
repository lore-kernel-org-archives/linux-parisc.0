From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: Segfault when ogg123 exits
Date: Tue, 11 Mar 2008 02:09:56 +0000
Message-ID: <20080311020956.GA4155@miranda.arrow>
References: <20080305213128.GA27120@miranda.arrow> <119aab440803101739l778c3220w9102f6d814839694@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440803101739l778c3220w9102f6d814839694@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Mar 10, 2008 at 08:39:12PM -0400, Carlos O'Donell wrote:
> Can you distill this into a smaller testcase? Maybe a call to dlopen()
> to load a library that has a function called by timer_create?

I just ran ogg123 in gdb with a breakpoint set on timer_create(), and it
didn't get triggered, so timer_create() itself seems unlikely to be the
problem, but I can certainly try chopping libao down a bit.

BTW, this happens with both the OSS and ALSA plugins.

Side note: I've found that while running 'while (true); do true; done',
mmapped ALSA output seems to work!  If I drop the brackets, I just get 
noise -- presumably because it doesn't fork without them.
-- 
Stuart Brady
