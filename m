Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55] (may be forged))
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA04356
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Nov 2000 02:18:32 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 28 Nov 2000 09:19:49 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id UAA19136;
	Tue, 28 Nov 2000 20:19:20 +1100
Date: Tue, 28 Nov 2000 20:19:20 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Thomas Marteau <marteaut@esiee.fr>
cc: Puffin Group <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Include trouble
In-Reply-To: <Pine.LNX.4.21.0011281521520.7628-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0011282016040.18407-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 28 Nov 2000, Alan Modra wrote:

> As far as I understand, gcc's cpp has a built-in definition of size_t,
> __SIZE_TYPE__, and it ultimately gets it's idea of the definition from the
> kernel includes on the machine where gcc was compiled.  ie. recompile gcc
> with the new kernel headers installed, and the problem should go away.

No, that's wrong.  __SIZE_TYPE__ comes from `#define SIZE_TYPE' in
gcc/config/pa/pa-linux{,64}.h  I'll check in a patch to gcc in a few
moments.

Alan
-- 
Linuxcare.  Support for the Revolution.
