From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Sun, 11 Jun 2006 20:34:33 -0400
Message-ID: <119aab440606111734j3226f013l78e4c2fa22c08709@mail.gmail.com>
References: <119aab440606111620w40d1808en7adec56144d4b1aa@mail.gmail.com>
	<200606112357.k5BNvgoL020309@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606112357.k5BNvgoL020309@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 6/11/06, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> (gdb) p *spinlock
> $10 = {lock = {0, 0, 0, 0}} <== we would see some ones if initialized
> So, I believe the value for spinlock in the backtrace.  Thus, this is
> probably a libgfortran issue.

That is good news! It's an unfortuante side-effect of our lock code.
Which goes away in NPTL ... thankfully.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
