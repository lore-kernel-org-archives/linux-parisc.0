From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] what's in parisc-2.6.git
Date: Sat, 20 Oct 2007 12:44:32 -0400
Message-ID: <119aab440710200944q686fc502j61d84ec95a3da2ac__21280.0884539776$1416624447$gmane$org@mail.gmail.com>
References: <20071018194100.GA11936@fattire.cabal.ca>
	<200710200214.l9K2Ex5X001494@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200710200214.l9K2Ex5X001494@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 10/19/07, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> > Just temporarily. The workflow wasn't really working for me, and wasn't
> > motivating me to generate diffs. I'll be putting more -pa testkernels
> > up.
>
> Ok, I saw you made a lot of updates to parisc-2.6, so I cloned it
> this evening.  Noticed a small warning/bug from asm-parisc/rtc.h.
>
> The call to get_rtc_time in get_rtc_ss doesn't check the return
> value from get_rtc_time for RTC_BATT_BAD.  As a result, h may
> be used unininitialized.  I guess this only happens if the RTC
> battery is bad...

GCC head is really great at correctly noticing uninitialized uses of
variables. I'm tempted to compile the kernel with head just to fix
these. I just fixed 2 such cases in gdb.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
