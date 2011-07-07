From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Sort output dynamic relocations.
Date: Thu, 07 Jul 2011 13:44:14 -0400
Message-ID: <4E15F06E.8040601@bell.net>
References: <CADZpyiyS2m9cc=RuUg+DOc3xfEMFOAfdYWwFLbjDTUmgqtnDsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: John David Anglin <dave.anglin@nrc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyiyS2m9cc=RuUg+DOc3xfEMFOAfdYWwFLbjDTUmgqtnDsQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 7/7/2011 11:29 AM, Carlos O'Donell wrote:
> Dave,
>
> FYI.
>
> PA should be sorting relocations in .rlea.dyn such that realtive
> relocations (DIR32) are listed first before opd relocs (PLABEL32).
I imagine that this shouldn't be too hard to implement.
> This is required for the dynamic linker in glibc to operate correctly.

Is this related to the initfini_array issue?

Dave

-- 
John David Anglin    dave.anglin@bell.net

