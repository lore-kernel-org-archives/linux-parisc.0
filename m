Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA29195
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Dec 1999 15:17:14 -0700
Message-Id: <199912032215.RAA01366@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] bad news, good news, unkown (Temp CR used as permanent storage)
To: frowand@cup.hp.com (Frank Rowand)
Date: Fri, 3 Dec 1999 17:15:17 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199912032052.MAA02894@xsvr4.cup.hp.com> from "Frank Rowand" at Dec 3, 99 12:52:12 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On the subject of things possibly getting clobbered in PDC/IODC calls,
I think the variable real_routine can get clobbered since it is used
for more than one type of call.

The good news is that I have made some improvement to the PDC/IODC
console.  I have eliminated the double lines, and when the IODC console
is configured, the system can now successfully print all stored
messages and open /dev/console.  However, in making changes to iodccon.c,
I realized that the IODC console is a really bad video console since you
can't do cursor addressing.  I think it would better to use the serial
driver.

Thoughts?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
