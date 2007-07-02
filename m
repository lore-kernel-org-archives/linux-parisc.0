From: =?ISO-8859-1?Q?S=E9bastien_Bernard?= <seb@frankengul.org>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Mon, 02 Jul 2007 22:14:23 +0200
Message-ID: <46895C9F.7020000__40659.0921259069$1416624405$gmane$org@frankengul.org>
References: <20070613082133.GA19999@frankengul.org>	<200706131332.l5DDWObn025750@hiauly1.hia.nrc.ca>	<20070613142304.GA21970@frankengul.org>	<46705613.8020708@frankengul.org> <18056.11841.395484.508171@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org,
 aurelien@aurel32.net,
 debian-hppa@lists.debian.org
To: Matthias Klose <doko@cs.tu-berlin.de>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <18056.11841.395484.508171@gargle.gargle.HOWL>
Resent-Message-ID: <gyN_hD.A.nbE._yViGB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Matthias Klose a écrit :
> The proposed fix seems to be wrong, as it disables the backport on all
> architectures.  Please could you recheck with current trunk? As jda
> suggested, another backport is missing for hppa.
> 
>   Matthias
> 

Oh well, I didn't say I got it all right.

I just said the problem was there.
I submited the bug to the gcc bugtracker and to the debian gcc, but I
didn't submit this patch as a potential fix.
There was no reaction on either site.

If you watch carefuly, this patch is not applied against some archs :
-ifneq (,$(filter $(DEB_TARGET_ARCH), amd64 i386 powerpc ppc64 sparc s390))
-  debian_patches += pr20218
-endif
