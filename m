From: Roland McGrath <roland@redhat.com>
Subject: [parisc-linux] Re: FATAL: kernel too old
Date: Wed, 4 Dec 2002 14:17:21 -0800
Message-ID: <200212042217.gB4MHLs32733__4951.22396755523$1416621994$gmane$org@magilla.sf.frob.com>
References: <200212042213.gB4MD83F000234@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: carlos@baldric.uwo.ca (Carlos O'Donell),
	libc-alpha@sources.redhat.com, debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: John David Anglin's message of  Wednesday, 4 December 2002 17:13:07 -0500 <200212042213.gB4MD83F000234@hiauly1.hia.nrc.ca>
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
