Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C992483F
	for <parisc-linux@parisc-linux.org>; Mon,  7 Jan 2002 04:50:07 -0700 (MST)
Received: from sap-ag.de (smtpde02)
  by smtpde02.sap-ag.de (out) with ESMTP id MAA19589
  for <parisc-linux@parisc-linux.org>; Mon, 7 Jan 2002 12:53:44 +0100 (MEZ)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: parisc-linux@parisc-linux.org
Subject: Fwd: Re: [parisc-linux] mpg321 on 715/64?
Date: Mon, 7 Jan 2002 12:49:52 +0100
MIME-Version: 1.0
Message-Id: <E16NYI1-0003EK-00@linuxlab.wdf.sap-ag.de>
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

CC'ed to to the list too:

----------  Forwarded Message  ----------

Subject: Re: [parisc-linux] mpg321 on 715/64?
Date: Mon, 7 Jan 2002 12:49:00 +0100
From: Helge Deller <helge.deller@sap.com>
To: "Peter Lavender" <plaven@bigpond.net.au>

> > Get yourself the latest kernel (>= 2.4.17-pa5) and update to the latest
> > mpg321 and it will work perfectly on your machine.
> > I tested it myself on my 715/64.
>
> OK..
>
> Now to be a total annoying slacker newbie.. can I apt-get install the
> kernel?

No.

You need to build it yourself. You may download a daily kernel source
snapshot as tarball from ftp://ftp.parisc-linux.org:21/cvs/ (though,
 2.4.17-pa5 isn't  there yet since I committed it yesterday night and this
 directory will be only updated once a day. Wait til' later today or
 tomorrow.), or
check out the sources from CVS (http://cvs.parisc-linux.org).

Helge
