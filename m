Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver1.hrz.tu-darmstadt.de (mailserver1.hrz.tu-darmstadt.de [130.83.126.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id 430E6482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Sep 2001 07:30:43 -0600 (MDT)
Received: from fb04281.mathematik.tu-darmstadt.de (fb04281.mathematik.tu-darmstadt.de [130.83.2.21])
	by mailserver1.hrz.tu-darmstadt.de (8.9.1a/8.9.1) with ESMTP id PAA02009
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Sep 2001 15:29:17 +0200 (MET DST)
Received: from fb0482.mathematik.tu-darmstadt.de (dummy82.mathematik.tu-darmstadt.de [130.83.2.82])
	by fb04281.mathematik.tu-darmstadt.de (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA09324
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Sep 2001 15:30:38 +0200
Received: (from grothe@localhost)
	by fb0482.mathematik.tu-darmstadt.de (8.9.3/8.9.3/Debian 8.9.3-21) id PAA29169
	for parisc-linux@lists.parisc-linux.org; Thu, 20 Sep 2001 15:30:38 +0200
Date: Thu, 20 Sep 2001 15:30:38 +0200
From: hgrothe@mathematik.tu-darmstadt.de
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] interesting problem in tty? telnetd? ls?
Message-ID: <20010920153038.A29157@mathematik.tu-darmstadt.de>
References: <Pine.WNT.4.33.0109191442050.5872-100000@nemo.dev.metainfo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.WNT.4.33.0109191442050.5872-100000@nemo.dev.metainfo.com>; from marka@sea.checkpoint.com on Wed, Sep 19, 2001 at 02:55:13PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Sep 19, 2001 at 02:55:13PM -0700, marka@sea.checkpoint.com wrote:
> I'm not sure where this problem is occuring, but I suspect it's telnetd.
> 
> telnet to your pa-risc linux box
> cd to the root directory
> execute 'ls -alR'
> 
> you'll lose your ptty and telnet session after a short while (seconds), but
> never at the the same place during the listing.  This does not occur over the
> serial console, but since that's only running at 9600 it may not be fast
> enough for the drop to occur.
>
Yes, it's telnetd. Replacing /usr/sbin/in.telnetd (telnetd_0.17-16_hppa.deb)
with a self-compiled one (from source netkit-telnet_0.16.orig.tar.gz with
potato patches) works for me. I modified Makefile in subdir telnetd to use
the correct login wrapper (the one from 0.17): 
   -DLOGIN_WRAPPER=\"/usr/lib/telnetlogin\"

HTH, Holger

P.S.: openssh works out of the box and is more secure
-- 
Holger Grothe  (Email: hgrothe@mathematik.tu-darmstadt.de)
Fachbereich Mathematik, TU Darmstadt
