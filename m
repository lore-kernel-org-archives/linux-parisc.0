From: Kyle McMartin <kyle@there.is.no.cabal.ca>
Subject: Re: [parisc-linux] new debian binutils-hppa64, r=2.15-7 pb?
Date: Thu, 23 Jun 2005 09:52:48 -0400
Message-ID: <20050623135248.GA19610__7990.90025616369$1416623814$gmane$org@roadwarrior.mcmartin.ca>
References: <20050623121019.GM14502@roadwarrior.mcmartin.ca>
	<200506231313.j5NDDgK1021282@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200506231313.j5NDDgK1021282@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jun 23, 2005 at 09:13:42AM -0400, John David Anglin wrote:
> I was hoping that these packages should be installable even if
> there aren't the default.
> 
> There seems to be a 3.5 package that probably should be removed.

Odd... If you have them both (3.4 and 4.0) installed, you should be able 
to run "update-alternatives --config hppa64-linux-gcc" to choose which
you'd like to be the default. I'm not sure off hand why 3.3 doesn't
show up this way, but I suspect it may have not used the alternatives
system.

Cheers,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
