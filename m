Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF07E4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Apr 2003 09:42:35 -0600 (MDT)
Date: Mon, 14 Apr 2003 17:42:32 +0200
Message-ID: <3E8AE87E00006EB8@ocpmta2.freegates.net>
In-Reply-To: <3E8AE87E00006D87@ocpmta2.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] parisc-linux.org kernel
To: "Alan Cox" <alan@lxorguk.ukuu.org.uk>
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

>>>  	     (dev->class & 0x80))) {
>>> -		unsigned long dma_base = ide_get_or_set_dma_base(hwif);
>>> +		u32 dma_base = ide_get_or_set_dma_base(hwif);
>>
>>Thats reverting a fix. dma_base must be unsigned long for 64bit
>>platforms. Looks just like a merge error.
>
hmm I just re-compile with "unsigned long dma_base" and it works (I mount
a cd on the ide cdrom drive and launch a find of file without any system
crash :) )

Thanks again,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
