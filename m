Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2C1FC4829
	for <parisc-linux@parisc-linux.org>; Mon, 17 Feb 2003 04:42:57 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18kjfk-0003Fn-00
	for <parisc-linux@parisc-linux.org>; Mon, 17 Feb 2003 12:42:56 +0100
Date: Mon, 17 Feb 2003 12:42:54 +0100
Message-ID: <3E48B5950000297E@ocpmta3.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] .config fo a N class?
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

I have the oportunity to test temporary a N class (N4000-55) dual processor.

I grab the config file of the test-drive L model; apply it against current
k-2.4.20-pa26 (just change 64 to 32 bits). I install this kernel on a ext
scsi disk and try to boot; unforunately it doesn't goes further than palo
message:
...
a common symptom -- search the FAQ and ml ..."

I try get a pim (from gsp TC); unfortunately empty (I mean all null values).

The only report (on esiee) I found regarding this kind of server was running
a 2.4.9 64 bits kernel.

Can somebody help me to find the corresponding config file?

Any add advise and idea are wellcome,
Thanks in advance,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
