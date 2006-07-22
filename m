From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Mysterious hangs with parisc (a
	send_group_sig_info() analysis)
Date: Sat, 22 Jul 2006 13:23:57 -0400
Message-ID: <119aab440607221023s30f966c0pbee4aa9357d9b7b5@mail.gmail.com>
References: <20060624015935.GJ12481@quicksilver.road.mcmartin.ca>
	<200606240241.k5O2fALQ001885@hiauly1.hia.nrc.ca>
	<20060705164734.GB30640@athena.road.mcmartin.ca>
	<44AD54F0.90508@tiscali.be>
	<20060706183409.GB5692@athena.road.mcmartin.ca>
	<44C1338C.7010607@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 James.Bottomley@steeleye.com,
 parisc-linux@lists.parisc-linux.org,
 John David Anglin <dave@hiauly1.hia.nrc.ca>
To: "Joel Soete" <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44C1338C.7010607@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> And here are a lot of questions:
>         Q2: some diff in routine like 2 times ldcw with gcc-3 and only one with gcc-4 (may be ok?)
>

Analyze the code. Is it doing functionally the same thing?

I assert that yes, it's doing exactly the same thing. The older gcc
has unwrapped one of the ldcw's, and thus has two copies of the inner
loop in the assembly. The code on the right does exactly the same
thing, but in less instructions. GCC has gotten better.

There isn't a missing lock, we only needed one lock, the older gcc was
doing a poorer job of code generation.

There may be other parts of the kernel that have problems, so keep looking!

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
