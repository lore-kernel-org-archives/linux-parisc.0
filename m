From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PA8800/ZX1 support committed to 2.6.7-rc2-pa2
Date: Fri, 11 Jun 2004 09:27:13 -0600
Message-ID: <20040611152713.GC10279@colo.lackof.org>
References: <20040604202546.GC18574@colo.lackof.org>
	<20040605065126.GA28343@colo.lackof.org>
	<1086444652.1999.20.camel@mulgrave>
	<20040605210515.GA8098@colo.lackof.org>
	<1086470366.1999.36.camel@mulgrave>
	<20040611055819.GA32005@colo.lackof.org>
	<1086962549.1949.23.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1086962549.1949.23.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 11, 2004 at 10:02:29AM -0400, James Bottomley wrote:
> Could you just hard code it to 32 to make assureances certain that the
> stride value isn't the source of the segv's?

stride=16 doesn't work either.
sshd only page faults (so far) and sometimes "hangs" (^C to kill it).
Out of 9 attempts, I get one hang and 4 page faults.
"Connection closed" on all except the "hang".

Using console, I can
o apt-get update
o apt-get upgrade
o ssh -l grundler 192.168.1.1

So far, everything from the console works.
I'm not sure why sshd is having such a hard time.
I still don't think "stride" is the problem.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
