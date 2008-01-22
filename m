From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: some gij-4.3/2.6.24-rc8 crashes
Date: Tue, 22 Jan 2008 12:35:33 -0500 (EST)
Message-ID: <200801221735.m0MHZeZ2009017@hiauly1.hia.nrc.ca>
References: <119aab440801220740g77918c01r5c768f688f8170ca@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440801220740g77918c01r5c768f688f8170ca@mail.gmail.com> from "Carlos O'Donell" at Jan 22, 2008 10:40:36 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> This isn't fatal because we are writing into a userspace address, it
> *is* fatal to the userspace process.
> 
> Did you run out of memory?

Don't really have a solution.  I used to see this all the time but
recent kernels have been much better in handling out of memory situations.
There is a little program in the gas testsuite that allocates 1 GB
of memory and it used to crash my c3k all the time.

The jc1 compiler is something of a memory hog.  I've stopped testing
java on my c200 because it takes forever to compile the library.
Although the compiler adapts somewhat to the memory available in
a machine, I have the sense that the current optimizations run best
on machines with 1 GB or more of memory for data.  Indeed, I think
the relative performance of the 64-bit compiler is better than it
used to be because of the larger address space and available memory.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
