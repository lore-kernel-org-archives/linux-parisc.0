Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 14496482A
	for <parisc-linux@parisc-linux.org>; Mon,  4 Feb 2002 10:04:31 -0700 (MST)
Message-Id: <200202041704.g14H4RlP018142@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] hppa-linux gcc-3.0.3: -O2 optimization does not handle fp args correctly
To: randolph@tausq.org
Date: Mon, 4 Feb 2002 12:04:27 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20020204163842.GF624@tausq.org> from "Randolph Chung" at Feb 4, 2002 08:38:42 am
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

> legolas[22:24] ~% gcc -O2 -o logtest logtest.c -lm
> legolas[22:24] ~% ./logtest
> float: -1.002099

This looks ok with my new build of 3.1:

dave@gsyprf11:~/gcc_test$ gcc -O2 -o logtest logtest.c -lm
dave@gsyprf11:~/gcc_test$ ./logtest
float: nan
dave@gsyprf11:~/gcc_test$ gcc -O1 -o logtest logtest.c -lm
dave@gsyprf11:~/gcc_test$ ./logtest
float: nan

The problem that needs fixing in the linker is passing floating
arguments to indirect functions.  The above program doesn't involve
an indirect call.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
