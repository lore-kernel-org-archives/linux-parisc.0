Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D2FC484C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Apr 2003 01:49:35 -0700 (MST)
Date: Wed, 2 Apr 2003 10:49:33 +0200
Message-ID: <3E842746000029B7@ocpmta2.freegates.net>
In-Reply-To: <20030331100601.17585.qmail@sources.redhat.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: gcc-gnats@gcc.gnu.org, nobody@gcc.gnu.org, joel.soete@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] Re: c++/10274: internal compiler error:
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

>>Category:       c++
>>Responsible:    unassigned
>>Synopsis:       internal compiler error:
>>Arrival-Date:   Mon Mar 31 10:06:01 UTC 2003

Just a small update:

The new precompiled g++ is now 3.3 20030331 and the error message become:
...
/tmp/ccJws8Pa.s: Assembler messages:
/tmp/ccJws8Pa.s:151786: Error: Field out of range [-262144..262143] (-290552).

Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
