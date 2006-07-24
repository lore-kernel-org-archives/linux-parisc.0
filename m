From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] klibc parisc64
Date: Mon, 24 Jul 2006 15:28:20 -0400
Message-ID: <20060724192820.GF15566@athena.road.mcmartin.ca>
References: <20060724182758.GC15566@athena.road.mcmartin.ca>
	<200607241901.k6OJ1aMN000440@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: klibc@zytor.com,
 parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200607241901.k6OJ1aMN000440@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jul 24, 2006 at 03:01:36PM -0400, John David Anglin wrote:
> > hppa64-linux-gnu-ld: usr/klibc/libc.so: Not enough room for program headers (allocated 5, need 6)
[...]
> > hppa64-linux-gnu-ld: final link failed: Bad value
> 
> This is a ld bug.  I see the same problem on hpux with '-static'.  We
> need another program header sometimes and I haven't figured out why.
>

So, klibc linked statically (libc.a) properly...

Interesting. So I fetched the cmdline used to build some of the static
test programs from klibc out of a 32-bit parisc build, and edited them
in the relevant ways to build for 64-bit. The outputted executable when
examined with "file" claimed to be "dynamically linked (uses shared libs)"
and would return "No such file or directory" when executed, implying that
it wasn't linked properly.

However, examination with readelf seemed to be alright.

I can provide the test built program (minips).

Cheers,
	Kyle M.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
