Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA07411
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 May 2000 07:36:00 -0600
From: Steven Pritchard <steve@silug.org>
Message-Id: <200005291335.IAA11105@osiris.silug.org>
Subject: Re: [parisc-linux] EISA 10/100 nic for 715 systems ?
In-Reply-To: <39322B14.309E348B@america.net> "from Ed June at May 29, 2000 04:32:20
 am"
To: Ed June <buggz@america.net>
Date: Mon, 29 May 2000 08:35:58 -0500 (CDT)
CC: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Ed June said:
> Were there ever any EISA 10/100 LAN cards for 715 systems?
> I have found straight 10's and 100's, but not a switching one.

At my previous job, I had a spare EISA 10/100 card originally out of a
B160 that I used in my 715/100.

Either the cards or HP-UX was kind of weird about switching between 10
and 100.  I think I only got that card to talk 100 with a particular
brand of switch, and that was only when I forced the switch to 100
half duplex.  (The PCI cards did the same thing, but a kernel patch
for 10.20 released late last year seemed to fix autonegotiation.)

Steve
-- 
steve@silug.org           | Linux Users of Central Illinois
(618)398-7320             | Meetings the 4th Tuesday of every month
Steven Pritchard          | http://www.luci.org/ for more info
