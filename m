Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id A515F4839
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Feb 2003 09:56:11 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18iHE2-0000F3-01
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Feb 2003 17:56:10 +0100
Date: Mon, 10 Feb 2003 17:55:56 +0100
Message-ID: <3E476CFE000007AD@ocpmta3.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] pppd, pthread and hppa-linux question?
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

Hi all,

Since a month, I use ppp to have an external ISP connection (to have additional
rsync and cvs).

All seems to work fine, never the less I notice some pppd messages which
I do not noticed on my i386 Debian GNU/Linux box:
...
Feb 10 17:34:57 fw01 pppd[1543]: read: Resource temporarily unavailable
Feb 10 17:34:57 fw01 pppd[1543]: read /dev/ppp: Resource temporarily unavailable
...
(there are so many that it become annoying :()

Well, analysing sources, it seems to come from thread? 
Is there some known pb regarding hppa-linux thread implementation (kernel,
glibc, pppd, ...)?

Thanks in advance for help,
    Joel



---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
