Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 128DF4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 21:12:20 -0700 (MST)
Date: Wed, 15 Jan 2003 20:12:18 -0800 (PST)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: jsoe0708@tiscali.be, Randolph Chung <tausq@debian.org>,
	"" <parisc-linux@lists.parisc-linux.org>,
	"" <debian-hppa@lists.debian.org>
Subject: Re: [parisc-linux] new gcc-default for hppa
In-Reply-To: <20030116010620.GB8543@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.50.0301152007120.1998-100000@ssh.apptechsys.com>
References: <3DED9A6600005A12@ocpmta3.freegates.net> <3E1AA52C0000167E@ocpmta1.freegates.net>
 <20030116010620.GB8543@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 15 Jan 2003, Grant Grundler wrote:

> Have you tried sending UDP (not TCP) traffic?
> (Not sure how to do that...suggestions?)
> 
netcat: cat /something | nc -u host port

-- 
You were s'posed to laugh!
