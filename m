Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 81298483E
	for <parisc-linux@parisc-linux.org>; Tue, 14 Oct 2003 10:59:55 -0600 (MDT)
Date: Tue, 14 Oct 2003 18:59:52 +0200
Message-ID: <3F8A272E0000157A@ocpmta3.freegates.net>
In-Reply-To: <20031003114959.GM24824@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] L2000/N4000 smp devices/boot compare??
To: "Matthew Wilcox" <willy@debian.org>
Cc: parisc-linux@parisc-linux.org,
	"Derek Engelhaupt" <derekengelhaupt@rocketmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Matthew,

Just comeback to you on this stuff to be sure I well understand :)

>> As I try, without any success :(, to find where 'rules for non-coherent
>aliases'
>> are not respected, I will waiting for a fix.
>
>Well, it's hard.  Consider a page in the page cache.  It has a kernel
>address and one-or-more user addresses.  The user addresses all follow the
>coherency rules but the kernel address doesn't.  If you look in Appendix
F,
>we're not allowed to have multiple write-capable translations to the same
>address.

If I well understand it means that a same real (absolute) address has a different
virtual addresse for each processor?

>I think the only way to solve this is by (ab)using kmap to ensure that
>kernel pages are only accessed via coherent mappings.

I find back an interesting info into <http://lists.parisc-linux.org/pipermail/parisc-linux/1999-December/008101.html>

where it is mentioned 'ping-pong the translations...'.
Do you think it could be a solution?
(btw Do you have any idea where i can find of the detail way to implement
it?)

thanks again,
    Joel

-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 
