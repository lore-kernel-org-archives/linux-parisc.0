Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA20960
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 08:47:20 -0700
Date: Fri, 17 Nov 2000 10:49:22 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <20001117022526.4B38637CA7@carmen.fc.hp.com>
Message-ID: <Pine.BSO.4.21.0011171043510.19467-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] debian archive beware libpam
List-ID: <linux-parisc.vger.kernel.org>


JFYI to save other people some time.  Before firing up 
"apt-get upgrade" you'll be best off putting a hold on all the 
libpam packages, as the 0.72-12 version on ftp.us.debian.org 
fails on a bad symbol in libpam-misc, which locks you out 
of the box except if you boot single.

--
Brian S. Julin
