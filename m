Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id B3DC44863
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Feb 2002 11:03:34 -0700 (MST)
Message-Id: <200202181803.g1II3URO012248@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: hppa-linux gcc-3.0.3:
To: jso@europay.com (=?iso-8859-1?Q?Jo=EBl_Soete?=)
Date: Mon, 18 Feb 2002 13:03:29 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, "jso"@hiauly1.hia.nrc.ca,
	<jso@europay.com>, parisc-linux@lists.parisc-linux.org
In-Reply-To: <OFB6528EDF.C6603F22-ONC1256B64.00615768@com> from "=?iso-8859-1?Q?Jo=EBl_Soete?=" at Feb 18, 2002 06:53:49 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> PS: I would try natively (on my palinux box directly) with MACH=hppa-linux
> i.e.: ~/source/binutils/configure --host=hppa-linux ... ?

For binutils, I just use from my build directory:

../src/configure --prefix=/where_to_install --host=hppa-linux --disable-nls
make
make -k check
make install

Set CFLAGS if you want.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
