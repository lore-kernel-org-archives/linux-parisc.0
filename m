From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: can't compile kernel for parisc
Date: Fri, 27 Feb 2009 08:18:09 -0500
Message-ID: <119aab440902270518t2cc34c13x4991fb394d54f774@mail.gmail.com>
References: <a4423d670902270247g70134a05n20fe3ba7c8970fbe@mail.gmail.com>
	 <119aab440902270424oaafbc7ehcc23b433e8ae06e5@mail.gmail.com>
	 <a4423d670902270504w6386cffdp91249e962dfa3fa4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670902270504w6386cffdp91249e962dfa3fa4@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Feb 27, 2009 at 8:04 AM, Alexander Beregalov
<a.beregalov@gmail.com> wrote:
> 2009/2/27 Carlos O'Donell <carlos@systemhalted.org>:
>> On Fri, Feb 27, 2009 at 5:47 AM, Alexander Beregalov
>> <a.beregalov@gmail.com> wrote:
>>> I am building the kernel for parisc for the first time.
>>> Have I missed anything important?
>>
>> Where did you get your kernel source? e.g. I cloned foo, merged bar
>> into, foo and then compiled.
>
> I cloned current Linus's git tree.

I always merge from Kyle's tree (parisc maintainer), which has the
latest parisc patches. There are at least 26 patches in kyle's tree
which are not on Linus' git tree.

e.g.
git remote -v
kyle    git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git
origin  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git

Cheers,
Carlos.
