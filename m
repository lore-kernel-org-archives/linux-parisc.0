Received: from bentley.socsci.auc.dk (bentley.socsci.auc.dk [130.225.60.48])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id RAA03981
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Feb 2000 17:44:01 -0700
Sender: mkp@socsci.auc.dk
To: parisc-linux@puffin.external.hp.com
From: "Martin K. Petersen" <mkp@mkp.net>
Date: 15 Feb 2000 00:44:20 +0100
Message-ID: <yq1ael39wob.fsf@leyland.socsci.auc.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Note about consoles - Clarification
List-ID: <linux-parisc.vger.kernel.org>


Philipp pointed out I didn't make this clear in my previous mail:

IODC console isn't going away.  It just has extremely limited
usability (No cursor positioning etc).  However, IODC is - and will
continue to be - useful for bootstrapping.

The only currently known-to-work interactive console is the LASI
serial one.  Hence my previous statement about that being the only
option for getting to a prompt for the time being.

-- 
Martin Kasper Petersen			BOFH, IC1&2, Aalborg University, DK
mailto:mkp@SunSITE.auc.dk		http://SunSITE.auc.dk/~mkp/
