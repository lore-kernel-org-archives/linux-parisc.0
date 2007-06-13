From: seb@frankengul.org
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Wed, 13 Jun 2007 10:21:33 +0200
Message-ID: <20070613082133.GA19999__2196.99216909266$1416624391$gmane$org@frankengul.org>
References: <466F052F.6080009@frankengul.org> <200706122224.l5CMO7Lk011584@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: aurelien@aurel32.net,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200706122224.l5CMO7Lk011584@hiauly1.hia.nrc.ca>
Resent-Message-ID: <6cYt8C.A.k8H.1j6bGB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Tue, Jun 12, 2007 at 06:24:06PM -0400, John David Anglin wrote:
> > Here is the reduced diff. I removed anything that is unrelated to hppa,
> > C or anything.
> > The diff is between -7 and -12.
> > The diff is mere 300 lines long.
> > The problem lies here.
> 
> The odds are the problem lies in the change to varasm.c.

This patch is a part of PR20218.
4.1/4.2 PATCH: PR middle-end/20218: Can't use __attribute__ ((visibility ("hidden"))) to hide a symbol

I could remove this patch altogether. But I still wonder why this patch works
ok on other archs and not on hppa*.

	Seb


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
