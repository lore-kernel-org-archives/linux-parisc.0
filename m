Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dobit2.rug.ac.be (dobit2.rug.ac.be [157.193.42.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id A1B264829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Sep 2002 14:50:21 -0600 (MDT)
Date: Mon, 30 Sep 2002 22:50:17 +0200 (MEST)
From: Frank Cornelis <Frank.Cornelis@rug.ac.be>
To: James Smith <james@compusmithllc.com>
Cc: Frank Cornelis <Frank.Cornelis@rug.ac.be>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] firmware update using BOOTP
In-Reply-To: <1033395024.454.3.camel@seventy>
Message-ID: <Pine.GSO.4.31.0209302241060.16124-100000@eduserv.rug.ac.be>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> most of my 712's are ver 1.9 or 2.1 & they all work fine as far as i can
> see with linux - is there any advantage to updating to 2.3 ?
>
> or is this a case of 'if its not broken....'

The text file that comes with the 2.3 patch mentions
	More reliable LAN operation
as one of the improvements. I wanted to be sure for my BOOTP lifimage
loading.
Anyway, it's really easy to do.
Create an /etc/bootptab on your server containing:
.default:\
        :sm=255.255.255.224:\
        :gw=192.168.1.62:\
        :ds=195.130.131.2:\
        :ht=ethernet:\
        :bf=C7120023.frm:

hp712:hn:ha=0800099D56DA:ip=192.168.1.34:tc=.default

Of course, adjust with your network settings (man bootptab).
Run the bootpd daemon (and tftp daemon) on your server and reboot your HP.
Then goto the BOOT_ADMIN menu using ESC and type:
	search lan
You should see your BOOTP server listed.
Then simply do:
	boot lan

That's it.

Frank.
