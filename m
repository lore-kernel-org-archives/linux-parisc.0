From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Disable CONFIG_SYSFS_DEPRECATED_V2?
Date: Tue, 08 Sep 2009 22:12:07 -0500
Message-ID: <1252465927.13003.363.camel@mulgrave.site>
References: <119aab440909082000i4524a594qed512f7567afd30b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440909082000i4524a594qed512f7567afd30b@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2009-09-08 at 23:00 -0400, Carlos O'Donell wrote:
> Does anyone know if it's safe to disable CONFIG_SYSFS_DEPRECATED_V2
> for kernels running on debian?
> 
> Do the debian tools support the new sysfs layout?

Seems so ... I've got it unset on my debian testing systems.

James


