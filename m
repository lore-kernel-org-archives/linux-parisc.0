Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64046482C
	for <parisc-linux@parisc-linux.org>; Tue, 23 Jul 2002 08:04:22 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17X0Gz-0003W8-00; Tue, 23 Jul 2002 15:04:21 +0100
Date: Tue, 23 Jul 2002 15:04:21 +0100
From: Matthew Wilcox <willy@debian.org>
To: kenneth westelinck <kennywest1@hotmail.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] unresoved symbols when doing a make modules_install
Message-ID: <20020723150421.G3052@parcelfarce.linux.theplanet.co.uk>
References: <OE32H8BX2vRxFmNHYus00008028@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OE32H8BX2vRxFmNHYus00008028@hotmail.com>; from kennywest1@hotmail.com on Tue, Jul 23, 2002 at 03:51:57PM +0200
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

On Tue, Jul 23, 2002 at 03:51:57PM +0200, kenneth westelinck wrote:
> Today I "baked" myself a new kernel (2.4.18-pa56). After upgrading my box
> (using apt-get), INIT was dying upon startup with an "unaligned access"
> error. Anyway, all is working well (even the soft-power button), but I am
> getting an "unresolved symbols"-error when doing a "make modules_install"
> (see attached file). Yes, I copied the System.map to
> /boot/System.map-2.4.18-pa56 and created a symbolic link to this file. Any
> ideas?

i'm baffled.  we prototype, define and EXPORT_SYMBOL outs[bwl].  i can't
see why you'd get this error.

-- 
Revolutions do not require corporate support.
