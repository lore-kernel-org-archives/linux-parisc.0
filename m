Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08435482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 27 Aug 2002 09:56:08 -0600 (MDT)
Message-Id: <200208271531.g7RFV2qR017083@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Breaking PARISC ABI - Testing procedures?
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Tue, 27 Aug 2002 11:31:02 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020826194135.GC632@systemhalted> from "Carlos O'Donell" at Aug 26, 2002 03:41:35 pm
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

> 3- sizeof(long double) is incorrect in gcc and glibc (?)

This also needs to be fixed under 64-bit hpux.  Need to determine
the calling convention for long doubles.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
