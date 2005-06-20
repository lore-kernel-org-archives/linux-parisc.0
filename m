From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: [RFC] Emit OPD reloc for all global symbols and
	then some.
Date: Mon, 20 Jun 2005 16:26:25 -0400 (EDT)
Message-ID: <200506202026.j5KKQPb7007471__26515.3234162883$1416623806$gmane$org@hiauly1.hia.nrc.ca>
References: <20050620191501.GA31614@lucon.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: carlos@systemhalted.org,
 binutils@sources.redhat.com,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: hjl@lucon.org (H. J. Lu)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050620191501.GA31614@lucon.org> from "H. J. Lu" at Jun 20,
	2005 12:15:01 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Under hppa-linux:
> > ------------------
> > We want to generate a PLABEL32 (OPD reloc) against all global symbols,
> > and then some. For example it should be possible for an application to
> > call dlsym asking for the address of main, and when compared to main it
> > should match.
> > 
> 
> Does it work on Linux/ia32? If not, why should it work on Linux/hppa?

The linux manpage for dlsym indicates that symbols in the main
program can be looked up with dlsym:

     If filename is a NULL pointer, then the returned handle is
     for the main program.  When given to dlsym(), this  handle
     causes a search for a symbol in the main program, followed
     by all shared libraries loaded  at  program  startup,  and
     then all shared libraries loaded by dlopen() with the flag
     RTLD_GLOBAL.

So, if it doesn't work, that would seem to be a bug in Linux/ia32.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
