Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA17458
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 May 1999 17:40:47 -0600
Date: Thu, 13 May 1999 18:40:43 -0500
From: Justin Maurer <justin@master.debian.org>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990513184043.A20996@master.debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] performance computing review of a180
List-ID: <linux-parisc.vger.kernel.org>

by popular request, here are some key bits from the review of the a180 in this
month's _unix's review's performance computing_:

(the machine as test was priced at $16,568. it had one cpu (lc), 1gb ram, two
4gb drives, and hp-ux 11.0)

(the article begins discussing racks and space issues, etc.)

"most recent non-intel servers have 64-bit cpus, but the core of the a-class
is hp's pa-7300, a 32-bit processor. this may seem a bit retro, but there is
little about internet services that actually benefits from 64-bit processor"

"one of the more interesting design deatures of the a-class is its integration
of hp's secure web console." (a lengthy discussion of the swc/rs-232/ethernet,
etc.)

"the only printed documentation that ships with the a-class is a small booklet
showing basic cable connections and outlining the customary safety and
regulatory statements. all other documentation is either part of the installed
hp-ux os (for example, online manual pages...additionally, the hp instant
information cd-rom, a collection of documentation is available as a $300
option. thus, to install the a-class, it is cubersome (though necessary) to
have another system on hand to various documentation web sites."

the article then talks about hp-ux and the bundled software. it is more a
feature list than an opinion/review bit, so i'll leave it out.

finally, the last thing before the closing comments is a bit on performance:
"...the 180-mhz a-class also produces spec scores lower than the 400mhz
pentium ii xeon processor, which is fairly common in intel-based servers.
interestingly, hp has chosen not to publish, at least at press time, benchmark
results for the a-class for the specweb96 benchmark, which would be an obvious
choice for a web-specific system design...." its spec scores are then compared
to several other 64-bit systems..

"...for example, the system memory is comparatively expensive, evidenced by
the price of the system we tested. thus, while the a-class hits the design
mark for high-density rackmount servers (20 in a two-meter rack), more-robust
configurations are pricey. as a result, design gets a two-flag rating on our
scale--average."

"...expansion is not a big issue...the version of bind should have been
upgraded to bind 8, and not including sendmail 8.9 we feel is a
mistake...performance is not a primary objective for hp with the a-class.."

in short, they give it "poor" on installation and documentation, "average" on
design, expandibility, performance, and *overall*, and "good" on operation.
they basically give it a few nice compliments, then rag on the same things and
more. more towards the negative side, overall.
-- 
-------------------------------------------------------------
# Justin Maurer                                GNOME Hacker #
# justin@debian.org                         Slashdot Author #
# http://slashdot.org/           Debian GNU/Linux Developer #
#     09 84 FC 03 13 AA 4A AF  F6 A4 85 9D 8C 96 B6 A4      #
-------------------------------------------------------------
