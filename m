Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 791224A18
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Feb 2001 16:35:40 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA12164;
	Fri, 2 Feb 2001 10:33:43 +1100
Date: Fri, 2 Feb 2001 10:33:43 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Paul Bame <bame@fc.hp.com>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] $$mulI missing 
In-Reply-To: <Pine.LNX.4.21.0102021028560.19209-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0102021033060.19209-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 2 Feb 2001, Alan Modra wrote:

> Errm.  32 bit might still want them.  #ifndef __LP64__ ?

Ahh, missed seeing your second commit :-)
