Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57209482A
	for <parisc-linux@parisc-linux.org>; Fri, 14 Feb 2003 09:48:38 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18jj0u-0001QH-00
	for <parisc-linux@parisc-linux.org>; Fri, 14 Feb 2003 17:48:36 +0100
Date: Fri, 14 Feb 2003 17:48:35 +0100
Message-ID: <3E48441000001767@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] J3592A hp product
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

I have a PCI SerialMux (8ports) which I put back in my b180.

a cat /proc/pci
learn me that it seems to be an 'Equinox System' card:
root@fw01:~# cat /proc/pci
PCI devices found:
  Bus  0, device   1, function  0:
    Serial controller: PCI device 113f:90f0 (Equinox Systems, Inc.) (rev
4).
      IRQ 96.
      Non-prefetchable 32 bit memory at 0xf0ff0000 [0xf0ffffff].

Is it possibly true?

On Equinox site it seems that drivers is included into Linux kernel.
I have only found reference to this driver into drivers/pci/devices.h.

Is somebody could advise me on howto insert this driver into kernel?

Thanks in advance,
    Joel
 

---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
