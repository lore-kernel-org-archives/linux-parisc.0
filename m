Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 12256482A
	for <parisc-linux@parisc-linux.org>; Sat,  1 Jun 2002 18:45:30 -0600 (MDT)
Message-Id: <200206020045.g520jQ6K009698@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-cvs problem
To: joel.soete@freebel.net (Joel Soete)
Date: Sat, 1 Jun 2002 20:45:26 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <3CF91C48.5000008@freebel.net> from "Joel Soete" at Jun 1, 2002 07:11:04 pm
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

> I will have a detailed look but as newbee in gcc stuff it will take a time.

If you manually execute the failing compilation command changing '-c'
to '-E', this will generate the cpp processed output for the compilation
source file.  Inspection of this output should allow you to see exactly
which include files have been loaded and the result of all macro expansions.

There may be a problem with the include hack or possibly an unfixed
version of the pthread.h header is being loaded.  Gcc puts fixed include
directories in ${prefix}/lib/${target}/${gcc_version}/include.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
