Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA14814
	for <parisc-linux@puffin.external.hp.com>; Thu, 29 Jun 2000 10:16:21 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 29 Jun 2000 16:17:20 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] userland test failure
References: <Pine.LNX.4.21.0006291440280.27908-100000@front.linuxcare.com.au> <874s6csd6b.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@debian.org>
Date: 29 Jun 2000 12:16:48 -0400
In-Reply-To: David Huggins-Daines's message of "29 Jun 2000 11:46:20 -0400"
Message-ID: <87ya3oqx73.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: David Huggins-Daines <dhd@linuxcare.com>
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> Would I be correct in assuming that the GCC portion of supporting
> -fPIC is more or less done, it's just that the linker can't handle the
> relocations generated?

Oh, right, that's a DLT relative reloc.  I see what the problem is now :-)

-- 
David Huggins-Daines - dhd@debian.org
