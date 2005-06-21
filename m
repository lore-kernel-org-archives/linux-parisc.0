From: Andreas Schwab <schwab@suse.de>
Subject: Re: [parisc-linux] Re: [RFC] Emit OPD reloc for all global symbols
	and then some.
Date: Tue, 21 Jun 2005 18:09:43 +0200
Message-ID: <jeekavhet4.fsf__27730.0827125602$1416623809$gmane$org@sykes.suse.de>
References: <200506211521.j5LFLwgJ011696@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: binutils@sources.redhat.com,
 Carlos O'Donell <carlos@systemhalted.org>,
 hjl@lucon.org,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200506211521.j5LFLwgJ011696@hiauly1.hia.nrc.ca> (John David
	Anglin's message of "Tue, 21 Jun 2005 11:21:58 -0400 (EDT)")
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

"John David Anglin" <dave@hiauly1.hia.nrc.ca> writes:

> Having the PLABEL32 relocation resolve to an OPD appears to require
> that the symbol be exported.  As a result, we have a different behaviors
> for dlsym on hppa and ia32.  What's ia64 do?

hppa needs to be fixed to implement correct variants of the macros in
dl-lookupcfg.h.  It probably just has to copy the definitions of
DL_FIXUP_* from sysdeps/ia64/dl-lookupcfg.h, and
_dl_runtime_{resolve,profile} has to be adapted accordingly.

Andreas.

-- 
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux Products GmbH, Maxfeldstraße 5, 90409 Nürnberg, Germany
Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
