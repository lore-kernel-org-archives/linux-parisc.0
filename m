Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C1C6482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Jul 2003 07:01:32 -0600 (MDT)
Date: Wed, 23 Jul 2003 15:01:24 +0200
Message-ID: <3F1CEEEE000003DF@ocpmta8.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: 201873@bugs.debian.org
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] nfs-kernel-server: can't use nfs ...
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

Package: nfs-kernel-server
Version: 1.0.3-2
Severity: critical

Yes same notice on hppa unstable debian gnu/linux:
"mount: RPC: Unable to receive; errno = Connection refused"

dmesg informe me that rpc.mountd do_page_fault() at this very moment: this
explain the previous message. Is it the same on other paltform?

temporary come back to nfs-kernel-server_1.0.2-2 (date Feb 2003) help temporary
to solve this pb.

hth,
    Joel



------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
