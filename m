Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id C18BE4874
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 Apr 2003 00:27:16 -0600 (MDT)
Date: Wed, 30 Apr 2003 08:27:14 +0200
Message-ID: <3EA9466400001A2A@ocpmta7.freegates.net>
In-Reply-To: <3EA841FA00001805@ocpmta1.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] cannot install (shellutils)
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: "J?rg Benndorf" <joerg.benndorf@t-online.de>,
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

Umm some mail pb?

>-- Original Message --
>Date: Tue, 29 Apr 2003 08:27:15 +0200
>From: "Joel Soete" <jsoe0708@tiscali.be>
>Subject: Re: [parisc-linux] cannot install (shellutils)
>To: "Grant Grundler" <grundler@parisc-linux.org>
>Cc: "J?rg Benndorf" <joerg.benndorf@t-online.de>,
> parisc-linux@lists.parisc-linux.org
>
>
>
>>
>>On Mon, Apr 28, 2003 at 02:40:40PM +0200, Joel Soete wrote:
>>> >I got the install cd by downloading the iso image using jigdo.
>>
>>...
>>> First of all, check the md5sum checksum of the image you download (very
>>> usefull for big files).
>>
>>I think jigdo already did.  IIRC jigdo verifies the final ISO image.
>
>I just know jigdo by name but do not have infrastructure to test (not enough
>disk space, fw allowing just a minimum of protocol)
>
>Hmm you also rightly point out that only speek about to check the image
and
>forgot to mentioned to check also the burned cd (just a priceless care :)
>)
>
>>
>>> If it is ok tell us more about tools you used to burn this image
>>> (I use cdrtools on *nix system)
>>
>>The ISO seems to boot - therefore I'll guess it's something else.
>
>Also but as we encounter many times this kind of pb because of cd wrongly
>burned I would just check step by step :)
> 
Joachim used dd but it could also used a tools coming with cdrtools:
readcd dev=1,4,0 f=- | md5sum

(for dev replaced your own cd hw/path)

>Joel
>


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
