Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA07466
	for <parisc-linux@puffin.external.hp.com>; Sat, 4 Dec 1999 17:44:02 -0700
Received: (from dave@localhost)
	by hiauly1.hia.nrc.ca (8.9.3/8.9.3) id TAA01366
	for parisc-linux@thepuffingroup.com; Sat, 4 Dec 1999 19:45:58 -0500 (EST)
Message-Id: <199912050045.TAA01366@hiauly1.hia.nrc.ca>
To: parisc-linux@thepuffingroup.com
Date: Sat, 4 Dec 1999 19:45:57 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Still trying to get to sash on 735
List-ID: <linux-parisc.vger.kernel.org>

The kernel hangs when it tries to run "init" on my 735.  The problem
occurs in create_som_tables at the first __put_user macro:

        __put_user((unsigned long) envp,++sp);

The values of envp and sp are 0x20000000 and 0x2000001c, respectively.

Any ideas?

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
