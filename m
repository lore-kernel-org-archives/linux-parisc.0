Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 938E84877
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 Apr 2003 00:34:15 -0600 (MDT)
Date: Wed, 30 Apr 2003 08:34:12 +0200
Message-ID: <3EA9466400001A38@ocpmta7.freegates.net>
In-Reply-To: <OF67C87243.4AA56CF6-ONC1256D17.0044AF0F@diamond.philips.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] cannot install (shellutils)
To: joachim.weller@philips.com,
	=?ISO-8859-1?Q?J=F6rg=20Benndorf?= <joerg.benndorf@t-online.de>
Cc: parisc-linux@lists.parisc-linux.org
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

Hi Joachim,


>If the downloaded image shows correct md5sum, I would recommend checking
>
>your
>burned CDROM for equal md5sum:
>dd if=/dev/cdrom bs=8192|md5sum
>
Absolutly right, for my own I used :
readcd dev=1,4,0 f=- | md5sum

(replacing dev= by the relevant hw/path of your own cdrom)

Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
