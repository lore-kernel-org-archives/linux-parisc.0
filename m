Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.comcast.net (smtp.comcast.net [24.153.64.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0B8BE4841
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 09:54:22 -0700 (MST)
Received: from kenny (pcp944901pcs.cstltn01.in.comcast.net [68.58.113.28])
 by mtaout02.icomcast.net (iPlanet Messaging Server 5.1 (built Feb  6 2002))
 with SMTP id <0GSV00137DMKWK@mtaout02.icomcast.net> for
 parisc-linux@lists.parisc-linux.org; Tue, 12 Mar 2002 11:54:20 -0500 (EST)
Date: Tue, 12 Mar 2002 11:54:18 -0500
From: James S <smithjames@comcast.net>
Subject: Re: [parisc-linux] Konqueror without aRts? (Was: Mozilla and Galeon)
To: Thomas Schmid <Thomas.Schmid@ascom.ch>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: James S <smithjames@comcast.net>
Message-id: <001601c1c9e6$8e1fe300$02c1a8c0@james.co.uk>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
References: <OF7C015490.26FA7FD8-ONC1256B7A.003B7D2A@hasler.ascom.ch>
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

> Hi James,
>
> Running KDE was a problem on my machines: 715/100XC, 712/80. It took about
> 5min from loging
> in at KDM to see KDE, producing 3 times a "knotify"-error. From this list
> I got the tip that this was due
> to "libarts" and indeed, after removing "libarts", the login process was
> much faster and would not
> give me the "knotify"-errors anymore.
> Unfortunately removing "libarts" meant removing "konqueror" as well, or at
> least "dselect" would
> always force the removal.
>
> Did you find a way to have "konqueror" without "aRts" ? Or don't you have
> the problem with KDM
> login ?
>
i sort of cheated - i'm using windowmaker & ran konqueror under that
although it was still painfully slow to load

i dont think the arts lib is a dependency of konqueror, it must be a
dependant of another section of KDE

i also never used any of the the login managers (kdm xdm etc) as i dont do
any remote x-logins, so i never encountered any problems there.

James S
