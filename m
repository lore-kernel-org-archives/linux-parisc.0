Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA03537
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 09:06:48 -0600
Message-Id: <199906211506.LAA02079@hiauly1.hia.nrc.ca>
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Mon, 21 Jun 1999 11:06:27 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <19990621105017.N30362@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jun 21, 99 10:50:17 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Assembly error: entry.S
List-ID: <linux-parisc.vger.kernel.org>

The following error occurs building the kernel:

gcc -D__KERNEL__ -I/ehic/a/pa/linux/include    -c -o entry.o entry.S
entry.S:219: macro `ENTRY_NAME' used without args
make[1]: *** [entry.o] Error 1

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
