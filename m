Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from crisis.wild-wind.fr.eu.org (lopsy-lu.misterjones.org [62.4.18.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 437D14829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Nov 2002 05:40:32 -0700 (MST)
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Greg KH <greg@kroah.com>, Miles Bader <miles@gnu.org>,
	"J.E.J. Bottomley" <James.Bottomley@steeleye.com>,
	Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
References: <20021109060342.GA7798@kroah.com>
	<200211091533.gA9FXuW02017@localhost.localdomain>
	<20021113061310.GD2106@kroah.com>
	<buon0odsyh9.fsf@mcspd15.ucom.lsi.nec.co.jp>
	<20021113075223.GZ2106@kroah.com>
	<20021113145902.A1245@jurassic.park.msu.ru>
Reply-To: mzyngier@freesurf.fr
From: Marc Zyngier <mzyngier@freesurf.fr>
Date: 13 Nov 2002 13:36:14 +0100
Message-ID: <wrpvg31pry9.fsf@hina.wild-wind.fr.eu.org>
In-Reply-To: <20021113145902.A1245@jurassic.park.msu.ru>
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

>>>>> "Ivan" == Ivan Kokshaysky <ink@jurassic.park.msu.ru> writes:

Ivan> It seems that two things are fundamentally missing in generic
Ivan> device model:
Ivan> 1. clean way to detect the type of container structure from arbitrary
Ivan>    struct device *;

Indeed.

I'm using the following stuff in some EISA drivers :

#ifdef CONFIG_EISA
#define DEVICE_EISA(dev) (((dev)->bus == &eisa_bus_type) ? to_eisa_device((dev)) : NULL)
#else
#define DEVICE_EISA(dev) NULL
#endif

and frankly, it's really awful. On drivers which are both EISA and
PCI (3c59x, aic7xxx), this is a major pain.

        M.
-- 
Places change, faces change. Life is so very strange.
