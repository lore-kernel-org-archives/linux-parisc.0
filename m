From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 2.6.39-rc3] parsic: Fix futex support
Date: Mon, 8 Aug 2011 20:47:23 -0400
Message-ID: <BLU0-SMTP53E51639EBF88870A693DF97200@phx.gbl>
References: <4E177624.1030500@systemhalted.org> <201107081742.48874.vapier@gentoo.org> <4E1780EE.1010405@systemhalted.org> <BLU0-SMTP8777233F78FA13F6037090974E0@phx.gbl> <CADZpyixCFm7YUfihEJs+eR+gyUcw+S_ty+v4w2bK2s0jMFwUQg@mail.gmail.com> <2F6A03B7-0729-4774-AD1F-5D3C571DE51D@bell.net> <BLU0-SMTP8613717861B7E5D22BB762973C0@phx.gbl> <BLU0-SMTP45D898F67A78AB9E546B37973F0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: "Carlos O'Donell" <carlos@systemhalted.org>,
	Mike Frysinger <vapier@gentoo.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP45D898F67A78AB9E546B37973F0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On 6-Aug-11, at 11:33 AM, John David Anglin wrote:

> On 5-Aug-11, at 5:44 PM, John David Anglin wrote:
>
>> I am currently building 2.13 and will see what needs fixing.


For better or worse, I hacked the glibc fail list and installed  
2.13-13 with multiarch support.
This was a bit hairy because I didn't realize some of the  
dependencies.  I should have read
the debian transition wiki...

In any case, I have installed and rebuilt a bunch of stuff including  
pam.   I have my fingers
crossed that the main cache bug is fixed on my rp3440.

There are still issues and a lot of stuff to do to complete the  
transition.

nscd is still broken:
http://www.spinics.net/lists/linux-parisc/msg02195.html
I probably shouldn't have installed it.  Problem is fixed by disabling  
passwd and group caching
in conf file.  This is probably a glibc timer issue as problem goes  
away when commands are
repeated.

Multiarch support is a pain in the neck.  The debian patches to  
binutils and GCC haven't been
sent upstream, so normal GCC testing is broken (includes and libraries  
are now in target
specific directories).  I think the same is also true for glibc.   
Other packages also need to be
aware of the change.  Probably, the library universe needs completely  
rebuilding.

Currently, I'm stuck trying to build the attr package.  There seems to  
be a glibc issue with
main which causes the build to fail.  However, it might be a libtool  
issue (it probably needs
to be multiarch aware).

So, this is where we have to go to support PA-RISC debian linux.

Dave
--
John David Anglin	dave.anglin@bell.net



