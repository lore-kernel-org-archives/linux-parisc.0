Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 572334840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Nov 2003 11:52:56 -0700 (MST)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.12.10/8.12.10) with ESMTP id hAKIqpIX023898
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Nov 2003 18:52:51 GMT
Date: Thu, 20 Nov 2003 18:52:50 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.58.0311201817470.21743@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C3000 and 2.6
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

Hi,

before I'm wasting my time compiling the kernel, is the
serial console now working with 2.6?

There used to be problems with the SCSI driver aswell (would complain
that termination problem was present, but AFAIK this was already fixed)?


Right now I'm using a 120GB IDE using the onboard IDE of the C3k, and
I get just about 3MB/s with 2.4.22-paX, which might indicate that DMA is
not supported (I turned DMA/32bit on with hdparm, but no effects). I also
doubt that the driver for the onboard IDE chipset is much better in the
2.6 kernel, so I opted to install a IDE PCI card.

Unfortunately the only new PCI IDE cards you can get in the shops these
days that are ones with the Promise or the SiliconImage chipset;
suppor for the Promise chipset under linux used to be crap, and
SiliconImage is only suppoted with 2.6, but at least it works, so I went
for the latter. Therefore I'm eager to get 2.6 running!


Thanks,
  Max


PS: Building network scheduling (QoS) as modules results in unresolved
    symbols (using 2.4.22-pa13). Building then in the kernel (2.4.22-pa17)
    works.
