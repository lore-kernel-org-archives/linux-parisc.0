From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc instrument-function on parisc?
Date: Tue, 18 Apr 2006 12:20:21 -0400 (EDT)
Message-ID: <200604181620.k3IGKLls005439@hiauly1.hia.nrc.ca>
References: <IXXCB1$DA3AB156FC2925CAA26A8737245EC4CD@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IXXCB1$DA3AB156FC2925CAA26A8737245EC4CD@scarlet.be> from "Joel
	Soete" at Apr 18, 2006 04:28:13 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> OTOH I find this comment in gcc-4.0 info:
> `-finstrument-functions'
>      Generate instrumentation calls for entry and exit to functions.
>      Just after function entry and just before function exit, the
>      following profiling functions will be called with the address of
>      the current function and its call site.  (On some platforms,
>      `__builtin_return_address' does not work beyond the current
>      function, so the call site information may not be available to the
>      profiling functions otherwise.)
> 
> Is 'some platform' include parisc?

Yes, `__builtin_return_address' only provides the return address
for the current function on PA-RISC (on some targets, it can unwind
multiple levels).  There's some question in my mind as to whether it
handles all stubs correctly.  If it detects a stub, it tries to
provide the return address for the stub.  It's guaranteed not to
work in a signal handler.

The above hasn't really been tested as far as I know on parisc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
