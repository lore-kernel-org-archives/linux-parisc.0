Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA12060
	for <parisc-linux@puffin.external.hp.com>; Wed, 5 Jul 2000 11:18:08 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 5 Jul 2000 17:19:30 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 139sos-0002nl-00
	for <parisc-linux@thepuffingroup.com>; Wed, 05 Jul 2000 13:18:42 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 05 Jul 2000 13:18:42 -0400
Message-ID: <87lmzgmr65.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Another step towards userland: dpkg
List-ID: <linux-parisc.vger.kernel.org>

I've gotten dpkg CVS to compile, sort of (it needs some coaxing since
we have static NSS):

# uname -a
Linux 10.160.240.101 2.3.99-pre8 #12 Wed Jul 5 11:31:23 EDT 2000 parisc unknown
# dpkg --version
Debian GNU/Linux `dpkg' package management program version 1.7.0 (parisc).
This is free software; see the GNU General Public Licence version 2 or
later for copying conditions.  There is NO warranty.
See dpkg --licence for copyright and license details.

Once I figure out dpkg-cross I'll see if I can build some actual
packages, starting from the stuff Matt Taggart has already set up.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
