Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43D5A4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Apr 2003 02:18:33 -0600 (MDT)
Date: Fri, 18 Apr 2003 10:17:55 +0200
Message-ID: <3E9BF11E00000FFB@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] parisc-linux.org kernel
To: "Matthew Wilcox" <willy@debian.org>
Cc: "Grant Grundler" <grundler@parisc-linux.org>,
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

Willy and all,

>
>On Wed, Apr 16, 2003 at 06:44:11PM +0200, Joel Soete wrote:
>> Well I already create:
>> a chunck containing debian-configs (I call it 00_parisc_debian-configs.patch)
>> [about 140k] (would it be submited?)
>
>No, I don't think this should be submitted.  No other architecture does
this.
>
>> another chunk containing all parisc specific (named 01_parisc.patch)
containing
>> arch/parisc, include/asm-parisc and another noticed "parisc specific"
[about
>> 160k]
>
>sounds good.  be sure this applies to alan's/marcelo's tree as they've
>taken updates since 2.4.20 was released.
>
I already submitted a first draft to Randolph (as foreseen about 160Kb without
new's Grant ql driver) so that he could check it when he find some time.

In the meantime, I rebuild this with gcc-3.2 64bits which seems to run fine
on my b2k (ide cdrom, nfs, gcc,... seems ok). Just with this compiler I met
a pb to build the new module driver 3wxxx. So I will first re-install gcc-3.0
before all.

Thanks,
    Joel




---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
