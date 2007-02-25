From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] fix SMP TLB optimisations
Date: Sun, 25 Feb 2007 08:47:32 -0600
Message-ID: <1172414852.3423.6.camel__48887.5642572113$1416624314$gmane$org@mulgrave.il.steeleye.com>
References: <200702250427.l1P4RjGA029686@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200702250427.l1P4RjGA029686@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2007-02-24 at 23:27 -0500, John David Anglin wrote:
> You have to watch out for "be,l" which mucks with sr0.

But practically, the kernel's not going to link to a new space, and the
user can't.

But the point isn't that we might change them ... it's that by
convention we always know what their values should be, so we didn't
really need to save them (except sr1 and sr2 from the kernel).  And
actually, that's a potential (but I suspect never seen) bug in that this
code doesn't set the space registers aggressively enough for a trap from
user context.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
