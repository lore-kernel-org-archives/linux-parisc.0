Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA24957
	for <parisc-linux@puffin.external.hp.com>; Mon, 9 Oct 2000 22:10:56 -0600
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Fuzzy math (df output)
References: <200010092355.QAA04061@milano.cup.hp.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 09 Oct 2000 23:56:54 -0400
In-Reply-To: Grant Grundler's message of "Mon, 9 Oct 2000 16:55:34 -0700 (PDT)"
Message-ID: <873di5fiwp.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler <grundler@cup.hp.com> writes:

> Seems like the Use% numbers came from a presidential debate. :^)
> If someone is looking for something to do...

Your df is probably built with the old broken compiler that didn't
handle floating point variadic arguments correctly.  I suggest
upgrading it (it's in fileutils).

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
