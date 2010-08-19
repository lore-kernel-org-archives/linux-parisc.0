From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [alerts@alerts.hp.com: HP SUPPORT ALERT: Change to Patch
	services effective September 18, 2010 ? Action required]
Date: Thu, 19 Aug 2010 14:06:13 -0400
Message-ID: <20100819180612.GA13795@hiauly1.hia.nrc.ca>
References: <20100819013346.GA9194@hiauly1.hia.nrc.ca> <AANLkTinXgNz7cjNV1oiw+Niy78pMyeCYtaxvqNM-fM0R@mail.gmail.com> <20100819170030.GA13537@hiauly1.hia.nrc.ca> <AANLkTikEn-E4bUD4bgbNLNtQYfdN9kuwQ+pCmff5hEtc@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTikEn-E4bUD4bgbNLNtQYfdN9kuwQ+pCmff5hEtc@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 19 Aug 2010, Carlos O'Donell wrote:

> I see your point, and I understand that HP-UX support has helped the
> Linux support.

Definitely.  The change will make it more difficult for open source
developers to support HP-UX.  That's my underlying reason for the post.

Within the GCC community, HP-UX support is viewed as more important
than Linux.  Adacore supports a few mission critical applications
on HP-UX (ATC, I believe).  Recently, patch levels came up regarding
one of my bug fixes (libc changes).

> If all you need is an FTP server, can't you talk to your HP contacts
> and set something up to start holding patches?

I believe that there are copyright issues.  Sadly, my contacts at HP
are now reduced to one.  So, I'm not very hopeful.

At some point, it won't be worthwhile continuing to support parisc
and ia64 within GCC and binutils.  I would judge it takes 500 to a
1000 hours a year to support GCC.  Recently, two GCC bugs appeared
which involved mis-compilation of the compiler.  These are very hard
to track down.  One is still not fixed although the cause of the
bug is known (fwprop).  It breaks hppa64 builds.  I think it could
affect 32-bit as well, and it is likely present in older versions.

Regarding rp3440 firmware, I noticed recently that the pdc firmware
wasn't testing memory correctly and it was disabling DIMMs.  This would
cause restart failures.  So, I updated the firmware to the latest version.
The system seems stable again running a UP kernel.  Haven't had a chance
to test SMP yet.  I suspect that the firmware may have been responsible
for some cache corruption.

On a positive front, squeeze with kde seem to be largely working on my
c3750.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
