Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9298C482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Aug 2002 09:38:21 -0600 (MDT)
Date: Wed, 7 Aug 2002 11:36:47 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Alex Green <alexdgreen@hotmail.com>
Cc: Paul Bame <bame@fc.hp.com>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo issues
Message-ID: <20020807153647.GD12856@systemhalted>
References: <OE22Aztxc1o8yfogkJX00009958@hotmail.com> <20020807123807.GB9966@systemhalted> <OE50nwpGR881Np7vXee0000cb29@hotmail.com> <E17cSWK-0000pp-00@paul.bame> <OE21vQSK3sFilY05Dxp0000b0ff@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OE21vQSK3sFilY05Dxp0000b0ff@hotmail.com>
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

On Wed, Aug 07, 2002 at 05:28:20PM +0200, Alex Green wrote:
> I ran file against my new kernel and the output is the same as the currently
> booting kernel.
> 
> 

I was decidedly wrong. While 'make bzImage' will produce the
right vmlinux for you to use... you cannot use the actual bzImage
because we don't support compressed kernel images in palo.

Using the vmlinux in /usr/src/linux (or where your tree is) will
get you to the right place :)

c.
