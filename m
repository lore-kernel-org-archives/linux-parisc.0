Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA28696
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Mar 2000 02:32:48 -0700
Sender: mkp@socsci.auc.dk
To: Nick Cabatoff <ncc@cs.mcgill.ca>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HFS linux implementation
References: <20000309193535.C3423@cs.mcgill.ca>
From: "Martin K. Petersen" <mkp@mkp.net>
Date: 10 Mar 2000 09:33:58 +0100
In-Reply-To: Nick Cabatoff's message of "Thu, 9 Mar 2000 19:35:35 -0500"
Message-ID: <yq1put3xlzd.fsf@leyland.socsci.auc.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Nick" == Nick Cabatoff <ncc@cs.mcgill.ca> writes:

Hi Nick,

Nick> I'm interested in the possibility of doing a linux module to
Nick> mount HFS filesystems (read-only would satisfy me I think, and
Nick> is a reasonable target.)

I implemented read only hfs support in the early days of the PA-RISC
port.  It appears my ufs changes didn't get merged in when we moved
from 2.2 to 2.3, though.  Will fix...

One of Paul Bame's colleagues looked into implementing write support
at some point, but I don't know status on that project.  Paul?

-- 
Martin K. Petersen, Principal Linux Consultant, Linuxcare, Inc.
mkp@mkp.net, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
