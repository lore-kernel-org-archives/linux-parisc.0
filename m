Return-Path: <wichert@levante.wiggy.net>
Received: from mx1.wiggy.net (levante.wiggy.net [195.85.225.139])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F2134890
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  1 Mar 2004 16:00:16 -0700 (MST)
Received: from wichert by mx1.wiggy.net with local (Exim 4.30)
	id 1AxwOK-0002p9-BR
	for parisc-linux@lists.parisc-linux.org; Tue, 02 Mar 2004 00:00:04 +0100
Date: Tue, 2 Mar 2004 00:00:04 +0100
From: Wichert Akkerman <wichert@wiggy.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040301230004.GH2502@wiggy.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="C7zPtVaVf+AK4Oqc"
Sender: Wichert Akkerman <wichert@levante.wiggy.net>
Subject: [parisc-linux] stuck 2.6.3-pa2 kernel on 9000/a500
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I just noticed that nessler.debian.org hung. Complete serial console
logs and ser pim output are attached.

Kernel is 2.6.3-pa2 compiled using gcc 3.0.4 taken from ftp.p-a.o.

Wichert.


-- 
Wichert Akkerman <wichert@wiggy.net>    It is simple to make things.
http://www.wiggy.net/                   It is hard to make things simple.


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=kernellog

sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.
eth0: MII status 780d, Link partner report 0000.

 eth0 csr12 c6  not lnc!!
sym3: SCSI BUS reset detected.
sym3: SCSI BUS has been reset.

Stack Dump:
 0000000039e1d578:  0000000039e1d578 00000000102f1774 0000000010448e80 0000000010448e80
 0000000039e1d558:  0000000010448e80 0000000000001896 0000000010448e80 000000008d7a64c0
 0000000039e1d538:  0000000000000002 0000000000000000 0000000010448e80 0000000000001000
 0000000039e1d518:  00000000000a340e 0000000000000000 0000000000000002 0000000000000000
 0000000039e1d4f8:  0000000000000080 0000000039e1d000 0000000000000000 0000000010448e80
 0000000039e1d4d8:  000000000000000f 0000003f0804ff17 3f8020c500000000 000000000800000e
 0000000039e1d4b8:  0000000010448e80 000000001010df64 0000000000000004 0000000039e1d2c0
 0000000039e1d498:  0000000010448e80 0000000010448e80 000000003372c100 00000000104e1218
 0000000039e1d478:  0000000010448e80 00000000000f4000 0000000020515440 0000000048019c78
 0000000039e1d458:  0000000010448e80 0000000000000000 ffffffffffffffff ffffffffffffffff
 0000000039e1d438:  4000c678c1c43248 000000001023c8ec 0000000000000001 0000000039e1d2c0
 0000000039e1d418:  0000000010448e80 0000000010448e80 0000000000000063 0000000000000000
 0000000039e1d3f8:  0000000010448e80 0000000010448e80 0000000000030104 0000000000000000
 0000000039e1d3d8:  0000000010448e80 0000000000000054 00000000132d8000 0000000010448e80
 0000000039e1d3b8:  000000000800000e 0000000010139498 000000008d7a64c0 0000000010448e80
 0000000039e1d398:  0000000010448e80 0000000000001a94 0000000010448e80 0000000000000000
 0000000039e1d378:  0000000000000002 0000000000000000 0000000000000000 0000000000000010
 0000000039e1d358:  0000000000000000 0000000010448e80 000000001328e000 0000000000000000
 0000000039e1d338:  000000008ecc5b20 0000000010109094 000000008281bec0 00000000133277c0
 0000000039e1d318:  0000000000000082 0000000010448e80 000000003372c100 000000001039488c
 0000000039e1d2 0000000000000001 0000000000000000 0000000010448e80 0000000039e1cb80
 0000000039e1d2d8:  0000000000000002 0000000039e1c690 0000000000000002 0000000000000000
 0000000039e1d2b8:  00000000104049d8 0000000010149ef0 0000000010404a10 0000003f0804ff17
 0000000039e1d298:  0000000000000000 000000000eb010d4 000000000000003a 00000000104e1218
 0000000039e1d278:  0000000010448e80 00000000000f4000 00000000000000d2 0000000039e1d100
 0000000039e1d258:  000000001015fae0 000000001015fadc 0000000000000000 0000000000000000
 0000000039e1d238:  0000000000000000 0000000000000000 0000000000000000 0000000000000000
 0000000039e1d218:  0000000000000c80 0000000000000000 0000000000000c80 0000000000000c80
 0000000039e1d1f8:  0000000000000003 000000001013f30c 00000000f000028c 0000000000000802
 0000000039e1d1d8:  4014000000000000 401c000000000000 0000000200000000 0000000400000004
 0000000039e1d1b8: 0000000000000 0000000000000000 000000001328b000 0000000000000002
 0000000039e1d198:  0000000013057a80 0000000000000002 ffffffffffffffff ffffffffffffffff
 0000000039e1d178:  ffffffffffffffff 00000000101a2440 ffffffffffffffff ffffffffffffffff
 0000000039e1d158:  ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
 0000000039e1d138:  4000c678c1c43248 00000000000003e8 00000064aaaaaaab 0000000000000000
 0000000039e1d118:  0000000000000000 0000000000000000 0000000000000000 0c3ff80000000000
 0000000039e1d0f8:  000000000000e680 0000000039e1d000 0000000039e1cff0 0000003f0804ff0f
 0000000039e1d0d8:  0000000010448e80 000000008e0ca0c0 0000000000030104 0000000000001000
 0000000039e1d0b8:  000000000000003f 00000000fffffffa 0000003f0804ff0f 0000000000000000
 0000000039e1d098:  000000000800000f 0000000039e1c3f0 000000001042c820 000000003fa38af8
 0000000039e1d078:  000000000800 0000000039e1c610 000000008f7553c0 0000000039e1ca10
 0000000039e1d058:  0000000000030104 0000000000000000 000000003fa38af8 000000003fa38af8
 0000000039e1d038:  0000000000000000 0000000000030104 0000000010448e80 0000000010448e80
 0000000039e1d018:  0000000000000000 000000001015facc 00000000104fc0a0 000000ff0804ff0e
 0000000039e1cff8:  0000000010448e80 00000000101388b0 0000000000000000 8000000000000000
 0000000039e1cfd8:  0000000010448e80 0000000039e1cb80 ffffffff00000000 0000000010448e80
 0000000039e1cfb8:  0000000018ed5bd8 000000001010f2f8 00107fc062c693c0 0000000000000002
 0000000039e1cf98:  0000000000000000 0000000010448e80 0000000039e1c980 0000000000000000
 0000000039e1cf78:  0000000000000002 000000001018b2e8 0000000000000000 0000000010448e80
 0000000039e1cf58:  0000000000000001 0000000000000029 0000000010448e80 0000000000000000
 0000000039e1cf38:  00000000000f 0000000010448e80 00000000104f5b98 0000000000000000
 0000000039e1cf18:  00000000104f5b98 0000000010448e80 000000000800000e 0000000039e1ce80
 0000000039e1cef8:  000000008e56d000 000000001013a184 0000000000000005 000000008e56d000
 0000000039e1ced8:  0000000010448e80 0000000000000006 0000000010448e80 00000000000179c9
 0000000039e1ceb8:  0000000000000006 0000000000000000 0000000010448e80 000000008fffc940
 0000000039e1ce98:  0000000000030104 0000000000001000 0000000000000002 000000008e7dc690
 0000000039e1ce78:  0000000000000001 000000001018d0cc 0000000010448e80 0000000039e1c700
 0000000039e1ce58:  0000000000000002 0000000000595054 ffffffff80000000 0000000000000000
 0000000039e1ce38:  0000000000000000 0000000010149ef0 0000000000000040 0000000000000006
 0000000039e1ce18:  0000000039e1cd00 0000000000000000 0000000000002009 0000000000000000
 0000000039e1cdf8:  000000000002 00000000101dc7a0 0000000000000000 0000000039e1c700
 0000000039e1cdd8:  000000001023d244 000000001023d240 0000000000000000 0000000000000000
 0000000039e1cdb8:  0000000000000000 0000000010448e80 0000000000001000 000000008fffc940
 0000000039e1cd98:  0000000000030104 0000000010448e80 0000000000000c80 0000000000000c80
 0000000039e1cd78:  0000000000000003 000000001018d1c8 00000000f000028c 0000000000000802
 0000000039e1cd58:  4014000000000000 401c000000000000 0000000600000000 0000000000000000
 0000000039e1cd38:  0000000039e1ca10 0000000020132180 0000000000000000 0000000039e1ca10
 0000000039e1cd18:  0000000020132180 0000000000000001 ffffffffffffffff 0000000039e1cc80
 0000000039e1ccf8:  ffffffffffffffff 00000000101dc8a4 ffffffffffffffff ffffffffffffffff
 0000000039e1ccd8:  ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
 0000000039e1ccb8:  4000c678c1c43240000000000003e8 000000008fff9d40 0000000010448e80
 0000000039e1cc98:  0000000010448e80 0000000000000000 0000000000000000 0000000010448e80
 0000000039e1cc78:  000000000000e680 0000000010163fec 0000000039e1caf0 0000000000000005
 0000000039e1cc58:  0000000000000000 0000000039e1ca10 0000000020132180 0000000039e1ca10
 0000000039e1cc38:  0000000000000008 0000000010448e80 000000003fa38af8 0000000000000000
 0000000039e1cc18:  0000000000000135 000000008f755428 0000000000000000 0000000000000000
 0000000039e1cbf8:  0000000000000001 00000000101ddb48 0000000000000000 0000000020132180
 0000000039e1cbd8:  000000008e59b000 0000000010448e80 000000003fa38af8 0000000000000008
 0000000039e1cbb8:  0000000000000001 0000000000000135 0000000000000000 0000000000000135
 0000000039e1cb98:  0000000000000002 0000000010448e80 00000000000085c4 00000000400d4b80
 0000000039e1cb78:  00000000faf09c98 0000101ec2d0 0000000000000000 0000000000000001
 0000000039e1cb58:  000000003ccbf000 0000000010448e80 000000003372c448 0000000010448e80
 0000000039e1cb38:  0000000039e1ca10 0000000020132180 000000003fa38af8 0000000000000008
 0000000039e1cb18:  0000000000000001 0000000000000135 0000000020515440 0000000039e1ca00
 0000000039e1caf8:  ffffffffffffffff 00000000101ddc64 ffffffffffffffff ffffffffffffffff
 0000000039e1cad8:  ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
 0000000039e1cab8:  0000000014b839c0 0000000010448e80 0000000013327180 0000000010448e80
 0000000039e1ca98:  0000000010448e80 0000000000000000 0000000000002171 0c3ff80000000000
 0000000039e1ca78:  0000000010963c80 00000000101e367c 0000000010448e80 00000000104f58f8
 0000000039e1ca58:  0000000000000002 0000000010448e80 0000000020132180 0000000010448e80
 0000000039e1ca38:  0000000000000000 00000fa38af8 00000000132cd400 0000000000000006
 0000000039e1ca18:  0000000000000480 000000003fa38af8 0000000020515440 0000000039e1c910
 0000000039e1c9f8:  0000000000000001 00000000101ddd78 0000000000000000 0000000000000000
 0000000039e1c9d8:  0000000010448e80 0000000010448e80 0000000000001000 0000000011596930
 0000000039e1c9b8:  0000000000000000 0000000000000000 000000003fa38af8 0000000000000001
 0000000039e1c998:  0000000010448e80 000000008e56d000 0000000020132180 00000000251ccdb8
 0000000039e1c978:  0000000000000000 00000000101b4820 0000000048019c78 0000000020515440
 0000000039e1c958:  0000000048019c78 0000000010448e80 0000000010448e80 0000000000000008
 0000000039e1c938:  000000002eafda80 0000000000000001 000000003fa38af8 0000000010448e80
 0000000039e1c918:  000000003fa38b58 0000000000000001 000000008f755428 0000000000000010
 0000000039e1c8f8:  0000000000000000 000000001e50 0000000000000008 0000000000000001
 0000000039e1c8d8:  0000000000000000 0000000000000000 0000000000000135 000000008f755428
 0000000039e1c8b8:  000000002eafda80 0000000039e1c898 0000000039e1c898 0000000039e1c898
 0000000039e1c898:  0000000039e1c898 0000000000000001 ffffffffffffffff 0000000039e1c800
 0000000039e1c878:  ffffffffffffffff 0000000010168b88 ffffffffffffffff 0000000010448e80
 0000000039e1c858:  0000000039e1c690 0000000010448e80 0000000011596930 0000000000000135
 0000000039e1c838:  0000000010448e80 000000003fa38bf0 000000002c576d00 000000004043b40c
 0000000039e1c818:  000000002c576d00 000000004043b40c 0000000000000000 000000008281b8c0
 0000000039e1c7f8:  000000000000a000 00000000101603b4 0000000039e1c6f0 0000000000000000
 0000000039e1c7d8:  0000000039e1c290 0000000010448e80 0000000039e1c590 0000000039e1c5a0
 0000000039e1c7b8:  000000001050ec40 000000000000000000000409c36a0 0000000010448e80
 0000000039e1c798:  0000000000000101 0000000000000000 0000000000000001 000000008f7553c0
 0000000039e1c778:  0000000000000000 0000000000000001 0000000010448e80 0000000039e1c590
 0000000039e1c758:  0000000039e1c3f0 0000000010448e80 00000000409c11f8 00000000409c11f8
 0000000039e1c738:  0000000000001f00 00000000409c11f8 000000000054a0b0 00000000faf0b120
 0000000039e1c718:  0000000000000003 0000000000000001 000000000000001c 000000ff0804ff0f
 0000000039e1c6f8:  0000000010448e80 0000000010160c24 0000000000200200 0000000039e1c500
 0000000039e1c6d8:  0000000010448e80 0000000010448e80 000000003372c100 00000000104e1218
 0000000039e1c6b8:  0000000010448e80 00000000000f4000 0000000000000014 0000000000000001
 0000000039e1c698:  000000003fa38af8 0000000000000000 000000000018d0c0 0000000000000000
 0000000039e1c678:  0000000000000000 000000001023c8ec 000010448e80 0000000039e1c390
 0000000039e1c658:  000000008f7553f8 000000008f7553f8 0000000010448e80 000000000054a0b0
 0000000039e1c638:  00000000409c399c 00000000409c19f8 0000000039e1c290 000000000054b1e5
 0000000039e1c618:  0000000000000ecb 0000000000001135 000000000800000f 0000000039e1c500
 0000000039e1c5f8:  000000001328f480 0000000010160cd0 0000000010448e80 0000000010448e80
 0000000039e1c5d8:  000000001660e000 00000000faf03370 0000000000000801 00000000409c36a0
 0000000039e1c5b8:  00000000000001b6 0000000000000004 0000000010448e80 0000000039e1c390
 0000000039e1c598:  0000000000002000 000000000054a0b0 0000000000000019 000000004959d000

Kernel addresses on the stack:
 [<00000000102f1774>]  [<000000001013f30c>]  [<00000000101a2440>]  [<00000000101388b0>]
 [<000000001018b2e8>]  [<000000001013a184>]  [<000000001018d0cc>]  [<00000000101dc7a0>]
 [<000000001018d1c8>]  [00000101dc8a4>]  [<0000000010163fec>]  [<00000000101ddb48>]
 [<00000000101ec2d0>]  [<00000000101ddc64>]  [<00000000101e367c>]  [<00000000101ddd78>]
 [<00000000101b4820>]  [<00000000101ace50>]  [<0000000010168b88>]  [<00000000101603b4>]
 [<0000000010160c24>]  [<000000001023c8ec>]  [<0000000010160cd0>]  [<0000000010188bac>]
 [<0000000010149ef0>]  [<0000000010188ce8>]  [<000000001010f1d8>]  [<0000000010188ffc>]
 [<000000001010f2f8>]  [<000010109e4c>]  [<0000000010109074>]

Kernel Fault: Code=15 regs=0000000039e1d000 (Addr=0000003f0804ff17)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001110 Not tainted
r00-03  0000000000000000 00000000104fc0a0 000000001015facc 0000000000000000
r04-07  0000000010448e80 0000000010448e80 0000000000030104 0000000000000000
r08-11  000000003fa38af8 000000003fa38af8 0000000000000000 0000000000030104
r12-15  0000000039e1ca10 000000008f7553c0 0000000039e1c610 0000000000000800
r16-19  000000003fa38af8 000000001042c820 0000000039e1c3f0 000000000800000f
r20-23  0000000000000000 0000003f0804ff0f 00000000fffffffa 000000000000003f
r24-27  0000000000001000 0000000000030104 000000008e0ca0c0 0000000010448e80
r28-31  0000003f0804ff0f 0000000039e1cff0 0000000039e1d000 000000000000e680
sr0-3   0000000000000c80 0000000000000c80 0000000000000000 0000000000000c80
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000001015fadc 000000001015fae0
 IIR: 0eb010d4    ISR: 0000000000000000  IOR: 0000003f0804ff17
 CPU:        0   CR30: 0000000039e1c000 CR31: 0000000010418000
 ORIG_R28: 00000000000f4<2><2>

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=pim

PROCESSOR PIM INFORMATION



-----------------  Processor 0 HPMC Information - PDC Version: 40.50  ------

Timestamp =    Mon Feb  23 20:41:58 GMT 2004    (20:04:02:23:20:41:58)

HPMC Chassis Codes

       Chassis Code        Extension
       ------------        ---------
       0x0000082000ff6242  0x0000000000000000
       0x1800082011006302  0xcb80800000000000
       0x0000087000ff6292  0x0000000000000000
       0x6000082070006062  0x0000000001100170
       0x7000082070006082  0x0000000000a41c00
       0x2000082374ff6b83  0x0000ff000001ff74
       0x2000082374ff6b83  0x0000ff000001ff74
       0x2000082274ff6bc3  0x0000ff000001ff74
       0x2000082274ff6bc3  0x0000ff000001ff74
       0x0000080080006310  0x0000000000000001
       0x000008008000631f  0x0000000000000000
       0x0000082000ff6442  0x0000000000000000
       0x0000082000ff6402  0x0000000000000000
       0x0000080080006300  0x0000000000000001
       0x7000082382006343  0x0000000000070200
       0x7000082382026343  0x0000000000070200
       0x7000082382046343  0x0000000000070200
       0x7000082382066343  0x0000000000070200
       0x0000080089006200  0x0000000000000000
       0x0000080086006200  0x0000000000000000
       0x000008008000630f  0x0000000000000000


General Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000020000  0000000040000000
04-07  0000000000010000  0000000000000002  00000000069db9c0  0000000000000000
08-11  0000000000000000  0000000000000001  000000003fff0000  0000000000000000
12-15  00000000000000f2  00000000000000fa  00000000000000f0  00000000000000ff
16-19  000000f0f00003dc  000000f0f000028c  000000f0f0002aa4  0000000000000001
20-23  0000000000000001  0000000000000007  000000000000ff00  fffffff0f0430f78
24-27  000000003fff0000  0000000000020000  0000000000000000  0000000000065e34
28-31  fffffff0f0408000  0000000000001490  000000003fff0040  000000f0f0044cb0


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  000000000000003f
12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19  0000000968a477e7  0000000000000000  000000000002005c  000000006bda3f81
20-23  00000000142400ff  00000000fc3f0000  000000ff00008f08  0000000000000000
24-27  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
28-31  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000


IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x0000000000020060
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00105004
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0xfffffffffffa0000


Floating Point Registers 0 - 31
00-03  ffd00fbfd72afbff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
04-07  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
08-11  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
12-15  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
16-19  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
20-23  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
24-27  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
28-31  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  fffffaffffffffff


Check Summary                = 0xcb80800000000000
Available Memory             = 0x0000000080000000
CPU Diagnose Register 2      = 0x0300000000000204
CPU Status Register 0        = 0x1440c20000000000
CPU Status Register 1        = 0x8000000000000000
SADD LOG                     = 0x301049809b858340
Read Short LOG               = 0xc1af00f0f0408188



-----------------  Processor 0 LPMC Information ------------------

Check Type                   = 0x00000000
IC Parity Info               = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000



-----------------  Processor 0 TOC Information -------------------

General Registers 0 - 31
00-03  0000000000000000  0000000010000000  000000001010dc08  0000000010448e80
04-07  0000000039e1d000  000000000000000f  000000001037af74  0000003f0804ff17
08-11  000000003fa38af8  000000003fa38af8  0000000000000000  0000000000030104
12-15  0000000039e1ca10  000000008f7553c0  0000000039e1c610  0000000000000800
16-19  0000000039e1d000  000000001042c820  0000000039e1c3f0  000000001011139c
20-23  00000000f0043c90  0000000010000000  0000000000000001  0000000000000000
24-27  00000000004ded40  0000000000000001  00000000004e1140  0000000010448e80
28-31  fffffffffffffffd  00000000004df4b8  0000000039e1d5c0  0300000000802004


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000032  0000000000000000  00000000000000c0  000000000000003f
12-15  0000000000000000  0000000000000000  0000000000108000  0000000000000000
16-19  00008cdb3f548e7b  0000000000000000  000000001010dc0c  00000000ebffba7d
20-23  0000000000000c80  0000000000000000  00000000082c000f  cc00000000000000
24-27  00000000003de000  00000000115c6000  ffffffffffffffff  00000000400d4b80
28-31  ffffffffffffffff  ffffffffffffffff  0000000039e1c000  0000000010418000

Space Registers 0 - 7
00-03  00000c80          00000c80          00000000          00000c80
04-07  00000000          00000000          00000000          00000000

IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x000000001010dc08
CPU State                    = 0x9e000001



-----------------  Processor 1 HPMC Information - PDC Version: 40.50  ------

Timestamp =    Mon Feb  23 20:41:58 GMT 2004    (20:04:02:23:20:41:58)

HPMC Chassis Codes

       Chassis Code        Extension
       ------------        ---------
       0x0000082000ff6242  0x0000000000000000
       0x1800082011016322  0xc381800000000000
       0x0000082000ff6412  0x0000000000000000
       0x0000082000ff6402  0x0000000000000000


General Registers 0 - 31
00-03  0000000000000000  00000009689ea107  0000000000000000  00000000000000f7
04-07  0000000000000875  fffffff0f040a000  0000000000000032  00000000000000f7
08-11  0000000000000000  fffffff0f0400000  00000000000000f6  00000000000000fe
12-15  00000000000000f2  0000000000000001  00000000000000f0  00000000000000ff
16-19  000000f0f00008e8  fffffff0f040c000  0000000000000000  0000000000000000
20-23  0000000000000001  00000000000000fa  fffffff0f0400000  0000000000000000
24-27  00000000000000f9  0000000000000000  000018001001c400  000000f0f015c540
28-31  0000000000000000  000000f0f040a908  000000f0f040a708  3031323334353637


Control Registers 0 - 31
00-03  000000007fffffff  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0007ffff0005ffff  0007ffff0005ffff  0000000000000000  0000000000000017
12-15  0007ffff0005ffff  0007ffff0004ffff  000000f0f0006800  0000000000000000
16-19  0000000968a46560  00000000ffffefff  00000000000006ec  00000000020008a1
20-23  000000009207c3c1  000000000280a890  000000ff0800ff08  0000000000000000
24-27  fffffffffffdffff  ffffffffffffffff  ffffffffffffffff  ffffffffffdfffff
28-31  fffffffffffdffff  ffffffffffffffff  ffffffffffffffff  dffffeffffffffff

Space Registers 0 - 7
00-03  7ffefffb          bcffffef          ffffffff          7ebffff7
04-07  ffffefff          ffffffff          ffffffff          3ff7ffff


IIA Space (back entry)       = 0x00000000ffffefff
IIA Offset (back entry)      = 0x00000000000006f0
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030000d
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0xfffffffffffa2000
System Requestor Address     = 0xfffffffffffa0000


Floating Point Registers 0 - 31
00-03  fed28bbffbff7fdf  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
04-07  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
08-11  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
12-15  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  fffff7ffffffffff
16-19  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
20-23  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
24-27  ffffffffffffffff  fffffeffffffffff  ffffffffffffffff  f7ffffffffffffff
28-31  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff


Check Summary                = 0xc381800000000000
Available Memory             = 0x0000000080000000
CPU Diagnose Register 2      = 0x0300010080002000
CPU Status Register 0        = 0x3040000000000000
CPU Status Register 1        = 0x8000000000000000
SADD LOG                     = 0x4800000000000000
Read Short LOG               = 0xc1af00f0f0400000



-----------------  Processor 1 LPMC Information ------------------

Check Type                   = 0x00000000
IC Parity Info               = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000



-----------------  Processor 1 TOC Information -------------------

General Registers 0 - 31
00-03  0000000000000000  00008cdb4e5b340d  0000000000000000  00000000000000f7
04-07  0000000000001277  fffffff0f040a000  0000000000000032  00000000000000f7
08-11  0000000000000000  fffffff0f0400000  00000000000000f6  00000000000000fe
12-15  00000000000000f2  0000000000000001  00000000000000f0  00000000000000ff
16-19  000000f0f00000c4  fffffff0f040c000  0000000000000000  0000000000000000
20-23  0000000000000001  00000000000000fa  fffffff0f0400000  0000000000000000
24-27  00000000000000f1  0000000000000000  000018001001c400  000000f0f015c540
28-31  0000000000000000  000000f0f040a908  000000f0f040a708  3031323334353637


Control Registers 0 - 31
00-03  000000007fffffff  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0007ffff0007ffff  0007ffff0007ffff  0000000000000000  0000000000000017
12-15  0007ffff0007ffff  0007ffff0006ffff  000000f0f0006800  0000000000000000
16-19  00008cdb4e60a6f1  00000000ffffefff  00000000000006f0  0000000002e008a2
20-23  00000000ae27c3c1  c000000000000000  000000ff0800ff08  0000000000000000
24-27  7fffffffffffffff  7fffffffffffffff  ffffffffffffffff  ffffffffffdfffff
28-31  7fffffffffffffff  fffffffffeffffff  ffffffffffffffff  ffffffffffffffff

Space Registers 0 - 7
00-03  7ffefffb          beffffef          ffffffff          7ebfffb5
04-07  ffffefff          ffffffff          ffffffff          3ff7ffff

IIA Space (back entry)       = 0x00000000ffffefff
IIA Offset (back entry)      = 0x00000000000006f4
CPU State                    = 0x9e000001


--------------  Memory Error Log Information  --------------

Bus 0 Log Information

Timestamp =    Mon Feb  23 20:41:59 GMT 2004    (20:04:02:23:20:41:59)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
  X       X      ERR_MEM           X   X     X

Bus Requestor Address      = 0xfffffffffffa0000
Bus Target Address         = 0x000000003fff0000
Bus Responder Address      = 0x0000000000000000

Error Status Reg           = 0x0000000001100170
Runway Control Reg         = 0x0000140000003800
Runway Address Reg         = 0xf8af0c003fff0000
Runway Data High Reg       = 0x84589948ddf6cf4c
Runway Data Low Reg        = 0xc22c4ca46efb67a6
Memory Address Reg         = 0x0000000000fffc00
Memory Address Corr Reg    = 0x0000000000fffc00
Memory Syndrome Reg        = 0x7700230000007700
Memory Syndrome Corr Reg   = 0x7700230000007700



 Address/Control Parity Error Registers

   Address/Control Parity Error Bit (mem_addr_par_stat) Not Set



------------  I/O Module Error Log Information  ------------

Summary of IO subsystem log entries
-----------------------------------
                        Phys Loc             Vendor  Device   Severity
Description             (hex)                 Id      Id      CORR UNC FE  CW
-----------             -----                ------  ------   ----------------
System Bus Adapter RP  0x000000ffff04ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000000ffff01ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000000ffff02ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000000ffff03ff83   0x103c  0x1051              X


Detail display of IO subsystem log entries
------------------------------------------

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Mon Feb  23 20:41:59 GMT 2004    (20:04:02:23:20:41:59)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000000ffff04ff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Mon Feb  23 20:41:59 GMT 2004    (20:04:02:23:20:41:59)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000000ffff01ff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Mon Feb  23 20:41:59 GMT 2004    (20:04:02:23:20:41:59)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000000ffff02ff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Mon Feb  23 20:41:59 GMT 2004    (20:04:02:23:20:41:59)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000000ffff03ff83


--C7zPtVaVf+AK4Oqc--
