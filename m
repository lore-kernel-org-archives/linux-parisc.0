Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2BBAF482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  8 May 2002 04:19:11 -0600 (MDT)
Date: Wed, 8 May 2002 06:19:05 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20020508061905.B21381@systemhalted>
References: <1020756305.3cd7815151303@webmail.tiscalinet.be> <1020787573.3cd7fb75053c7@webmail.tiscalinet.be> <20020507174619.GO32033@tausq.org> <1020837586.3cd8bed27dc62@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1020837586.3cd8bed27dc62@webmail.tiscalinet.be>; from joel.soete@freebel.net on Wed, May 08, 2002 at 07:59:46AM +0200
Subject: [parisc-linux] kdb recipe
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

Joel,

The following recipe might help:

---
mkdir kdb-parisc
cd kdb-parisc
export CVSROOT=:pserver:anonymous@cvs.parisc-linux.org:/var/cvs
cvs login
cvs co linux
cvs co palo
mkdir kdb
cd kdb
wget ftp://oss.sgi.com/projects/kdb/download/v2.1/kdb-v2.1-2.4.18-common-3.bz2
bunzip2 kdb-v2.1-2.4.18-common-3.bz2
wget http://www.baldric.uwo.ca/~carlos/kdb-parisc/kdb-v2.1-2.4.18-pa23-parisc.bz2
bunzip2 kdb-v2.1-2.4.18-pa23-parisc.bz2
cd ../linux
patch -p1 < ../kdb/kdb-v2.1-2.4.18-common-3
patch -p1 < ../kdb/kdb-v2.1-2.4.18-pa23-parisc
make oldconfig (Answer CPU and KDB questions)
(You can alternatively configure other things)
make dep
make palo
---

I won't be maintaining kdb patches outside the CVS try anymore, 
so the second wget will soon become a cvs checkout.

c.
