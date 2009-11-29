From: Helge Deller <deller@gmx.de>
Subject: Re: Changes to fcntl.h and F_* numbers?
Date: Sun, 29 Nov 2009 20:55:41 +0100
Message-ID: <4B12D1BD.90602@gmx.de>
References: <119aab440911181222v79ad775ena36a4140e80847e3@mail.gmail.com>	 <20091119032220.GG28962@bombadil.infradead.org>	 <119aab440911190900t62122ed8m987c55821ca64062@mail.gmail.com>	 <1258651414.6363.12.camel@mulgrave.site>	 <119aab440911201457j1727576blde3c62569f927711@mail.gmail.com>	 <4B10509D.3020400@gmx.de> <119aab440911291017h1704a159j61421323b8099a3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440911291017h1704a159j61421323b8099a3@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/29/2009 07:17 PM, Carlos O'Donell wrote:
> On Fri, Nov 27, 2009 at 5:20 PM, Helge Deller<deller@gmx.de>  wrote:
>> Hi Carlos,
>>
>> FWIW, Stephen's patch has been applied to mainline (2.6.32-rc8) in the
>> meantime...
>
> Thanks Helge. Could you do some sleuthing for me? Were the F_SETOWN_EX
> and F_GETOWN_EX ever in any released kernel?

Those were added by this commit:

commit ba0a6c9f6fceed11c6a99e8326f0477fe383e6b5
Author: Peter Zijlstra <a.p.zijlstra@chello.nl>
Date:   Wed Sep 23 15:57:03 2009 -0700
     fcntl: add F_[SG]ETOWN_EX

Linux kernel 2.6.31 was tagged:
Date:   Wed Sep 9 15:13:59 2009 -0700
(according to the git-log of the top Makefile)

So I don't think they were ever in any released kernel.

Helge
