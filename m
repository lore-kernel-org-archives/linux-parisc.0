From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: Purge existing TLB entries in set_pte_at and
 ptep_set_wrprotect - take 2
Date: Tue, 15 Jan 2013 09:05:19 +0000
Message-ID: <1358240719.2752.6.camel@dabdike.int.hansenpartnership.com>
References: <BLU0-SMTP8691FD3EB8749D3303BA57972D0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP8691FD3EB8749D3303BA57972D0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2013-01-14 at 19:45 -0500, John David Anglin wrote:
> Attached is new version of patch which no longer saves and restores  
> %sr1.  Lightly tested with a GCC build
> and a build of Debian gtk+3.0 package.

I can merge it with your previous changelog, but for ease of git users,
the accepted format is

<patch description for git>

---

<Any other details you don't want in git>

git ignores everything after the three dashes on a single line.

So your preamble should be (I also added an explanation of why we think
the problem is occurring):

This patch goes a long way toward fixing the minifail bug, and
it  significantly improves the stability of SMP machines such as
the rp3440.  When write  protecting a page for COW, we need to
purge the existing translation.  Otherwise, the COW break
doesn't occur as expected because the TLB may still have a stale entry
which allows writes.

Signed-off-by: John David Anglin <dave.anglin@bell.net>

---

v2: Attached is new version of patch which no longer saves and
restores  %sr1.  Lightly tested with a GCC build and a build of
Debian gtk+3.0 package.

James




