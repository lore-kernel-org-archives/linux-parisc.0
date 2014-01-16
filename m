From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] Make EWOULDBLOCK be equal to EAGAIN on parisc.
Date: Thu, 16 Jan 2014 22:15:33 +0100
Message-ID: <52D84BF5.3010001@gmx.de>
References: <7b86ec9f26dd9a18e7fae7a39e6a3382@tuxicoman.be>	<CAE2sS1gmD21qT=UPJEt9VfAnE=e-k=qwkQM0nUO0viMaJSm3ng@mail.gmail.com>	<BLU0-SMTP89CC166E31998D28320EA697B90@phx.gbl> <CAE2sS1hO=do8VTwn-_mPwZge_AdunrOfoC0VW4RnezaDfZYxXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave.anglin@bell.net>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1hO=do8VTwn-_mPwZge_AdunrOfoC0VW4RnezaDfZYxXQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01/16/2014 10:05 PM, Carlos O'Donell wrote:
> On Thu, Jan 16, 2014 at 3:49 PM, John David Anglin <dave.anglin@bell.net> wrote:
>>> This is an ABI break.
>>>
>>> You can't do this without rebuilding userspace.
>>>
>>> You need debian an gentoo onboard to do this ABI break.
>>
>> This would take about a month on Debian, so I'm against.  Various bits of kernel code traditionally
>> return EWOULDBLOCK, so any application code that just checks EWOULDBLOCK would fail.
> 
> That's not true if, like all other targets, EWOULDBLOCK == AGAIN. It's
> only true on hppa, and that's the problem.
> 
> The kernel is completely inconsistent about returning EWOULDBLOCK or
> EAGAIN, and the standards do dictate one or the other so the kernel
> and glibc are correct to use one or the other to match the standard.
> 
> However, user applications are equally sloppy about checking the right value.

Guy, do you have actual programs which are currently broken and which don't check for both?
My feeling is, that most programs were fixed, but I might be wrong...

Helge
