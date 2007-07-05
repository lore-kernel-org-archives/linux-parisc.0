From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: [parisc-linux] Re: glibc testsuite failures,
	3 odd filesystem issues.
Date: Thu, 5 Jul 2007 08:31:07 -0700
Message-ID: <5b2e36650707050831h7e92ef95u8c5b075edd1baeba__29046.5257749476$1416624403$gmane$org@mail.gmail.com>
References: <119aab440705031832yf0dd7a4gff0e053e7b52febd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org,
 aurelien@aurel32.net
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440705031832yf0dd7a4gff0e053e7b52febd@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 03/05/07, Carlos O'Donell <carlos@systemhalted.org> wrote:
> On 5/3/07, Carlos O'Donell <carlos@systemhalted.org> wrote:

(details on tests snipped)

> Triage complete!

Heya Carlos!  FYI that glibc-2.6-0ubuntu2 (being uploaded soonish) now
matches your set of testsuite failures.  The changes from Debian are:
dropped LT support, built with gcc-4.2.  The tst-mqueue3 failure is
probably the next one I'll investigate, since it's a regression from
being built with gcc-4.1.

Thanks!

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
