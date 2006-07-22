From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Mysterious hangs with parisc (a
	send_group_sig_info() analysis)
Date: Sat, 22 Jul 2006 14:11:18 -0500
Message-ID: <200607221411.18605.mszick@morethan.org>
References: <20060624015935.GJ12481@quicksilver.road.mcmartin.ca>
	<44C1338C.7010607@tiscali.be>
	<119aab440607221023s30f966c0pbee4aa9357d9b7b5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 James.Bottomley@steeleye.com,
 John David Anglin <dave@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440607221023s30f966c0pbee4aa9357d9b7b5@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat July 22 2006 12:23, Carlos O'Donell wrote:
> > And here are a lot of questions:
> >         Q2: some diff in routine like 2 times ldcw with gcc-3 and only one with gcc-4 (may be ok?)
> >
> 
> Analyze the code. Is it doing functionally the same thing?
> 
> I assert that yes, it's doing exactly the same thing. The older gcc
> has unwrapped one of the ldcw's, and thus has two copies of the inner
> loop in the assembly. The code on the right does exactly the same
> thing, but in less instructions. GCC has gotten better.
> 
> There isn't a missing lock, we only needed one lock, the older gcc was
> doing a poorer job of code generation.
> 

OK - will go with that theory.

> There may be other parts of the kernel that have problems, so keep looking!
> 

Now that portion of the work is easy (not quick, easy) to reproduce.

Pick a fairly recent kernel (I think Joel has used both 2.6.16 & 2.6.17);
Use gcc-3.3 to build 64-bit-smp;
Use gcc-4.1 to build 64-bit-smp;

Pick a machine with two or more processors (Joel has PA8000 & PA8700);
Pick yourself a never-ending script that keeps all processors busy;

Run the gcc-4.1 built kernel; observe that machine locks up after some
time period ranging from hours to a few days;

Boot the gcc-3.3 built kernel; observe that machine runs for weeks.

Yes, there is something getting compiled differently than intended.

Q) Is the following an expected difference?

send_group_sig_info:                              send_group_sig_info:
    .PROC                                             .PROC
    .CALLINFO FRAME=144,CALLS,SAVE_RP,ENTRY_GR=6 |    .CALLINFO FRAME=160,CALLS,SAVE_RP,ENTRY_GR=7

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
