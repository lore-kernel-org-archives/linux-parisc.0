From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] Make EWOULDBLOCK be equal to EAGAIN on parisc.
Date: Fri, 17 Jan 2014 09:01:31 -0500
Message-ID: <BLU0-SMTP49AD2B087335E0EF03F54197B80@phx.gbl>
References: "\"<7b86ec9f26dd9a18e7fae7a39e6a3382@tuxicoman.be>" <CAE2sS1gmD21qT=UPJEt9VfAnE=e-k=qwkQM0nUO0viMaJSm3ng@mail.gmail.com>" <BLU0-SMTP89CC166E31998D28320EA697B90@phx.gbl> <CAE2sS1hO=do8VTwn-_mPwZge_AdunrOfoC0VW4RnezaDfZYxXQ@mail.gmail.com> <52D84BF5.3010001@gmx.de> <faa430fa75815f8c37dd2ec4ccd4a863@tuxicoman.be>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Helge Deller <deller@gmx.de>,
	Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <faa430fa75815f8c37dd2ec4ccd4a863@tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 17-Jan-14, at 3:55 AM, Guy Martin wrote:

> So despite the fact that this will break the ABI, the breakage  
> should be minimal
> if non existent while it will fix a lot of hard to find and identify  
> issues.

Have you tested the change?

Dave
--
John David Anglin	dave.anglin@bell.net



