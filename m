Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server01 (server01.steindlberger.de [217.115.138.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id EFEA7485C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Dec 2002 15:18:07 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-15"
From: Joerg Steindlberger <j@steindlberger.de>
To: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: Re: [parisc-linux] still problems with PCI IDE controller
Date: Wed, 18 Dec 2002 23:18:14 +0100
Cc: parisc-linux@lists.parisc-linux.org
References: <200212160609.XAA18500@udlkern.fc.hp.com> <courier.3E00E3ED.000010DA@server01> <20021218212455.GG17944@dsl2.external.hp.com>
In-Reply-To: <20021218212455.GG17944@dsl2.external.hp.com>
MIME-Version: 1.0
Message-ID: <courier.3E00F419.0000601B@server01>
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

Hi Grant

On Wednesday 18 December 2002 22:24, Grant Grundler wrote:
> IDE in PIO Mode (ie not using DMA) does not play well with the
> rest of the system.
Okay. I now set hdparm -c 1 /dev/... and hdparm -d 1 /dev/... -- before=20
starting the softwareRAID. The RAID1 is syncing this moment with about 2=20
Mbyte/s. I think I'll stop it now and mount the shorter 80pin cable again=
 and=20
play with some speed settings. My earlier problem with DMA was, that the=20
kernal crashed when setting the CONFIG_IDEDMA_AUTO=3Dy.
> Nope. IDE is EEEeevil ;^)
Yes, I know. But what would You pay for two 80 GB disks?

Regards
Joerg
