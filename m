Return-Path: <SRS0=J64p=ZM=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72894C432C3
	for <linux-parisc@archiver.kernel.org>; Wed, 20 Nov 2019 23:43:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC53D20895
	for <linux-parisc@archiver.kernel.org>; Wed, 20 Nov 2019 23:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="RwtSiff8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfKTXn2 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 20 Nov 2019 18:43:28 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:51531 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbfKTXn2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 20 Nov 2019 18:43:28 -0500
X-Greylist: delayed 501 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 Nov 2019 18:43:25 EST
Date:   Wed, 20 Nov 2019 23:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=proton;
        t=1574292901; bh=GnbCZbPo6M3XF8mf9mhIDiPd2Xm5dbcVWSqe0bCOeNc=;
        h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
        b=RwtSiff8pjsOSV4r2H4rVcfp2nT2SPhAAih+oZ1f5pa0Vxf+0eg6Jy+rQxvcrCGgJ
         GfUeamWcf7SIqE4z0tAXOXskwTzGV5su5baxnT8vo8jaBUYRjnRWad77NW5rgLGIxN
         fO4sk+KOdEM/hv1rPCIhXfKo4AheHVQpVjDcyHLGHQEYXx2xxtvU06K7kEjyPUiGWr
         iyB9k7eRAWioGiCJs9HSob1mQGIRezwJ+F189MGyRHiQT4gIG9bS/vkjX0KD17QIyR
         DzKjWO7QDwAV+JylskvXEL5jA3vkm7O17m77DEqKzAzlzmgEoOl474NPDkAd/ppkCn
         t+zIG4yGO1Sow==
To:     linux-parisc@vger.kernel.org
From:   Phil Scarr <phil.scarr@pm.me>
Reply-To: Phil Scarr <phil.scarr@pm.me>
Subject: Boot error with 11-17-2019 iso
Message-ID: <AD5A916B-7C34-420A-B251-ED6E9D9B62F6@pm.me>
Feedback-ID: AnDrjaQTA1mIrVwhEbJn-LrXpVWgkp5-ycaTfIL-MTxGUAlZPyisXimQB5plDXm-ITvR42cG8qwUhD6jMQpd3Q==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Trying to install the latest iso (11/17) for testing and it appears that th=
e kernel included with the iso and the kernel modules on the iso are mismat=
ched.

   =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=A4 [!!] Load installer components from installation media =E2=94=9C=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
   =E2=94=82                                                               =
        =E2=94=82
   =E2=94=82 No kernel modules were found. This probably is due to a mismat=
ch      =E2=94=82
   =E2=94=82 between the kernel used by this version of the installer and t=
he      =E2=94=82
   =E2=94=82 kernel version available in the archive.                      =
        =E2=94=82
   =E2=94=82                                                               =
        =E2=94=82
   =E2=94=82 If you're installing from a mirror, you can work around this p=
roblem  =E2=94=82
   =E2=94=82 by choosing to install a different version of Debian. The inst=
all     =E2=94=82
   =E2=94=82 will probably fail to work if you continue without kernel modu=
les.    =E2=94=82
   =E2=94=82                                                               =
        =E2=94=82
   =E2=94=82 Continue the install without loading kernel modules?          =
        =E2=94=82
   =E2=94=82                                                               =
        =E2=94=82
   =E2=94=82     <Go Back>                                       <Yes>    <=
No>     =E2=94=82
   =E2=94=82                                                               =
        =E2=94=82
   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=98

The log shows:
Nov 20 23:12:50 main-menu[279]: INFO: Menu item 'load-cdrom' succeeded but =
requested to be left unconfigured.                                         =
         =20
Nov 20 23:12:50 main-menu[279]: INFO: Falling back to the package descripti=
on for brltty-udeb                                                         =
         =20
Nov 20 23:12:55 main-menu[279]: INFO: Falling back to the package descripti=
on for brltty-udeb                                                         =
         =20
Nov 20 23:12:55 main-menu[279]: INFO: Menu item 'load-cdrom' selected      =
    =20
Nov 20 23:12:55 cdrom-retriever: warning: File /cdrom/dists/sid/main/debian=
-installer/binary-hppa/Packages does not exist.                            =
        =20
Nov 20 23:12:55 anna[1218]: WARNING **: no packages matching running kernel=
 5.3.0-2-parisc64 in archive                                               =
         =20

The install fails at the disk partitioning when it=E2=80=99s unable to find=
 the MD module.

=09-Phil


