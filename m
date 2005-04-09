From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] More from the TLS glibc front.
Date: Sat, 9 Apr 2005 11:15:55 -0400 (EDT)
Message-ID: <200504091515.j39FFtij022153@hiauly1.hia.nrc.ca>
References: <4257AE83.6030308@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4257AE83.6030308@tiscali.be> from "Joel Soete" at Apr 9,
	2005 10:29:23 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> what's up with gcc-3.3.x?
> I never reach to complet the glibc build with gcc-3.4 (see detailed investigation in 
> <http://gcc.gnu.org/bugzilla/show_bug.cgi?id=17471>), gcc-3.5 at this time (now gcc-4) seems to solve this pb even thought there was 
> some other pb to fix with this new compiler ;-S (but not enough time to investigate, sorry)

I'm not aware of any GCC PRs related to this.  A few PA specific bug fixes
have been back ported to 3.3 and 3.4.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
