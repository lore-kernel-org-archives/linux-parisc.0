Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA06856
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Aug 2000 12:46:59 -0600
From: Steven Pritchard <steve@silug.org>
Message-Id: <200008291846.NAA32425@osiris.silug.org>
Subject: Re: [parisc-linux] linux-2.3 mkdep
In-Reply-To: <m13TmNe-001VpxC@chalet> "from bame@riverrock.org at Aug 29, 2000
 08:28:50 am"
To: bame@riverrock.org
Date: Tue, 29 Aug 2000 13:46:58 -0500 (CDT)
CC: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

bame@riverrock.org said:
> Pretty sure there's a tunable parameter to boost the argv size on hp-ux.

Assuming you have the right patches installed, you should have a
"large_ncargs_enabled" (IIRC, I don't have a HP-UX box handy at the
moment) tunable parameter.  Set it to 1.  (Note that this is only on
HP-UX 10.20 with the right patches...  In 11.0, they use a larger
buffer for argv by default.)

Steve
-- 
steve@silug.org           | Linux Users of Central Illinois
(618)398-7320             | Meetings the 4th Tuesday of every month
Steven Pritchard          | http://www.luci.org/ for more info
