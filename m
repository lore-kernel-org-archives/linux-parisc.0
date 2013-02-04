From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: fixes and cleanups in page cache flushing (1/4)
Date: Mon, 04 Feb 2013 12:11:25 -0500
Message-ID: <510FEBBD.9000207@bell.net>
References: <20130203225909.GA14573@p100.box> <777a626d6eff1b2a6194dcfa6a8ad313@sf-mail.de> <20130204152456.294020@gmx.net> <20130204163743.248510@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: eike-kernel@sf-tec.de, linux-parisc@vger.kernel.org,
	James.Bottomley@hansenpartnership.com
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130204163743.248510@gmx.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2/4/2013 11:37 AM, Helge Deller wrote:
>>> Von: Rolf Eike Beer <eike-kernel@sf-tec.de>
>>> Helge Deller wrote:
>>>> This is the first patch in a series of 4, with which the page cache
>>>> flushing of
>>>> parisc will gets fixed and enhanced. This even fixes the nasty
>>>> "minifail" bug
>>>> (http://wiki.parisc-linux.org/TestCases?highlight=%28minifail%29)
>>>> which
>>>> prevented parisc to stay an official debian port.  Basically the
>>>> flush in
>>>> copy_user_page together with the TLB patch from commit
>>>> 7139bc1579901b53db7e898789e916ee2fb52d78 is what fixes the minifail
>>>> bug.
>>> Is this series expected to fix the thread related problems I see in the
>>> git testsuite?
>> I expect so, if not, please let us know!
> Ahem... actually:
> MAYBE!!!
>
> The problem is, that you probably will need an updated glibc (and maybe compiler) as well. Dave has done a lot of work to fix stuff. We have copied the most important update-packages to ftp.parisc-linux.org. To update, just make sure the following lines are in your /etc/apt/source.list file:
> deb ftp://ftp.de.debian.org/debian-ports unstable main
> deb ftp://ftp.parisc-linux.org/debian-ports/unstable unstable main
> deb-src ftp://ftp.de.debian.org/debian unstable main
>
> Do *not* just update to the packages of debian-ports.org. If you do that it will render your system unbootable, since the udev-package is broken and it will not find your discs at startup.
>
> It's on my todo-list to upload further packages, update the website on how to update your system, and of course to get a buildd working...
Just a note, these packages are for debian systems.  I believe that Eike is
running gentoo.  With respect to glibc, Carlos had a set of changes which I
submitted to Debian.  The full set was accepted around the -30 unstable 
release.
I think most of these are in gentoo but the matter needs review.

Dave

-- 
John David Anglin    dave.anglin@bell.net

