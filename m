From: Simone Mannori <simone.mannori@gmail.com>
Subject: Re: Kernel for bug hunting
Date: Fri, 15 Apr 2016 10:45:41 +0200
Message-ID: <CACrbsaCZxvqqQOMymY_MHPNncv_8SnL4+9GuGYH4MUPOA7U_Ww@mail.gmail.com>
References: <CACrbsaA0-h9VYXCcQ8x9C++K-kSFSPiBAHye_Jr=urpASfHe=A@mail.gmail.com>
	<5710A91C.4040609@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5710A91C.4040609@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Perfect: now I have all the info that I need to start.

I'm going to clone your Linux branch.

Thanks a lot for your personal ".config" :-)

  Simone Mannori - ITALY



On 15 April 2016 at 10:41, Helge Deller <deller@gmx.de> wrote:
> Hi Simone,
>
> On 15.04.2016 07:04, Simone Mannori wrote:
>> I'm using Debian 8.0 (linux-parisc) on a c8000 and I would like to
>> recompile the Linux kernel for debugging purposes, hoping to find and
>> fix the "[radeon] and [nouveau] passive frame buffer mode".
>>
>> Q1: Which version you suggest? Stable /devevelopment / GIT ?
>
> I'd suggest to use 4.5-stable, or alternatively the debian 4.5.1 kernel source.
>
>> Q2: Where I can find it? (www.kernel.org ?)
>
> Yes, either clone linux-4.5.y from git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> (http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/),
> or run "apt-get update", "apt-get source linux" on debian.
> For that you need this in /etc/apt/sources.list:
> deb-src http://ftp.debian.org/debian unstable main
>
> Then, run "apt-get build-dep linux" once to get the build-depends.
>
>> Q3: Which GCC version? (4.x ? 5.x ?)
>
> gcc-4.9.
> Get's installed when you run "apt-get build-dep linux".
>
>> Q4: As ".config default", you suggest the Debian 8.0 one or you have a
>> better new one?
>
> The debian one is fine, alternatively you could use the one I'm using (attached here).
> "make c8000_defconfig" should work as well.
>
>> You have already suuggested me few [radeon] source files where put my
>> nose and what debugging tools I should use (printk). My actual problem
>> is to find the right kernel/gcc version (I've tried several
>> combinations, but the compilation stops with errors).
>
> Hope the above answers helps.
>
> Helge
>
