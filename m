Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.comcast.net (smtp.comcast.net [24.153.64.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D8DC482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Apr 2002 08:48:39 -0700 (MST)
Received: from kenny (pcp944901pcs.cstltn01.in.comcast.net [68.58.113.28])
 by mtaout45-01.icomcast.net (iPlanet Messaging Server 5.1 (built Feb  6 2002))
 with SMTP id <0GU300IHHQKYAH@mtaout45-01.icomcast.net> for
 parisc-linux@lists.parisc-linux.org; Fri, 05 Apr 2002 10:48:34 -0500 (EST)
Date: Fri, 05 Apr 2002 10:48:37 -0500
From: James S <smithjames@comcast.net>
Subject: Re: [parisc-linux] Missing beep... and music too
To: Jbit <james_a_n_lee@yahoo.com>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: James S <smithjames@comcast.net>
Message-id: <004101c1dcb9$59b3ca60$02c1a8c0@james.co.uk>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
References: <Pine.LNX.4.33.0204042038090.29216-100000@bob.ncssm.edu>
 <20020405055415.C6C54482B@dsl2.external.hp.com> <3CADB0AD.1050307@yahoo.com>
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

> BTW... Everybodys aware that the internal speaker is connected to the LASI
Harmony chip, yeah?
> (Theres no way to generate a beep in hardware, you'd need to make a driver
that generated a PCM beep and sent it to the hardware)
> At least AFAIK
>
that explains the missing beep, then

wonder if it would make sense to put the necessary code for a beep into the
kernel.....


James S
