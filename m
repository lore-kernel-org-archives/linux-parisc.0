Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA12448
	for <parisc-linux@puffin.external.hp.com>; Tue, 22 Aug 2000 12:08:40 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 22 Aug 2000 18:08:30 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13RISe-0000MD-00
	for <parisc-linux@thepuffingroup.com>; Tue, 22 Aug 2000 14:07:44 -0400
To: parisc-linux@thepuffingroup.com
References: <87r97hwaxa.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 22 Aug 2000 14:07:42 -0400
In-Reply-To: David Huggins-Daines's message of "22 Aug 2000 11:52:17 -0400"
Message-ID: <87hf8dw4nl.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] glibc merge done
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> Expect this to land in a half hour or so.

It should be done now.  Statically linked stuff appears to still work,
at least, as does building libc.so.

You should probably make clean and reconfigure in order to pick up the
new files.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
