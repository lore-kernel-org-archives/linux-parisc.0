Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0D5F482C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Dec 2001 08:59:01 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 8D401B00C; Wed,  5 Dec 2001 15:59:19 +0000 (GMT)
Date: Wed, 5 Dec 2001 15:59:19 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Colin Watson <cjwatson@debian.org>
Cc: debian-hppa@lists.debian.org, parisc-linux@lists.parisc-linux.org
Message-ID: <20011205155919.E7051@linuxcare.com>
References: <20011204134445.GA9231@riva.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011204134445.GA9231@riva.ucam.org>; from cjwatson@debian.org on Tue, Dec 04, 2001 at 01:44:45PM +0000
Subject: [parisc-linux] Re: groff build on hppa
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

On Tue, Dec 04, 2001 at 01:44:45PM +0000, Colin Watson wrote:
> Hi,
> 
> Does anyone know what's up with the groff build on hppa? gcc has
> segfaulted on both 1.17.2-10 and 1.17.2-11, and I can reproduce this on
> paer. The function it dies on hasn't changed since earlier releases
> where hppa didn't have a problem.
> 
> Is there any workaround? I'd rather not have to change groff at this
> stage if I can avoid it.

Builds for me with -O1 rather than -O2 in debian/rules, if that is
any help.

Richard
