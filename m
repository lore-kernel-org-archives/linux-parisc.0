Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from crisis.wild-wind.fr.eu.org (lopsy-lu.misterjones.org [62.4.18.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 95249482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 00:58:57 -0700 (MST)
To: Matthew Wilcox <willy@debian.org>
Cc: "Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, James.Bottomley@steeleye.com,
	linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
References: <200211090451.UAA26160@baldur.yggdrasil.com>
	<20021109052150.T12011@parcelfarce.linux.theplanet.co.uk>
Reply-To: mzyngier@freesurf.fr
From: Marc Zyngier <mzyngier@freesurf.fr>
Date: 09 Nov 2002 08:58:01 +0100
Message-ID: <wrp4rari392.fsf@hina.wild-wind.fr.eu.org>
In-Reply-To: <20021109052150.T12011@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>>>>> "Matthew" == Matthew Wilcox <willy@debian.org> writes:

Matthew> (i'm gagging to write an EISA subsystem ;-).

Humm, please don't... :-)

maz@midlife-crisis:~$ ls -R /sys/bus/eisa/ 
/sys/bus/eisa/:
devices  drivers

/sys/bus/eisa/devices:
00:00  00:01  00:02

/sys/bus/eisa/drivers:
3c509

/sys/bus/eisa/drivers/3c509:
00:02
maz@midlife-crisis:~$ 

I have it working on x86 and Alpha, will test parisc and mips over the
week-end.

        M.
-- 
Places change, faces change. Life is so very strange.
