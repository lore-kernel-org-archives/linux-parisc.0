Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp8.xs4all.nl (smtp8.xs4all.nl [194.109.127.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7BBDF482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 23:35:45 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp8.xs4all.nl (8.9.3/8.9.3) with ESMTP id HAA21841
	for <parisc-linux@lists.parisc-linux.org>; Thu, 6 Sep 2001 07:35:43 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Thu, 6 Sep 2001 07:35:38 +0200
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cvs update gives 'move away ....' on every file
Message-ID: <20010906073538.A12771@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010905152944.A23742@middle.of.nowhere> <200109060504.XAA09545@puffin.external.hp.com> <20010906131834.X16220@neep.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010906131834.X16220@neep.com.au>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 06, 2001 at 01:18:37PM +0800, Andrew Shugg wrote:
> Quoth Grant Grundler:
> > You didn't name the CVS repository to use and cvs got confused.
> > 
> > Try 'cd /home/cvs/parisc/linux; cvs update -APd'
> > Or  'cd /home/cvs/parisc; cvs update -APd linux'
> 
> ... with "-d:pserver:anonymous@puffin.external.hp.com:/home/cvs/parisc"
> in there too, or your current environment's $CVSROOT set accordingly.
> 
> The -q and -z3 flags are good too, to avoid unnecessary chatter and to
> compress the data stream a bit.  Avoid the temptation to crank up to -z9
> as this just puts the server on its back for minimal gain.
> 
So this shouldn't happen:

jurriaan@pa8200:/home/cvs/parisc$ tar zxf ~/source/linux-20010831.tar.gz
jurriaan@pa8200:/home/cvs/parisc$ echo $CVSROOT
:pserver:anonymous@puffin.external.hp.com:/home/cvs/parisc
jurriaan@pa8200:/home/cvs/parisc$ cvs update -APd linux
cvs update: move away linux/.cvsignore; it is in the way
C linux/.cvsignore
cvs update: move away linux/COPYING; it is in the way
C linux/COPYING
cvs update: move away linux/CREDITS; it is in the way
C linux/CREDITS
cvs [update aborted]: received interrupt signal
jurriaan@pa8200:/home/cvs/parisc$

Unfortunately, I see it both with linux-20010830.tar gz and with
linux-20010831.tar.gz

Jurriaan
-- 
GNU/Linux 2.4.9-ac7 SMP/ReiserFS 2x1402 bogomips load av: 0.00 0.00 0.00
