Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 026934841
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Nov 2003 12:48:05 -0700 (MST)
Date: Sat, 8 Nov 2003 12:48:04 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Matthew Wilcox <willy@debian.org>,
	Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
Message-ID: <20031108194804.GA28929@colo.lackof.org>
References: <20031106222958.GJ26869@parcelfarce.linux.theplanet.co.uk> <3F969FFE000092BD@ocpmta2.freegates.net> <20031108015946.GC19436@colo.lackof.org> <3FACCC88.4010404@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FACCC88.4010404@tiscali.be>
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

On Sat, Nov 08, 2003 at 10:59:20AM +0000, Joel Soete wrote:
> IIRC include/asm-parisc/uaccess.h

get/put user stuff looks the same to me in both 2.4/2.6 cvs.
I'm likely to forget forward porting 2.4 changes to 2.6 but I thought
I got that in the last round. If someone trolls the parisc-linux-cvs
archive and compares my commits for the past 2-3 monthes...

thanks,
grant
