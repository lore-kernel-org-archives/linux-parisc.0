Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA06198
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 11:56:36 -0600
Message-Id: <199906211756.NAA10393@hiauly1.hia.nrc.ca>
To: adevries@thepuffingroup.com (Alex deVries)
Date: Mon, 21 Jun 1999 13:56:26 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <376A9AF9.5F3DB326@thepuffingroup.com> from "Alex deVries" at Jun 18, 99 03:16:09 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Problems with createheader.sh script
List-ID: <linux-parisc.vger.kernel.org>

When creating a LIF image, i get the following errors:

./boot_tools/createheader.sh boot_code/ipl ../../../../vmlinux
./boot_tools/createheader.sh: !: not found
./boot_tools/createheader.sh: !: not found
(standard_in) 1: illegal character: J
(standard_in) 1: parse error
(standard_in) 1: parse error
(standard_in) 1: parse error
(standard_in) 1: illegal character: J
IPL address: 4096       kernel address: 49152
IPL size:  45056 Jun    kernel size:
IPL entry: 4096         kernel entry: 32768
Header created.

I think the problem is lies with the cut command.  The character
position of file sizes in the 'ls -l' command varies.  The hpux
9.01 ls position differs from that of GNU ls.  I think it would
be better to use awk to grab the file size info.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
