Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3ABCA482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 16:24:19 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 165xlw-0001Wl-00; Mon, 19 Nov 2001 23:24:16 +0000
Date: Mon, 19 Nov 2001 23:24:16 +0000
From: Matthew Wilcox <willy@debian.org>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: Thomas Marteau <marteaut@esiee.fr>,
	grundler@puffin.external.hp.com, ryan_bradetich@uswest.net,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: E55 status - ADDENDUM TO DRIVER
Message-ID: <20011119232416.A652@parcelfarce.linux.theplanet.co.uk>
References: <3B4396D8.9A33414F@gmx.at> <3BF4E38C.D59603FE@esiee.fr> <3BF98AD5.9BCB6861@gmx.at> <3BF98FEE.CC8F4EB3@gmx.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3BF98FEE.CC8F4EB3@gmx.at>; from christoph.plattner@gmx.at on Tue, Nov 20, 2001 at 12:04:14AM +0100
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

On Tue, Nov 20, 2001 at 12:04:14AM +0100, Christoph Plattner wrote:
> The PDC tty driver should never be used as module, this would not make
> any sense. So the `init_module' routines at the end should be deleted.

init_module indicates the entry point of a module.  it is NOT only for
dynamically loadable modules.  if the module is built in to the kernel,
it is called during the __initcall section of bootup.

-- 
Revolutions do not require corporate support.
