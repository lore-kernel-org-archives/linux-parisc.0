From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [PATCH] Fix the atomic compare and swap
	function
Date: Sun, 20 May 2007 11:34:46 -0400 (EDT)
Message-ID: <200705201534.l4KFYknM023731__5265.95525811917$1416624364$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440705200822vcfe3dd2ud542783a4ac2c3c8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: libc-ports@sourceware.org,
 parisc-linux@lists.parisc-linux.org,
 aurelien@aurel32.net
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440705200822vcfe3dd2ud542783a4ac2c3c8@mail.gmail.com> from
	"Carlos O'Donell" at May 20, 2007 11:22:18 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > -#define ASM_EAGAIN "11"
> > +#define ASM_EAGAIN "-11"

If the check is wrong, I would change the compare instead of the
define.  Error numbers are normally defined as positive values.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
