From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Debian bug 622997
Date: Sun, 17 Apr 2011 13:06:36 -0400
Message-ID: <20110417170635.GA23117@hiauly1.hia.nrc.ca>
References: <20110417151147.326EC4FCB@hiauly1.hia.nrc.ca> <1303053807.2583.1.camel@mulgrave.site>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	622997@bugs.debian.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1303053807.2583.1.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 17 Apr 2011, James Bottomley wrote:

> > Comparing the console output that I recorded for the debian kernel, I
> > see udev starts much earlier.  It only has the initial message from the
> > tg3 driver and SCSI subsystem.
> 
> It's most likely a driver module that's getting loaded which is turned
> off in the booting configuration ... finding it isn't going to be easy,
> though ...

Yup.  I have reenabled IPV6 and USB and my system still boots.  There
are some nfs problems with IPV6 but that's probably a config issue.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
