Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from snipe.mail.pas.earthlink.net (snipe.mail.pas.earthlink.net [207.217.120.62])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58A814850
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Jul 2002 10:24:24 -0600 (MDT)
Received: from 209-165-118-194.dsl.earthlink.net ([209.165.118.194] helo=cactus.bheadley.org)
	by snipe.mail.pas.earthlink.net with esmtp (Exim 3.33 #1)
	id 17P3yR-00015E-00
	for parisc-linux@lists.parisc-linux.org; Mon, 01 Jul 2002 12:24:23 -0400
Received: from localhost.localdomain
	([127.0.0.1] helo=earthlink.net ident=bheadley)
	by cactus.bheadley.org with esmtp (Exim 3.35 #1 (Debian))
	id 17P3zf-0000VJ-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 01 Jul 2002 11:25:39 -0500
Message-ID: <3D208283.1060504@earthlink.net>
Date: Mon, 01 Jul 2002 11:25:39 -0500
From: "Bryan W. Headley" <bwheadley@earthlink.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Resolution: XFree 4.2
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

It seems that adding a line,

   Section "Screen"
           Identifier      "Default Screen"
           Device  "Frame Buffer"
           Monitor  "Generic Monitor"
+         DefaultFbBpp    32
           DefaultDepth    24

Seems to do the trick. Don't know if it's needed on other resolutions...



-- 
____               .:.                 ____
Bryan W. Headley - bwheadley@earthlink.net
