Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA28655
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Jun 1999 07:22:07 -0600
From: Steven Pritchard <steve@osiris.silug.org>
Message-Id: <199906101321.IAA20517@osiris.silug.org>
Subject: Re: [parisc-linux] Trying to get HP-UX working
In-Reply-To: <199906092252.QAA06166@rascal.fc.hp.com> from Matt Taggart at "Jun 9, 99 04:52:29 pm"
To: taggart@rascal.fc.hp.com (Matt Taggart)
Date: Thu, 10 Jun 1999 08:21:54 -0500 (CDT)
Cc: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Matt Taggart said:
> Does it make sense to go one step further and package them in either HP's 
> SD depot format or alternatively RPM(and provide RPM on HP-UX)? I have some 
> SD experience and could automate the packaging if needed.

Just for reference, the samba 2.0.x source has packaging scripts for
HP-UX.  I figured out how to build HP-UX packages from that example.
(It's pretty easy, although when you get done, building the package
isn't as simple as "rpm -ba" or "rpm --rebuild".)

Steve
-- 
steve@silug.org           | Linux Users of Central Illinois
(217)698-1694             | Meetings the 4th Tuesday of every month
Steven Pritchard          | http://www.luci.org/ for more info
