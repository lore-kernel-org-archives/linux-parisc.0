Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gateway.sf.frob.com (adsl-64-163-212-31.dsl.snfc21.pacbell.net [64.163.212.31])
	by dsl2.external.hp.com (Postfix) with ESMTP id C7FD3483C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Dec 2002 15:17:28 -0700 (MST)
Date: Wed, 4 Dec 2002 14:17:21 -0800
Message-Id: <200212042217.gB4MHLs32733@magilla.sf.frob.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: Roland McGrath <roland@redhat.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca (Carlos O'Donell),
	libc-alpha@sources.redhat.com, debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: John David Anglin's message of  Wednesday, 4 December 2002 17:13:07 -0500 <200212042213.gB4MD83F000234@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: FATAL: kernel too old
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

Check that _dl_osversion (_rtld_global._dl_osversion) is getting initialized.
