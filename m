Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0B67B4837
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 09:45:50 -0700 (MST)
Message-Id: <200303181645.h2IGjlST008612@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] squid pb with glibc-2.3.1 and pthread (pb reproduced now)
To: jsoe0708@tiscali.be (Joel Soete)
Date: Tue, 18 Mar 2003 11:45:46 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3E68A39600002063@ocpmta7.freegates.net> from "Joel Soete" at Mar 18, 2003 05:25:28 pm
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

> Now recompile it with pthread lib (useless for this test case never the less
> here usefull):
> 
> gcc -o foo -l pthread foo.c
> 
> run it ./foo and now it loop :)

The pthread library has been broken for some time due to an error in
the locking code.  This might be fixed now.  The fix was part of
Carlos's latest pthread patch.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
