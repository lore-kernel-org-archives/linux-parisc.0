Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 3A5094842
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 Jan 2002 11:52:27 -0700 (MST)
Message-ID: <3C389D49.7030301@gmx.de>
Date: Sun, 06 Jan 2002 19:54:01 +0100
From: Sven Cronbenberg <sven.cronenberg@gmx.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
References: <3C388C82.6070509@web.de> <200201061918.29886.deller@gmx.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Use the X-Server from HPUX und PALinux?
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

On many PARISC Systems there is still no X-Windows
support or X-Windows has to access the graphics card
via the framebuffer device.

I wonder if there could be a chance to get the X-Server
from HPUX working under PALinux. Would the HPUX
compatiblity be good enough to have a chance whith
that?

Perhaps the suggestion sounds a bit unconventional but
for example many people running NETBSD on the
680x0 based HP-Workstations have made good experiences
with that. For example I am running a HP9000/425
und NETBSD 1.5 but because the HP300 port of
XFree is slow and buggy, I use the Xserver from
HPUX 9.


SVen
