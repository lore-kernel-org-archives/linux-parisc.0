Return-Path: <mkp@mkp.net>
Received: from jaguar.mkp.net (jaguar.mkp.net [192.139.46.146])
	by dsl2.external.hp.com (Postfix) with ESMTP id BA7814852
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  1 Mar 2004 10:50:12 -0700 (MST)
Sender: mkp@mkp.net
To: "Oliver Fuhrer" <oliver.fuhrer@bluewin.ch>
Subject: Re: [parisc-linux] Maybe OT: Login problem
From: "Martin K. Petersen" <mkp@mkp.net>
References: <402B3DEB002BCA4F@mail4.bluewin.ch>
Date: 01 Mar 2004 12:45:08 -0500
In-Reply-To: <402B3DEB002BCA4F@mail4.bluewin.ch> (added by
	postmaster@bluewin.ch)
Message-ID: <yq18yikmpgb.fsf@wilson.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

>>>>> "Oliver" == Oliver Fuhrer <oliver.fuhrer@bluewin.ch> writes:

Oliver> I'm having trouble to log in to my apollo 9000/705 workstation
Oliver> with debian 3. every time i log in, i have to change my
Oliver> password. No matter if i log in as root or as user.  I'v
Oliver> already reinstalled debian, but this problem persists.

Sounds like your system time is off.  Most likely your onboard battery
is dead.

Not sure whether replacements for 705 are easy to come by.  But if you
set the time at the PDC prompt before installing Debian, things should
work out better for you.

-- 
Martin K. Petersen      http://mkp.net/
