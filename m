Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (unknown [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 40DCE482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Apr 2003 06:40:42 -0600 (MDT)
Date: Mon, 28 Apr 2003 14:40:40 +0200
Message-ID: <3EA9466400000C36@ocpmta7.freegates.net>
In-Reply-To: <002501c30ccf$478f8ee0$fe78a8c0@JOERGSPRINTER>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] cannot install (shellutils)
To: =?ISO-8859-1?Q?J=F6rg=20Benndorf?= <joerg.benndorf@t-online.de>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Joerg,
>
>
>When installing debian on a hp-9000 712/80 the below warning shows up:
>
>"file:/instmnt/pool/main/s/shellutils/shellutils_2.0.11-11_hppa.deb was
corrupt"
><continue>
>"Couldn't download shellutils" <continue>
>"The previous attempt to install the base system failed. Please select "Next"
>to retry installation of the base system."
>
>I got the install cd by downloading the iso image using jigdo.
>I have tried version 3.0r0, 3.0r1 and 3.0r1NON-US but none of them works

Umm as I install successfuly 3.0r0 (and iirc in the list somebody else reach
to intall 3.0r1), I do suspect that the pb should be somewhere in the way
you proceded to burn your cdrom.

First of all, check the md5sum checksum of the image you download (very usefull
for big files).

If it is ok tell us more about tools you used to burn this image (I use cdrtools
on *nix system)

hth,
    Joel

---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
