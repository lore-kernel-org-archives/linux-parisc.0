Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA09736
	for <parisc-linux@puffin.external.hp.com>; Tue, 4 Apr 2000 12:45:22 -0600
Received: (from steve@localhost)
	by osiris.silug.org (8.9.3/8.9.3) id NAA11438
	for parisc-linux@thepuffingroup.com; Tue, 4 Apr 2000 13:44:57 -0500
From: Steven Pritchard <steve@silug.org>
Message-Id: <200004041844.NAA11438@osiris.silug.org>
Subject: Re: [parisc-linux] Building bin-utils and gcc on HP735...
In-Reply-To: <E12cW8W-0006p3-00@endor.fc.hp.com> from Paul Bame at "Apr 4, 2000
 10:25:04 am"
To: parisc-linux@thepuffingroup.com
Date: Tue, 4 Apr 2000 13:44:57 -0500 (CDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame said:
> Sooner or later it is probably a good idea to start using GNU versions
> of all the tools referenced in the makefiles and scripts if you have
> the space to do so.

I should note that there are HP-UX 10.20 and 11.0 binary depot
packages of many GNU utilities at

    ftp://puffin.external.hp.com/pub/parisc/binaries/depot/

Everything installs to /usr/local/bin, so you can just put that at the
beginning of your PATH, and everything should be happy.  (Oh, before
installing any of it, you might want to "chmod -R go-w /usr/local".
The default permissions are insane.)

Feel free to send requests for other stuff.  (I'll try to start
building packages for the CVS gcc, binutils, etc. sometime soon.  I'm
still recovering from switching jobs and a move, so I'm way behind on
everything...)

Steve
-- 
steve@silug.org           | Linux Users of Central Illinois
(618)398-7320             | Meetings the 4th Tuesday of every month
Steven Pritchard          | http://www.luci.org/ for more info
