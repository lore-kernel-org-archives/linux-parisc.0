Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id B953A4840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Nov 2003 17:58:39 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id 2EA47298034
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Nov 2003 17:58:39 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 13048-09 for <parisc-linux@lists.parisc-linux.org>;
	Thu, 20 Nov 2003 17:58:38 -0700 (MST)
Date: Thu, 20 Nov 2003 17:58:38 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031121005838.GC13007@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [BUG] dcopserver: ICE Connection rejected!
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

A few days ago, after an apt-get upgrade, konqueror wouldn't properly
start anymore. Error output is:
grundler@debian:~$ konqueror 
_KDE_IceTransmkdir: Owner of /tmp/.ICE-unix should be set to root
ICE Connection rejected!

DCOPClient::attachInternal. Attach failed Authentication Rejected, reason : None of the authentication protocols specified are supported and host-based authentication failed
ICE Connection rejected!

DCOPClient::attachInternal. Attach failed Authentication Rejected, reason : None of the authentication protocols specified are supported and host-based authentication failed
DCOPServer self-test failed.
kdeinit: DCOPServer could not be started, aborting.
kio (KSycoca): WARNING: Found version 40, expecting version 61 or higher.
kio (KSycoca): WARNING: Outdated database found
kio (KSycoca): WARNING: Found version 40, expecting version 61 or higher.
kio (KSycoca): WARNING: Outdated database found
kio (KMimeType): WARNING: KServiceType::offers : servicetype Browser/View not found
kio (KSycoca): WARNING: Found version 40, expecting version 61 or higher.
kio (KSycoca): WARNING: Outdated database found


I tried starting dcopserver by itself and got similar output:
grundler@debian:~$ dcopserver
_KDE_IceTransmkdir: Owner of /tmp/.ICE-unix should be set to root
ICE Connection rejected!

DCOPClient::attachInternal. Attach failed Authentication Rejected, reason : None of the authentication protocols specified are supported and host-based authentication failed
ICE Connection rejected!

DCOPClient::attachInternal. Attach failed Authentication Rejected, reason : None of the authentication protocols specified are supported and host-based authentication failed
DCOPServer self-test failed.
grundler@debian:~$ 


Something is wrong with dcopserver and/or how it uses iceauth.
If anyone has ideas on how to track this down besides using
strace, I'm interested. Using strace w/o the "-f" didn't help me
and w/-f it hung the kernel.

grant
