Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA13029
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Dec 2000 03:55:44 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 12 Dec 2000 10:58:30 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id VAA14622;
	Tue, 12 Dec 2000 21:53:58 +1100
Date: Tue, 12 Dec 2000 21:53:58 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 32-bit xc-20001206.tar.gz is foobar 
In-Reply-To: <Pine.LNX.4.21.0012121945440.27939-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0012122137190.14312-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


linux/arch/parisc/vmlinux.lds is the culprit.  Or at least, the line

	OUTPUT_FORMAT("elf32-hppa")

along with a new linker that produces elf32-hppa-linux output format.
I'm committing a fix to pehc.

-- 
Linuxcare.  Support for the Revolution.
