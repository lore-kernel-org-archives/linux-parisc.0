From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: [RFC] Emit OPD reloc for all global symbols
	and then some.
Date: Wed, 22 Jun 2005 17:59:02 -0400
Message-ID: <20050622215901.GV5269__13914.56339411$1416623811$gmane$org@systemhalted.org>
References: <200506211521.j5LFLwgJ011696@hiauly1.hia.nrc.ca>
	<jeekavhet4.fsf@sykes.suse.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 hjl@lucon.org,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org,
 binutils@sources.redhat.com
To: Andreas Schwab <schwab@suse.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <jeekavhet4.fsf@sykes.suse.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jun 21, 2005 at 06:09:43PM +0200, Andreas Schwab wrote:
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

We have the correct variants implemented.

http://cvs.parisc-linux.org/glibc/sysdeps/hppa/dl-lookupcfg.h?rev=1.3&view=markup

Upstream glibc is not a good indicator of the status of our port.
I am trying to merge as much as I can upstream.

c.


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
