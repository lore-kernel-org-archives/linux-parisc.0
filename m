Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4DA8D482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Jan 2003 06:03:48 -0700 (MST)
Date: Thu, 30 Jan 2003 14:03:43 +0100
Message-ID: <3E35C33F00000B40@ocpmta3.freegates.net>
In-Reply-To: <3E35C33F00000975@ocpmta3.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Issues with seteuid()?
To: "Randolph Chung" <tausq@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

PA,
>...
>>> cpu time             (seconds, -t) unlimited
>>> max user processes            (-u) 20
>>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> virtual memory        (kbytes, -v) unlimited
>>
>>That's the reason..... if you do 'ulimit -u unlimited' (or at least a
>>bigger number) you should be ok.
>>
>ulimit -u unlimited 
>
>(just for fun I can download to 64 for this test case; is there any means
>to determine a reasonnable value (unstable seems to set it to 999)?)
>
>
>PS: Where is defined this default?
>
It seems to be my bad ;_().
It appears in my own apt-get update Log that I use the default (ie N) when
the update procedure of 'libpam-modules' dpkg proposed me to change '/etc/security/limits.conf.

Sorry and thanks again for your support,

Joel


*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
