Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 39910482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 22:58:51 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16QMcS-0003F6-00; Tue, 15 Jan 2002 05:58:48 +0000
Date: Tue, 15 Jan 2002 05:58:48 +0000
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems with lasi_82596.c [CONFIG_IOMMU_CCIO]
Message-ID: <20020115055848.F19929@parcelfarce.linux.theplanet.co.uk>
References: <20020115005115.B4645@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020115005115.B4645@systemhalted>; from carlos@baldric.uwo.ca on Tue, Jan 15, 2002 at 12:51:15AM -0500
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

On Tue, Jan 15, 2002 at 12:51:15AM -0500, Carlos O'Donell Jr. wrote:
>     255 #else /* !CONFIG_IOMMU_CCIO */
>     256 #define ccio_get_iommu(dev) do { } while (0)
> --> 257 #define ccio_get_fake(dev) do { } while (0)
> -> 1521         fake_pci_dev = ccio_get_fake(dev);

My fault, fixing now.

-- 
Revolutions do not require corporate support.
