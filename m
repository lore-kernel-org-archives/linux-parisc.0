Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B2A424829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 07:59:44 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18AX5I-0000nW-00; Sat, 09 Nov 2002 14:59:40 +0000
Date: Sat, 9 Nov 2002 14:59:39 +0000
From: Matthew Wilcox <willy@debian.org>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel build: make palo
Message-ID: <20021109145939.U12011@parcelfarce.linux.theplanet.co.uk>
References: <Pine.BSF.4.44.0211091415060.32930-100000@e0-0.zab2.int.zabbadoz.net> <Pine.BSF.4.44.0211091447120.32930-100000@e0-0.zab2.int.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.44.0211091447120.32930-100000@e0-0.zab2.int.zabbadoz.net>; from bzeeb-lists@lists.zabbadoz.net on Sat, Nov 09, 2002 at 02:49:27PM +0000
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

On Sat, Nov 09, 2002 at 02:49:27PM +0000, Bjoern A. Zeeb wrote:
> --- ... ---
> palo -f ./palo.conf
> /dev/sda: Permission denied
> palo version 1.1 bame@c3k Tue Aug  6 09:40:01 MDT 2002
> ELF32 executable
> make: *** [palo] Error 2
> --- ... ---
> 
> this would be the correct error message but it's the same target
> and problem anyway...
> 
> > Suggestion: can we factor this out to be an own target like
> > modules_install, etc ?
> >
> > Then one could do
> > 	make dep && make bzImage && make modules
> > as user, the switch to su and do a
> > 	make modules_install && make palo
> > or even run palo by hand...

Nothing stops you from doing:

make vmlinux
sudo make palo

as two separate steps.

-- 
Revolutions do not require corporate support.
