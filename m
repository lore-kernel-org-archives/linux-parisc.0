From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Debugging 64-bit kernel crashes involving
Date: Sun, 11 Mar 2007 15:39:25 -0500
Message-ID: <1173645565.3420.22.camel__32981.641466222$1416624326$gmane$org@mulgrave.il.steeleye.com>
References: <200702240039.l1O0dCxG017471@hiauly1.hia.nrc.ca>
	<1172277920.3424.83.camel@mulgrave.il.steeleye.com>
	<119aab440702251819u1a070512j2cb8ca2eeadf0962@mail.gmail.com>
	<1172461983.3423.34.camel@mulgrave.il.steeleye.com>
	<1172467172.3423.39.camel@mulgrave.il.steeleye.com>
	<1172620930.3408.46.camel@mulgrave.il.steeleye.com>
	<20070308193119.GA3553@athena.road.mcmartin.ca>
	<119aab440703111328x5738d60es118519743e6000a3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440703111328x5738d60es118519743e6000a3@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2007-03-11 at 16:28 -0400, Carlos O'Donell wrote:
> Are we considering James' patch for inclusion into
> git.parisc-linux.org?

No ... it's failing on more complex tests.  The theory is sound ... we
have a huge cockup in our shared space handling code (which is why
threads don't work very well).  The problem is I'm not entirely sure how
to fix it.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
