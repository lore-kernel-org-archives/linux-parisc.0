Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA23547
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Sep 2000 22:03:52 -0600
Sender: mkp@mkp.net
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: PATCH: memory patch
References: <200009040322.VAA10139@udlkern.fc.hp.com>
From: "Martin K. Petersen" <mkp@mkp.net>
Date: 04 Sep 2000 00:03:58 -0400
In-Reply-To: John Marvin's message of "Sun, 3 Sep 2000 21:22:42 -0600 (MDT)"
Message-ID: <yq1r970ls5t.fsf@tyra.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "John" == John Marvin <jsm@udlkern.fc.hp.com> writes:

John> I didn't choose the current 128 Mb maximum, and it can almost
John> certainly be greater than that. 

It was set to 128 because anything above that caused my 512 MB C160
to barf.  YMMV.

Since the box in question is still in transit from .dk to .ca, I can't
really verify it right now...

-- 
Martin K. Petersen      Cereal Bowl Engineer, Linuxcare, Inc.
http://mkp.net/         SGI XFS, Linux/PA-RISC, GNOME
