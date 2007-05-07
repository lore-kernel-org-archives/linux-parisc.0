From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] unaligned access using bash on glibc 2.5
Date: Sun, 6 May 2007 22:55:29 -0400 (EDT)
Message-ID: <200705070255.l472tU1r028044__22682.3092707948$1416624355$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440705061908x4f8501d4gb4901285210480c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: aurelien@aurel32.net,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440705061908x4f8501d4gb4901285210480c@mail.gmail.com> from
	"Carlos O'Donell" at May 6, 2007 10:08:06 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Interesting. Why isn't it this patch needed on any other arch? :-)

Don't know but there's one additional factor.  config/linux.h defines
USE_LD_AS_NEEDED if HAVE_LD_AS_NEEDED is defined.  This will add
"--as-needed -lgcc_s" for eh support.  I just checked in and
HAVE_LD_AS_NEEDED is defined in my builds, but if binutils is old
it might not be defined.  However, I would have to dig into to gcc.c
to see what happens when -nostdlibs is defined.  My first thought
is that it shouldn't add "--as-needed -lgcc_s" when -nostdlibs is
present.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
