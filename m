Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dsl2.external.hp.com (localhost [127.0.0.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8B184482C
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 May 2002 09:37:02 -0600 (MDT)
To: PA/Linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: New testing ISO available with recent boot-floppies 
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Fri, 24 May 2002 18:59:49 MDT." <20020525005949.369B6482A@dsl2.external.hp.com>
References: <19B02A72-6F75-11D6-9D55-0030656F07A2@esiee.fr>  <20020525005949.369B6482A@dsl2.external.hp.com> 
Date: Sat, 25 May 2002 09:37:02 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020525153702.8B184482C@dsl2.external.hp.com>
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

Grant Grundler wrote:
> sba_pa8700 patch isn't committed yet for two reasons:
>   o It's not tested on anything but the rp24xx. I'm convinced it will
>     crash on other boxes.
>   o I'm waiting for feedback on how to properly implement
>     self-modifying code in the kernel or if it's just not worth it. 

I've decided to commit sba_pa870.diff as -pa26 w/o self modifying code.
It just didn't look like a perf improvement w/o getting really ugly.

...
> With that in mind, please don't download 20020524 ISO (736 MB) unless 

thanks Richard! (73MB) Forget my request; download all you want.

grant
