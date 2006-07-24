From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] klibc parisc64
Date: Mon, 24 Jul 2006 15:50:40 -0400 (EDT)
Message-ID: <200607241950.k6OJoesc001091@hiauly1.hia.nrc.ca>
References: <20060724192820.GF15566@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: klibc@zytor.com,
 parisc-linux@lists.parisc-linux.org,
 kyle@parisc-linux.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060724192820.GF15566@athena.road.mcmartin.ca> from "Kyle
	McMartin" at Jul 24, 2006 03:28:20 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Interesting. So I fetched the cmdline used to build some of the static
> test programs from klibc out of a 32-bit parisc build, and edited them
> in the relevant ways to build for 64-bit. The outputted executable when
> examined with "file" claimed to be "dynamically linked (uses shared libs)"
> and would return "No such file or directory" when executed, implying that
> it wasn't linked properly.

Under hpux, non-dynamic executables aren't supported (i.e., we always
need an interpreter).  The dynamic loader defines some linker-defined
symbols that we don't have support for in the linker itself.  There may
be other reasons...

Thus, dynamically linked doesn't imply the presence of shared libraries.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
