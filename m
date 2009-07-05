From: Helge Deller <deller@gmx.de>
Subject: Re: HPPA and Squeeze
Date: Sun, 05 Jul 2009 11:06:52 +0200
Message-ID: <4A506D2C.6080801@gmx.de>
References: <20090704233454.B1A2B5160@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Kurt Roeckx <kurt@roeckx.be>, pkern@debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	debian-release@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090704233454.B1A2B5160@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 07/05/2009 01:34 AM, John David Anglin wrote:
>> On Fri, Jul 03, 2009 at 09:28:00PM +0200, Philipp Kern wrote:
>>> On Fri, Jul 03, 2009 at 08:57:56PM +0200, Kurt Roeckx wrote:
>>>> Did something change to peri?  I'm currently only seeing them on
>>>> penalosa.
>>> UP kernel, maybe?
>> Both peri and penalosa run 2.6.29-2-parisc64-smp and from what I
>> can tell run on identical hardware.
>
> I tried a SMP kernel (2.6.30.1 with the patch set posted earlier) on
> my rp34404.  Fired up a GCC build.  It didn't take more than a few
> minutes to trigger a couple of segvs in /bin/sh.  On the other hand,
> I ran a UP version of 2.6.30 for more than a week without any major
> problems.

So, instead of just complaining, wouldn't it be useful if someone with
root access would install a UP kernel (and disable nscd) for the time
being on the build servers?
That way we all would avoid debian build problems and could concentrate
on solving the issues with the SMP kernel itself.

In the meantime, all (IMHO) major kernel patches have now been included
in Linus' 2.6.31-rc2 kernel and I plan to backport and send them to the
stable-kernel team for inclusion into 2.6.29 and 2.6.30 stable
kernel series.

Helge
