Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.speakeasy.net (webmail4.speakeasy.net [216.254.0.84])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2C5264848
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Aug 2003 16:26:53 -0600 (MDT)
Received: from localhost (HELO webmail4) ([127.0.0.1])
          (envelope-sender <caslivkoff@speakeasy.net>)
          by localhost (qmail-ldap-1.03) with SMTP
          for <grundler@parisc-linux.org>; 14 Aug 2003 22:26:38 -0000
From: caslivkoff@speakeasy.net
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: "PARISC list" <parisc-linux@lists.parisc-linux.org>
Message-ID: <W9958529574305441060899998@webmail4>
Date: Thu, 14 Aug 2003 22:26:38 +0000
Subject: xchat colors (Was Re:  [parisc-linux] xfree86 4.2.1-9 build problem)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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

Hi Grant,

> yup - I was looking to find the code to and at least print a warning
> so I know that's the problem. I've spent < 1h hunting through the code
> to figure out where the colors for the text box was allocated. Haven't
> found it yet though.

Just to be sure this is indeed a colormap issue, start an X session using twm, then only launch xchat. If the colors are "OK", then it's a pretty good bet that the default colormap is max-ed out.

Also, I've attached is short Xlib program. This will report the number of private color cells remaining in the default colormap.

-chuck
