Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA27930
	for <parisc-linux@puffin.external.hp.com>; Tue, 17 Oct 2000 17:59:50 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 18 Oct 2000 00:01:08 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA02839;
	Wed, 18 Oct 2000 11:00:58 +1100
Date: Wed, 18 Oct 2000 11:00:58 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: problems with binutils and/or g++
In-Reply-To: <87r95f2ogl.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0010181054370.1579-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 17 Oct 2000, David Huggins-Daines wrote:

> recompiling with -fno-rtti, as I don't think APT uses it).  But on the
> other hand we've had problems with link-once sections in the past.

Translation:  Alan has been mucking around with link-once section symbols
and may have broken something.

I'll take a look.

-- 
Linuxcare.  Support for the Revolution.
