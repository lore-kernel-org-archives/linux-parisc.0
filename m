From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: debian hppa
Date: Tue, 31 May 2011 22:10:50 -0400
Message-ID: <20110601021049.GB3984@hiauly1.hia.nrc.ca>
References: <20110527213516.GH21744@dannf.org> <20110527233738.0B95D4FCB@hiauly1.hia.nrc.ca> <BANLkTi=maOnkCLD9aU=JDYL9257EkpHxnQ@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dann frazier <dannf@dannf.org>, dave.anglin@nrc-cnrc.gc.ca,
	carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=maOnkCLD9aU=JDYL9257EkpHxnQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 28 May 2011, Thibaut VARENE wrote:

> I'm willing to provide access to hardware (machines listed under
> "ESIEE testring" on http://www.fr.parisc-linux.org/cluster.html -
> which needs update btw as the cupertino testring is no more) for as
> long as it'll be usable with Debian. I have zero interest in Gentoo
> (essentially for technical and practical reasons which are outside the
> scope of this email) and will not migrate to it. That means that if
> debian(-ports)/hppa is no more and I have to reclaim some rackspace in
> the datacenter I manage, the parisc machines will likely be the first
> to go away... I'll let people know if/whenever this happens, so that
> pickups can be arranged if need be.

I personally think it is worth trying to work toward one last linux
3.x release for hppa.  This release would have to be installable via CD
or network.

The release would be based on current tools and a somewhat limited
application set, as it is clear that we don't have the person power
for a complete debian release.  As Carlos indicated, users can compile
from source if they need something special.  The focus would be server
oriented.

With this in mind, I think it best to consider how the available hardware
can be utilized to achieve this goal.  In addition, to the ESIEE testring,
I believe that HP made available a number of machines for running their
buildds process.  Dan can probably tell us what the current status is for
these machines.

I'm not sure what the status of the Cupertino machines is and whether
any of the distributed machines will be available for this purpose.

Unfortunately, I can't open the machines that I have at NRC because of
NRC IT security policies.  At the moment, most of the available cycles on
these machines is allocated to GCC testing.  Possibly, some GCC support
could be refocused to provide more support to a Debian release.

> BTW, I'm still running 2.6.22.19 on most these machines, and I've kind
> of lost track: do we have a known better kernel I could safely upgrade
> to?

For the rp3440, the answer is definitely yes.  Unfortunately, 2.6.39
stable doesn't have the pata_cmd64x patch needed for DVD drive, or
James' latest cache fix.  So, I moved on.

I think the random segfault issue present on pa8800 and pa8900 machines
is largely fixed in 3.0.0-rc1, but it is clear linux kernels are much like
wine.  I think USB support for the rp3440 is broken and causes HPMCs.
So, I have it disabled.

At this time, there is no released stable kernel that I consider reliable
on hppa.  However, most recent kernel releases work ok on UP machines.
Of course, my testing tends to be with CPU intensive applications.

I am convinced that the rapid development methodology used by linux isn't
suited to ports with limited support.  Ideally, we should pick the next
kernel designated for longterm support and patch it.

For your other machines, the cache issues are less severe because
they support non equivalent aliasing.  However, don't throw away 2.6.22.19
because udev-266 is broken without libc6-2.13.  Installing udev-266
without libc6-2.13 will crash your machine at boot if your kernel uses
udev.  USB support is broken without it, so recovery can be tricky.

I would say your other machines need updating even if the process is
somewhat rocky as that's the only way a broadbased release can be tested.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
