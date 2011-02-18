From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: GCC 4.5 regression
Date: Fri, 18 Feb 2011 00:37:08 -0500
Message-ID: <AANLkTimxw1_eK7v_tdKQa5nMw=d02jBdKnNOdUVe8oV_@mail.gmail.com>
References: <20110217201523.2da3b41a@zombie> <AANLkTinte7Msj3ZJBGH8bQ2_PYud76vOh0ojQb9etwT7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Guy Martin <gmsoft@tuxicoman.be>, linux-parisc@vger.kernel.org
To: Matt Turner <mattst88@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTinte7Msj3ZJBGH8bQ2_PYud76vOh0ojQb9etwT7@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Feb 17, 2011 at 8:28 PM, Matt Turner wrote:
> On Thu, Feb 17, 2011 at 7:15 PM, Guy Martin wrote:
>> I've attached a reduced test case. The program is supposed to
>> segfault because of a stack overflow. However, with 4.5, it just hangs.
>> It seems that 4.5 simply over-optimize the function and replaces it
>> with a single jump.
>
> http://bugs.gentoo.org/show_bug.cgi?id=340923
>
> It's known and fixed. It's not a gcc regression, nor is it
> HPPA-specific (didn't you try to confirm that it was HPPA-specific? :)
>
> The reason you're hitting it is that you've keyworded gcc-4.5.2, but
> aren't running a full ~hppa system. vapier doesn't seem to acknowledge
> that this is a reasonable, sensible, or even common configuration.

that's because it is not.  there's a difference between running brand
new bleeding edge versions of the toolchain on a stable system all the
time and running them for the stabilization process.  inevitably every
gcc/glibc/kernel header upgrade in ~arch breaks a shit ton of stable
packages (and even unstable packages), the vast majority of which will
be fixed by those packages stabilizing a new version as natural
progression by the time the toolchain versions have settled for
stabilization.
-mike
