Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87F33482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Feb 2002 10:32:17 -0700 (MST)
To: tilo@jandt-online.net
Message-ID: <1013016725.3c616895611cf@webmail.tiscalinet.be>
Date: Wed, 06 Feb 2002 18:32:05 +0100 (CET)
From: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Re: Some Problems
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

Hey Tilo,

For X problem, I assume X has already working for you?
I met a similar problem and I solved it by matching the actual setting
definition of my display (can be get at boot prompt) to the XF86COnfig-4:
ie for my Display definition of 1280*1024 in XF86COnfig-4:
...
Section "Screen"
    ...
    Subsection "Display"
        Depth 8
        Modes "1280*1024"
    EndSubSection
    ....
EndSection

(may be for you change on the contrary)

(my kernel is a cvs 2.4.17-pa11 and xfree package are released 4.1.0-14)

For Keyboard and other, sorry I could not help.

Good luck,
    Joel

-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
