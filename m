Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA14491
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Apr 2000 18:26:43 -0600
From: willy@thepuffingroup.com
Date: Fri, 14 Apr 2000 21:24:26 -0400
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cross compiling glibc
Message-ID: <20000414212426.G15697@thepuffingroup.com>
References: <Pine.LNX.4.21.0004141013240.5167-100000@sammyville.sammy.net> <200004142232.PAA20329@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200004142232.PAA20329@milano.cup.hp.com>; from Grant Grundler on Fri, Apr 14, 2000 at 03:32:21PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Apr 14, 2000 at 03:32:21PM -0700, Grant Grundler wrote:
> 3) I also removed "csu" from sysd-sorted directory list.
>    Mathew told me to. So I did. This has to be done *after*
>    running ./configure script.
> 
> and then the make completed.

that was more a quick hack to get you to the next level than something
i'd recommend.  the `missing callinfo' error indicates you're using
an old version of binutils.  however, the current contents of the cvs
binutils won't build a kernel which boots.  i think it's my fault and
i'm trying to fix it.
