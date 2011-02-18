From: Matt Turner <mattst88@gmail.com>
Subject: Re: GCC 4.5 regression
Date: Fri, 18 Feb 2011 01:28:20 +0000
Message-ID: <AANLkTinte7Msj3ZJBGH8bQ2_PYud76vOh0ojQb9etwT7@mail.gmail.com>
References: <20110217201523.2da3b41a@zombie>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110217201523.2da3b41a@zombie>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Feb 17, 2011 at 7:15 PM, Guy Martin <gmsoft@tuxicoman.be> wrote:
> I've attached a reduced test case. The program is supposed to
> segfault because of a stack overflow. However, with 4.5, it just hangs.
> It seems that 4.5 simply over-optimize the function and replaces it
> with a single jump.

http://bugs.gentoo.org/show_bug.cgi?id=340923

It's known and fixed. It's not a gcc regression, nor is it
HPPA-specific (didn't you try to confirm that it was HPPA-specific? :)

The reason you're hitting it is that you've keyworded gcc-4.5.2, but
aren't running a full ~hppa system. vapier doesn't seem to acknowledge
that this is a reasonable, sensible, or even common configuration.

Anyway, false alarm.

Matt
