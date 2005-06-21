From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [RFC] Emit OPD reloc for all global symbols
Date: Tue, 21 Jun 2005 16:26:46 -0400 (EDT)
Message-ID: <200506212026.j5LKQk6m013156__25255.5892606781$1416623809$gmane$org@hiauly1.hia.nrc.ca>
References: <jeekavhet4.fsf@sykes.suse.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: hjl@lucon.org,
 carlos@systemhalted.org,
 binutils@sources.redhat.com,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: schwab@suse.de (Andreas Schwab)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <jeekavhet4.fsf@sykes.suse.de> from "Andreas Schwab" at Jun 21,
	2005 06:09:43 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> "John David Anglin" <dave@hiauly1.hia.nrc.ca> writes:
> 
> > Having the PLABEL32 relocation resolve to an OPD appears to require
> > that the symbol be exported.  As a result, we have a different behaviors
> > for dlsym on hppa and ia32.  What's ia64 do?
> 
> hppa needs to be fixed to implement correct variants of the macros in
> dl-lookupcfg.h.  It probably just has to copy the definitions of
> DL_FIXUP_* from sysdeps/ia64/dl-lookupcfg.h, and
> _dl_runtime_{resolve,profile} has to be adapted accordingly.

There could be problems here but it seems that hppa is exporting
all global symbols in .dynsym.

Regarding the patch, I'm not sure why but it seems to result in
more R_PARISC_NONE dynamic relocation records (one for each real
dynamic relocation?).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
