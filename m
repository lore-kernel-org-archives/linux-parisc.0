From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] Make EWOULDBLOCK be equal to EAGAIN on parisc.
Date: Fri, 17 Jan 2014 09:08:08 -0500
Message-ID: <CAE2sS1hdPiLejCRKSJkCGb62WaeqK3uGgXU7Yjy_de9NHyaS3Q@mail.gmail.com>
References: <7b86ec9f26dd9a18e7fae7a39e6a3382@tuxicoman.be>
	<CAE2sS1gmD21qT=UPJEt9VfAnE=e-k=qwkQM0nUO0viMaJSm3ng@mail.gmail.com>
	<BLU0-SMTP89CC166E31998D28320EA697B90@phx.gbl>
	<CAE2sS1hO=do8VTwn-_mPwZge_AdunrOfoC0VW4RnezaDfZYxXQ@mail.gmail.com>
	<52D84BF5.3010001@gmx.de>
	<faa430fa75815f8c37dd2ec4ccd4a863@tuxicoman.be>
	<BLU0-SMTP49AD2B087335E0EF03F54197B80@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Guy Martin <gmsoft@tuxicoman.be>, Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP49AD2B087335E0EF03F54197B80@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 17, 2014 at 9:01 AM, John David Anglin <dave.anglin@bell.net> wrote:
>
> On 17-Jan-14, at 3:55 AM, Guy Martin wrote:
>
>> So despite the fact that this will break the ABI, the breakage should be minimal
>> if non existent while it will fix a lot of hard to find and identify issues.
>
>
> Have you tested the change?

This is a good point.

If you can make this change and still boot your system with a rebuilt
kernel, then there is hope that your claims are true.

The basic argument would be:
* Change kernel header to make EWOULDBLOCK == AGAIN.
* Rebuild kernel.
* Boot system.
* Verify system is semifunctional, networking, IO, disk, XVnc, etc.

That would go a long way to showing that most of the system works.

Then if you emerge the world against those changed headers and it goes
well, then we might be talking about it being a low-impact change.

Cheers,
Carlos.
