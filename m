Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 09B4A482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Mar 2003 06:58:54 -0700 (MST)
Date: Mon, 17 Mar 2003 14:58:52 +0100
Message-ID: <3E68A12A00002A77@ocpmta3.freegates.net>
In-Reply-To: <20030317111801.GF17073@lug-owl.de>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] FC driver?
To: "Jan-Benedict Glaw" <jbglaw@lug-owl.de>,
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

>-- Original Message --
>From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
>To: parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] FC driver?
>Date: Mon, 17 Mar 2003 12:18:01 +0100
>
>
>On Mon, 2003-03-17 12:05:20 +0100, Joel Soete <jsoe0708@tiscali.be>
>wrote in message <3E68A12A00002910@ocpmta3.freegates.net>:
>> Hi all,
>> 
>> On the N4000 which I can test for a short time there are fc cards.
>> lspci give me following info about those cards:
>> 
>> 20:00.0 Fibre Channel: Hewlett-Packard Company Tach TL Fibre Channel Host
>Adapter (rev 0b)
>> d0:00.0 Fibre Channel: Hewlett-Packard Company Tach TL Fibre Channel Host
>Adapter (rev 0b)
>> e0:00.0 Fibre Channel: Hewlett-Packard Company Tach TL Fibre Channel Host
>Adapter (rev 0b)
>
>[line break-ups corrected]
>
>> The question is: which driver should I use (cpqfc?)?
>
>I do not have such a card, but:
>
>/usr/share/misc/pci.ids:
>103c  Hewlett-Packard Company
>	1028  Tach TL Fibre Channel Host Adapter
>
>So it seems your device is 103c:1028. In the kernel, this maps through
>./linux/include/linux/pci_ids.h:
>
>#define PCI_DEVICE_ID_HP_TACHYON      0x1028
>
>So your device is called "PCI_DEVICE_ID_HP_TACHYON". Searching for this
>string, you'll find it in ./linux/drivers/scsi/cpqfcTSinit.c, so that
>card seems to be supported.
>
>See, it's quite easy to see if a PCI card seems to be supported:-)
>
>MfG, JBG
>
cool :)

Thanks a lot for those kind explanations,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
