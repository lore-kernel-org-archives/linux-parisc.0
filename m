Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-1.cisco.com (sj-msg-core-1.cisco.com [171.71.163.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF376482F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Dec 2001 15:13:50 -0700 (MST)
Message-Id: <4.3.2.7.2.20011226134543.0279c300@mira-sjc5-9.cisco.com>
Date: Wed, 26 Dec 2001 13:51:17 -0800
To: bheadley@interaccess.com
From: Christian Suder <csuder@cisco.com>
Cc: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: [parisc-linux] Re: XFree86 Question
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

In case you still have the problem, if I remember correctly the reason is 
that the XFree config file is generated in a "PC-ish" manner with a lot of 
different screen definitions and tries to start X in a combination the fb 
device does not support. Edit it to have just an entry for the type of 
screen you have (likely 1280x1024, 8bit).

	Christian







Yay! Got my C110 up and happy on 0.93.

And now, an X question :-)

I'm getting this on startup of the X server,

	FBIOPUT_VSCREENINFO: Invalid argument

	Fatal server error:
	AddScreen/ScreenInit failed for driver 0

Any ideas? Ran the release note patch, and upgraded to 2.4.16-pa24 to no
avail. X server is rev 4.1.0-9.0.1.
