Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C3DAE482D
	for <parisc-linux@lists.parisc-linux.org>; Sat, 10 May 2003 15:39:01 -0600 (MDT)
Message-Id: <200305102138.h4ALcwEd011708@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Yet another '__canonicalize_funcptr_for_compare'
To: joel.soete@tiscali.be (Joel Soete)
Date: Sat, 10 May 2003 17:38:58 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@parisc-linux.org, randolph@tausq.org,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3EBD7022.6000201@tiscali.be> from "Joel Soete" at May 10, 2003 09:33:22 pm
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

> Sorry I forget to mentioned that I compiling a 32-bits hppa kernel. Does 
> it make diffrence?

Yes.  Function pointer canonicalization is only done on the 32-bit
port.  This is not to say that there aren't issues with 64-bit kernels
in this area, particularly if you use loadable modules.  The 64-bit
code assumes that there is an official procedure descriptor (OPD)
for each function.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
