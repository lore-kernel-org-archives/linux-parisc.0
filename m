Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dsl2.external.hp.com (localhost [127.0.0.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 369B6482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 24 May 2002 18:59:49 -0600 (MDT)
To: PA/Linux <parisc-linux@lists.parisc-linux.org>
In-Reply-To: Message from Thibaut VARENE <varenet@esiee.fr>
   of "Sat, 25 May 2002 02:19:38 +0200." <19B02A72-6F75-11D6-9D55-0030656F07A2@esiee.fr>
References: <19B02A72-6F75-11D6-9D55-0030656F07A2@esiee.fr> 
Date: Fri, 24 May 2002 18:59:49 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020525005949.369B6482A@dsl2.external.hp.com>
Subject: [parisc-linux] Re: New testing ISO available with recent boot-floppies
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

Thibaut VARENE wrote:
> You can download it from these locations:
> ftp://ftp.parisc-linux.org/cd-images/testing/palinux-2.4.18-pa25-20020524-netinst.iso

I've copied the 20020524 test ISO to:
ftp://gsyprf10.external.hp.com/pub/cd-images/palinux-2.4.18-pa25-20020524-netinst.iso

Duraid Madina wrote:
> Does this new ISO include Grant's patch from yesterday, allowing
> booting on PA-8700 machines?

sba_pa8700 patch isn't committed yet for two reasons:
  o It's not tested on anything but the rp24xx. I'm convinced it will
    crash on other boxes.
  o I'm waiting for feedback on how to properly implement
    self-modifying code in the kernel or if it's just not worth it. 

Thibaut offered to respin the ISO (he knows how to do it now)
with -pa26 (or whatever sba_pa8700.diff becomes).
With that in mind, please don't download 20020524 ISO (736 MB) unless 
you really need it *now* or want to test it on your favorite box for us.

thanks,
grant
