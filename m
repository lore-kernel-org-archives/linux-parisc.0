Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.comcast.net (smtp.comcast.net [24.153.64.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id A81B1482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Apr 2002 14:33:02 -0700 (MST)
Received: from kenny (pcp944901pcs.cstltn01.in.comcast.net [68.58.113.28])
 by mtaout01.icomcast.net (iPlanet Messaging Server 5.1 (built Feb  6 2002))
 with SMTP id <0GU000GTFH70S1@mtaout01.icomcast.net> for
 parisc-linux@lists.parisc-linux.org; Wed, 03 Apr 2002 16:33:00 -0500 (EST)
Date: Wed, 03 Apr 2002 16:33:00 -0500
From: James S <smithjames@comcast.net>
To: parisc-linux@lists.parisc-linux.org
Reply-To: James S <smithjames@comcast.net>
Message-id: <009e01c1db57$21207ee0$02c1a8c0@james.co.uk>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Missing beep
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

I'm trying to generate  a beep from a bash shell script on my 712/60

the command i'm using is 

echo -e "\a"

which on a i486 box running kernel 2.2.19 & bash version 2.03 does beep

the 712/60 is running kernel 2.4.17-32, bash version 2.05a.0 doesnt

any ideas anybody ?

Thanks

James S
