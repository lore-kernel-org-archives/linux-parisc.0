Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 81A904829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  7 Jun 2003 10:14:52 -0600 (MDT)
Message-Id: <200306071614.h57GEpnf006148@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Compile error in 2.4.x and 2.5.x
To: jbglaw@lug-owl.de (Jan-Benedict Glaw)
Date: Sat, 7 Jun 2003 12:14:50 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030607154205.GG30457@lug-owl.de> from "Jan-Benedict Glaw" at Jun 7, 2003 05:42:05 pm
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

> jbglaw@b132l-1:/usr/src/packages/full_cvs/linux-build-2.4$ as -v
> GNU assembler version 2.14.90.0.4 (hppa-linux) using BFD version 2.14.90.0.=
> 4 20030523 Debian GNU/Linux

Try updating binutils and remove whitespace from the argument of the
PA macro.  The assembler is now much more strict about the presence of
whitespace in the operands field.  There was a recent version that didn't
allow any whitespace.  The current cvs version allows whitespace after
a comma.  These changes were made to improve the detection of labels.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
