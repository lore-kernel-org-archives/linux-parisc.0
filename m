From: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Subject: Re: debian hppa
Date: Wed, 6 Jul 2011 19:20:53 -0400
Message-ID: <E1F45BBE-F922-4E1C-9DEC-FAF4BF4B4E26@nrc-cnrc.gc.ca>
References: <20110527213516.GH21744@dannf.org> <20110527233738.0B95D4FCB@hiauly1.hia.nrc.ca> <BANLkTi=maOnkCLD9aU=JDYL9257EkpHxnQ@mail.gmail.com> <20110601021049.GB3984@hiauly1.hia.nrc.ca> <BANLkTin2DhKC_ss6UsCPYxmTR-UD=GY0uw@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Cc: dann frazier <dannf@dannf.org>, <carlos@systemhalted.org>,
	<linux-parisc@vger.kernel.org>
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BANLkTin2DhKC_ss6UsCPYxmTR-UD=GY0uw@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Thibaut,

On 13-Jun-11, at 6:19 PM, Thibaut VARENE wrote:

>> I would say your other machines need updating even if the process is
>> somewhat rocky as that's the only way a broadbased release can be  
>> tested.
>
> Well I can assign one machine (the a500, being easy to reboot/fix as
> it is) to testing kernels, but for a stable kernel suitable for the
> machines I'm e.g. assigning to the GCC Compile Farm[0], what would be
> a good SMP kernel version to choose? I'm looking for the same level of
> hassle-freeness as 2.6.22.19 since these machines are under relatively
> heavy load and I cannot afford to tend to their care on a daily basis
> ;-)

Sorry for the delay in responding.  I think assigning the a500 to the  
GCC farm
provides good visibility.  For GCC, the kernel version doesn't matter  
much.  The
main issue is stability.

I was wondering if the rp3440 in the ESIEE might be assigned to  
running debian
buildd.  I believe that the current set of known kernel patches will  
make this
machine reasonably stable under medium load.  Carlos recently found a  
big
bug in the kernel futex code.  In any case, I recently successfully  
built many
unstable packages on my rp3440.

I would be willing to help getting this going.

Dave

