Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6E1044830
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 May 2003 10:35:52 -0600 (MDT)
Date: Wed, 7 May 2003 18:35:18 +0200
Message-ID: <3EB772D800000CBA@ocpmta2.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: "Thibaut VARENE" <varenet@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] isobuild.sh read access?
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

Hi Thibaut,

As I mentioned in other mail, my b2k crashed during an apt-get upgrade (due
to an hw pb). This corrupted its root fs.

I would like so to re-install it and the only way I know for a b2k (because
of this ide cdrom) is to use a lifimage. I try severall of your lifimages
but all hang during "search devices" (iirc the kernel config is not adapted
for this b2k :( ).

I would so try to find help in your script isobuild.sh to rebuild my lifimage
with my kernel which I know operational on this model. Unfortunately each
time I try to read it i got following error message:
Forbidden
You don't have permission to access /archive/scripts/isobuild.sh on this
server.

Thanks in advance for help,
    Joel

PS: Would it not be put also into build-tools cvs tree?

---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
