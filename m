Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dsinn.com (dsinn.dsinn.com [204.182.90.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F1BC482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Jul 2003 11:08:18 -0600 (MDT)
From: "F. David Sinn" <dsinn@dsinn.com>
To: "'Joel Soete'" <jsoe0708@tiscali.be>, "'Dub'" <dub@latnet.lv>,
	<parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Where to get precompiled SMP kernel for 2.4.20?
Date: Thu, 3 Jul 2003 10:10:05 -0700
Message-ID: <000001c34185$f46f5a60$1f826b83@junior>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <3ED70CF10000D300@ocpmta2.freegates.net>
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

FYI - Works great for SMP on a K260 I have, though it doesn't look to have
the proper console patch included (otherwise known as:  Make sure your
system is setup right before you install the new kernel).  Everything else
looks to work as before.

David

-----Original Message-----
From: parisc-linux-admin@lists.parisc-linux.org
[mailto:parisc-linux-admin@lists.parisc-linux.org]On Behalf Of Joel
Soete
Sent: Wednesday, July 02, 2003 9:32 AM
To: Dub; parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Where to get precompiled SMP kernel for
2.4.20?


Hi,

> I have installed Debian from netinst CD found at
>
http://pateam.esiee.fr/cd-images/testing/palinux-2.4.20-pa35-20030513-netins
t.iso
>
> Q. Is it possible to get pre-compiled SMP kernel for this version 2.4.20.


At least 2.4.20-pa32 at:
<http://ftp.debian.org/debian/pool/main/k/kernel-patch-2.4.20-hppa/>

hth,
    Joel


---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
