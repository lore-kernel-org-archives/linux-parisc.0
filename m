Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7D719482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Mar 2003 04:05:23 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18usQk-0001GL-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Mar 2003 12:05:22 +0100
Date: Mon, 17 Mar 2003 12:05:20 +0100
Message-ID: <3E68A12A00002910@ocpmta3.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] FC driver?
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

Hi all,

On the N4000 which I can test for a short time there are fc cards.
lspci give me following info about those cards:

20:00.0 Fibre Channel: Hewlett-Packard Company Tach TL Fibre Channel Host
Adapter (rev 0b)
d0:00.0 Fibre Channel: Hewlett-Packard Company Tach TL Fibre Channel Host
Adapter (rev 0b)
e0:00.0 Fibre Channel: Hewlett-Packard Company Tach TL Fibre Channel Host
Adapter (rev 0b)

The question is: which driver should I use (cpqfc?)?

Thanks for info,
        Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
