Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3138E4829
	for <parisc-linux@parisc-linux.org>; Tue, 15 Oct 2002 14:16:31 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 181Y79-0004br-00
	for parisc-linux@parisc-linux.org; Tue, 15 Oct 2002 21:16:27 +0100
Date: Tue, 15 Oct 2002 21:16:27 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20021015211627.A15163@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 2.5 status
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

In an attempt to get more people involved in the 2.5 porting effort, I'm
going to try to send out weekly updates of what's going on.  Feel free to
respond to things and point out where I'm wrong.

Status:

 - Merged to 2.5.41
 - Booted on an A500
 - Linus released 2.5.42
 - Don't know what patches need to be integrated into Linus' tree
 - Don't know what other patches need to be brought forward from 2.4

Todo:

 - Serial code not working for a 712 (willy)
 - the fix for do_fork needs checking
 - stifb doesn't compile
 - mux driver needs to be forward ported from 2.4 (rbrad)
 - merge 2.5.42
 - think the tcpdiag_cookie patch in our tree is now obsolete
 - need to get an official number for PDC_CONS or MUX (any problem with using
	the same number for both?) (rbrad)
 - send .text.init -> .init.text change to Linus (willy)
 - send tulip changes to jgarzik (grant)
 - figure out why we have genrtc 1.05 in our tree when linus has 1.06
 - do a better job of vmlinux{32,64}.lds
 - review diff vs 2.4 for additional changes
 - review diff vs 2.5 for changes which still need to be sent to Linus.

would these lists be more useful in html or would they just bitrot?

-- 
Revolutions do not require corporate support.
