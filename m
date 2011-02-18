From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: binutils change break glibc build
Date: Fri, 18 Feb 2011 13:40:31 -0500
Message-ID: <20110218184030.GA15510@hiauly1.hia.nrc.ca>
References: <20110210170033.4317E4ED8@hiauly1.hia.nrc.ca> <20110210200044.203164E01@hiauly1.hia.nrc.ca> <20110212161846.GA24076@hiauly1.hia.nrc.ca> <20110213193934.GA28834@hiauly1.hia.nrc.ca> <20110215015852.GA6615@hiauly1.hia.nrc.ca> <AANLkTimZntmJQ5msVr56=V7P8pYGXizpVGinZYrvBsSt@mail.gmail.com> <20110217003032.GA26155@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	James.Bottomley@hansenpartnership.com, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110217003032.GA26155@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 16 Feb 2011, John David Anglin wrote:

> I would like to apply the following binutils change to align data
> segments to a page boundary.  However, it breaks building glibc.
> Problem occurs in call_init trying to run constructors for new
> libc.so.6.

After investigation, I found that the change to emulparams/hppalinux.sh
was not the cause of the glibc breakage.  So, I have committed the change
to align data segments to a maxpagesize boundary (currently 0x1000).

This fixes one source of inequivalent aliases at the expense of
somewhat larger binaries.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
