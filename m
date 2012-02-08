From: dann frazier <dannf@dannf.org>
Subject: decommissioning parisc-linux.org
Date: Wed, 8 Feb 2012 07:33:47 -0700
Message-ID: <20120208143347.GB22903@dannf.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: taggart@lackof.org, bame@riverrock.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

As Paul noted[1], parisc-linux.org was running a vulnerable
apache which got the attention of HP's security audit team. I've been
doing most of the maintenance of the OS on this machine for a while,
but that has just meant apt-get upgrading when cron-apt told me to for
a few years. Turns out apache-ssl was obsolete (an etch version!), so
no amount of upgrading was going to fix that.

At this point I've removed apache-ssl. I tried installing apache2 to
see if any web pages would magically work - it didn't, so right now
the website is 404 farm :( I didn't spend much time trying to handle
that since.....

parisc-linux.org is running the last stable release of Debian that
supported hppa ('lenny'), and its life is now expired. As such, I
think we really need to migrate the site to another maintained
distribution and/or architecture. I'm willing to help migrate services
for the next month or so - let's just say 2012.03.14 for a good round
(heh) date - after which I plan to halt this system and let HP know
the hardware can be put to other uses. From what I can tell, we
originally installed this system almost exactly 9 years ago - ah,
rememember its predecessor dsl2? Good times. Anyway -

*************************************************************************
*** If you need any data off this machine, now's the time to grab it! ***
*************************************************************************

If you'd like to take over longterm hosting the website/domain, please
get in touch with taggart or I. If you'd like to continue using the
machine and/or HP's network to do the hosting, I can probably find a
contact for you there - though I wouldn't bet on it.

In the meantime, if anyone wants to get the website working on apache2
for the remainder of the system's lifetime, please let me know.

[1] http://www.spinics.net/lists/linux-parisc/msg03946.html
