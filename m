From: Helge Deller <deller@gmx.de>
Subject: Re: my usual problem with 64bit kernel
Date: Fri, 04 Dec 2009 19:50:10 +0100
Message-ID: <4B1959E2.1030700@gmx.de>
References: <20091204172838.GA4551@raptus.dandreoli.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc@vger.kernel.org, cavokz@gmail.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091204172838.GA4551@raptus.dandreoli.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12/04/2009 06:28 PM, Domenico Andreoli wrote:
>    today i checked the support of 64bit on my j5600. latest kernel
> that successfully (and still) run it was 2.6.22, latest one i tried
> (and still fails) is a fresh 2.6.32.
>
> i have not any specific knowlwdge of the beast, only a pile of manuals
> that i will use to try to understand what's wrong.
>
> only, if anybody has a hint to point me in the right direction i would
> save a lot of time.  i attached the kernel boot log and the output of
> ser pim firmware command.

Could you try the original 2.6.30 and/or 2.6.31 smp kernels from
debian unstable as well?
I just want to make sure, that you have more or less a correct kernel
configuration setup (.config)....

Helge
