Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id B18DD482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jan 2002 12:58:19 -0700 (MST)
Message-Id: <200201291958.g0TJwEAI006175@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] octave2.1_2.1.35-6_hppa
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Tue, 29 Jan 2002 14:58:14 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Daniel.Heiserer@bmw.de, parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org
In-Reply-To: <20020129185916.2AE58482A@dsl2.external.hp.com> from "Grant Grundler" at Jan 29, 2002 11:59:16 am
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

> > Honestly I have no idea what the difference between ELF-64 and PA-RISC-2
> > is. Are both 64 bit?

PA-RISC-2 describes the machine architecture.  ELF-64 describes one of the
object file format that is use on PA-RISC-2 machines.  The SOM object
file format is used for 32-bit objects.  As Grant noted, SOM objects
support architectures from PA-RISC 1.0 onward.  However, a 2.0 object
will not work on a 1.1 machine.

The object file format zoo is even worse than described above.  The debug
formats used by gcc differ from those used by HP compilers.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
