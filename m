Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA17831
	for <parisc-linux@puffin.external.hp.com>; Sun, 17 Oct 1999 23:37:20 -0600
Received: from rock.cup.hp.com (rock.cup.hp.com [15.16.123.90])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id BAA13805
	for <parisc-linux@thepuffingroup.com>; Mon, 18 Oct 1999 01:37:24 -0400 (EDT)
Received: (from grundler@localhost) by rock.cup.hp.com (8.8.6 (PHNE_16852)/8.7.1) id WAA20422 for parisc-linux@thepuffingroup.com; Sun, 17 Oct 1999 22:37:45 -0700 (PDT)
Date: Sun, 17 Oct 1999 22:37:45 -0700 (PDT)
From: Grant Grundler <grundler@rock.cup.hp.com>
Message-Id: <199910180537.WAA20422@rock.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] lasi Serial support
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
I just submitted another change to drivers/gecko/lasi.c after reviewing
the code and noting the IMR was being written twice in a row.

But I mainly write to question the location of LASI serial port code.
I don't know if it's "right" to have this code in lasi.c.  I'd like
to understand if it is and why. I'm confused because Lasi SCSI support
is in lasi7xx.c.  Is it reasonable to create a lasi_RS232.c (or whatever)?

And I'm thinking keeping the lasi.c/h files smaller is a good thing.
One can also modularize the support better (ie put the ifdef in the
Makefile instead).  Other thoughts on this?
If it's the "right" thing to do, any volunteers?

thanks,
grant
