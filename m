From: John David Anglin <dave.anglin@bell.net>
Subject: Re: decommissioning parisc-linux.org
Date: Sat, 11 Feb 2012 19:25:24 -0500
Message-ID: <BLU0-SMTP163497415546DE0CA58030977E0@phx.gbl>
References: <20120208143347.GB22903@dannf.org> <CA+DQjFhKZiuxcoHJYcpDBUJW3xNNTDQhfm=d3trWG3u8DARtXw@mail.gmail.com> <BLU0-SMTP5575D9E1E9A88CEE0BD790977A0@phx.gbl> <20120209175547.GA22332@dannf.org> <BLU0-SMTP8734A5ED7DDBD9EC0C7A7597790@phx.gbl> <CA+DQjFicockZMkgKNwF=5Dk--gWraTfZg5mo1Ph8BnQjYkfK8A@mail.gmail.com> <BLU0-SMTP7852C9372515DE54919E3697790@phx.gbl> <CADZpyiy-fvtvR2K5m-rRznkNGd_S5xVL+Lo4ZV36f3SNPeRoNw@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Thibaut VARENE <T-Bone@parisc-linux.org>,
	dann frazier <dannf@dannf.org>,
	linux-parisc List <linux-parisc@vger.kernel.org>,
	taggart@lackof.org, bame@riverrock.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyiy-fvtvR2K5m-rRznkNGd_S5xVL+Lo4ZV36f3SNPeRoNw@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11-Feb-12, at 6:29 PM, Carlos O'Donell wrote:

> However, I will continue to do all the work required to keep HPPA
> working in glibc.

Here is what needs doing in glibc:

         * need to backport current 2.13 patches to debian
         * change build to gcc-4.6
         * update test failure list, or disable so package builds
         * broken password and group caching -- I disabled it in nscd  
conf

I believe that that I sent the patches for 2.13.  They are based on what
you sent me plus Guy's patch.  If you want, I'll send them again.
It looks to me like the next debian release will be based on 2.13.

gcc-4.6 is now the default compiler for unstable although glibc still
builds with 4.4.  I believe 4.6 is better than 4.4 based on my testing.

A more complicated issue is the multiarch support in unstable.  For
testing, it may be necessary to use current or 2.22 branch binutils,
gcc with multiarch support, and a glibc build with multiarch support.
debs are in the archives directory on shirka.esiee.fr.  If you don't
want to bother updating your a500, magnum on the esiee cluster
is updated.

My latest kernel patch posted to the parisc list resolves thread
issues for git, perl, python, etc.  There are still some cancellation
failures in the glibc testsuite, but I think the overall number of fails
is down.  Given that I'm seeing much better stability not using
the tmpalias region for clear_user_page and copy_user_page,
I think the next step is to remove this support from pacache.S.
Still using the tmpalias region for flushes but in the back of my
mind I think even the flushes may be racy (same page used for
two different mappings).

The nscd bug isn't critical and has been around for years.  Still,
it needs working around.

Regards,
Dave
--
John David Anglin	dave.anglin@bell.net



