Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90BA1482E
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Jun 2002 10:42:48 -0600 (MDT)
Message-Id: <200206071623.g57GNMh0009786@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] strange message with insmod
To: carlos@baldric.uwo.ca (Carlos O'Donell Jr.)
Date: Fri, 7 Jun 2002 12:23:21 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bruno_vidal@hpfrcu03.france.hp.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020607073658.A10393@systemhalted> from "Carlos O'Donell Jr." at Jun 7, 2002 07:36:58 am
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

> GCC 3.2 is the only branch that has dwarf2 support for HPPA?
> You'll have to live with stabs.

That's not quite true.  You can generate dwarf2 debug information on
previous versions.  3.2 is the first version with working support
for eh frame information.  By working, I mean that the C++ exception
support appears to work for normal exceptions.  I don't really know
if gdb is using this information.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
