Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cactus.bheadley.org (d147.focal4.interaccess.com [207.208.139.147])
	by dsl2.external.hp.com (Postfix) with ESMTP id F1EA8482B
	for <parisc-linux@parisc-linux.org>; Sun, 23 Dec 2001 17:59:20 -0700 (MST)
Received: from interaccess.com (IDENT:4NmTXND6Ne041+bY+qeEGvI3VEuhboVl@localhost.localdomain [127.0.0.1])
	by cactus.bheadley.org (8.11.6/8.11.6) with ESMTP id fBO0wBR01701
	for <parisc-linux@parisc-linux.org>; Sun, 23 Dec 2001 18:58:16 -0600
Message-ID: <3C267DA3.4040504@interaccess.com>
Date: Sun, 23 Dec 2001 18:58:11 -0600
From: "Bryan W. Headley" <bheadley@interaccess.com>
MIME-Version: 1.0
To: parisc-linux@parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] XFree86 Question
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

Yay! Got my C110 up and happy on 0.93.

And now, an X question :-)

I'm getting this on startup of the X server,

	FBIOPUT_VSCREENINFO: Invalid argument

	Fatal server error:
	AddScreen/ScreenInit failed for driver 0

Any ideas? Ran the release note patch, and upgraded to 2.4.16-pa24 to no 
avail. X server is rev 4.1.0-9.0.1.


-- 
____               .:.                 ____
Bryan W. Headley - bheadley@interaccess.com
