Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 04A20482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Feb 2003 10:42:31 -0700 (MST)
Date: Mon, 10 Feb 2003 18:42:26 +0100
Message-ID: <3E476CFE00000805@ocpmta3.freegates.net>
In-Reply-To: <200302101732.h1AHWW6m006054@hiauly1.hia.nrc.ca>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] pppd, pthread and hppa-linux question?
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
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

>
>> Well, analysing sources, it seems to come from thread? 
>> Is there some known pb regarding hppa-linux thread implementation (kernel,
>> glibc, pppd, ...)?
>
>Yes.  There have been issues with locking in glibc wrt threads.  Also,
>the functions in atomicity.h are not atomic.  There may also be problems
>in the kernel, particularly SMP.
>
Ha ok, I will so wait.

Thanks to all,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
