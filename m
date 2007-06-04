From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Sun, 3 Jun 2007 21:10:07 -0400
Message-ID: <20070604011007.GA2075__13926.3891418979$1416624388$gmane$org@fattire.cabal.ca>
References: <20070603195133.GB23062@fattire.cabal.ca>
	<200706040102.l5412OUS022106@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: matthew@wil.cx,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200706040102.l5412OUS022106@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 03, 2007 at 09:02:24PM -0400, John David Anglin wrote:
> 
> I don't think so.  There's some wierd stuff in check_ivt.  It looks
> like the function is trying to see if it can compute a checksum for
> the os_hpmc function without causing a panic.  However, the function
> pointer stuff is all wrong.  Note that 32 and 64-bit function pointer
> handling is completely different.
> 

Er, then why didn't it complain before?

Can you do a quick test if I cook up a patch?
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
