Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.xs4all.nl (smtp1.xs4all.nl [194.109.127.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 45506482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Sep 2001 13:14:44 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp1.xs4all.nl (8.9.3/8.9.3) with ESMTP id VAA16008
	for <parisc-linux@lists.parisc-linux.org>; Thu, 6 Sep 2001 21:14:42 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Thu, 6 Sep 2001 21:14:09 +0200
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cvs update gives 'move away ....' on every file
Message-ID: <20010906211409.A26423@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010906073538.A12771@middle.of.nowhere> <200109060608.AAA09806@puffin.external.hp.com> <20010906135327.C316@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010906135327.C316@parcelfarce.linux.theplanet.co.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 06, 2001 at 01:53:27PM +0100, Matthew Wilcox wrote:
> > One needs to:
> > 1) echo $CVSROOT > ~/Root
> > 2) find linux -name Root -exec cp ~/Root \{\} \;
> > 
> > (CVSROOT is the ":pserver:..." value posted several times earlier.)
> 
> easier is: for i in `find linux -name Root`; do echo $CVSROOT > $i; done
> 
> you're not using the most uptodate cvsrc... i fubar the last line, needs to be
> `remove', not `rm'.
> 
Thanks everyone, now it works. Is there interest in a short (20 lines)
document describing the steps, starting with the download of
linux-latest.tar.gz - 'how to get cvs running without stress' ?

Thanks,
Jurriaan
-- 
Now I will kill you until you die from it.
	Hot Shots II
GNU/Linux 2.4.9-ac7 SMP/ReiserFS 2x1402 bogomips load av: 0.00 0.00 0.12
