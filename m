Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0DF07482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 May 2003 05:55:04 -0600 (MDT)
Date: Wed, 14 May 2003 13:47:19 +0200
Message-ID: <3EC0FF2300000638@ocpmta7.freegates.net>
In-Reply-To: <3EB8AF58.7040900@admin.france.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: "Bruno Vidal" <bruno_vidal@hpfrcu03.france.hp.com>,
	"Grant Grundler" <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] RE: Dump module patche.
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

Hi Bruno,

>
>Attachment: dump_modules-2.4.20-pa32.patch2
>
I apply it against last 2.4.20-pa35 (do not have any more pa22 :( ) (just
2 hunk to remove). Unfortunately it failed to compile with following message:
`gcc-3.0 -print-libgcc-file-name` /usr/src/LKCD/hppa/linux-2.4.20-pa35-lkcd/arch/parisc/lib/lib.a
/usr/src/LKCD/hppa/linux-2.4.20-pa35-lkcd/lib/lib.a  \
	--end-group \
	-o vmlinux
fs/fs.o(.debug_info+0x6fbaf): undefined reference to `.L1225'
make: *** [vmlinux] Error 1

(Sorry I already met this kind of pb but do not remember how to solve :()

Thanks for your undertand,
    Joel

PS: No more support of compression (I tried libz2 but it do not found some
object at ld time)?

---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
