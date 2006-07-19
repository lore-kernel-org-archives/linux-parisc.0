From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Re: Looking at vfprintf.c and alloca.
Date: Wed, 19 Jul 2006 11:04:31 +0800
Message-ID: <44BDA13F.6040706@tausq.org>
References: <200607190248.k6J2mlLd015855@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200607190248.k6J2mlLd015855@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> What doesn't work?  ptr - old = 0x1c0 = 7 * 64.  The preferred
> stack boundary is 64 bytes.  6 * 64 = 384 bytes.  That's too
> small for the requested allocation.  &old[100] - old = 0x190 = 400.
> So, the results printed appear correct.

gcc is completely correct, I meant to agree with your other email, that
is glibc is totally bogus ;P

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
