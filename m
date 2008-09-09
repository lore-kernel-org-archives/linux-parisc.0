From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Debian parisc config for 2.6.26 broke the real time clock
Date: Tue, 9 Sep 2008 15:20:09 -0400 (EDT)
Message-ID: <20080909192010.0207A4E2A@hiauly1.hia.nrc.ca>
References: <20080909184648.GC2772@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, waldi@debian.org,
	dannf@dannf.org, debian-kernel@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: matthew@wil.cx (Matthew Wilcox)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080909184648.GC2772@parisc-linux.org> from "Matthew Wilcox" at Sep 9, 2008 12:46:48 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> This I2C bus is not acessible by the operating system (as far as I know).

HP-UX seems to be able to access fan and power status somehow.  It
sends me an email when it thinks the i2c is hung, and once a day,
it sends a message that a fan which the chassis doesn't have (as far
as I can tell) has failed.  Of course, the A500-75 model doesn't
actually exist...  The model that actually shipped was a A500-7X.
As a result, I've never been able to update the firmware.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
