Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 007C24A19
	for <parisc-linux@parisc-linux.org>; Thu, 22 Mar 2001 14:20:31 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14gCVR-0002QZ-00; Thu, 22 Mar 2001 21:20:29 +0000
Date: Thu, 22 Mar 2001 21:20:29 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Markus Werle <markus@lufmech.rwth-aachen.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] configure --host=xx revisited
Message-ID: <20010322212029.T5491@parcelfarce.linux.theplanet.co.uk>
References: <3AB9F2BC.33E89887@lufmech.rwth-aachen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3AB9F2BC.33E89887@lufmech.rwth-aachen.de>; from markus@lufmech.rwth-aachen.de on Thu, Mar 22, 2001 at 01:40:28PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Mar 22, 2001 at 01:40:28PM +0100, Markus Werle wrote:
> Hi !
> 
> during the last months I stumbled through the naming
> conventions of "host" used in configure scripts of
> gcc/binutils and other gnu packages.
> 
> I am looking for information about this naming convention.
> Some people got confused configuring gcc for hpux, because
> e.g. hppa-2.0w-etc. does not mean a 64-bit version.

hppa-foo -- 32 bit, pa 1.1
hppa2.0-foo -- 32 bit, pa 2.0
hppa2.0w-foo -- 64 bit

-- 
Revolutions do not require corporate support.
