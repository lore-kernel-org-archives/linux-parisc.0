From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: regtest: which fr to take care of?
Date: Sun, 3 Apr 2005 14:41:09 -0400 (EDT)
Message-ID: <200504031841.j33If9CF017871@hiauly1.hia.nrc.ca>
References: <42502F50.5070700@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42502F50.5070700@tiscali.be> from "Joel Soete" at Apr 3,
	2005 06:00:48 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Is those comments in our entry.S:
> ...
>          /* Floating point registers (FIXME: what do we do with these?)
> 
>             %fr0  - %fr3    status/exception, not preserved
>             %fr4  - %fr7    arguments
>             %fr8  - %fr11   not preserved by C code
>             %fr12 - %fr21   preserved by C code
>             %fr22 - %fr31   not preserved by C code
>           */
> ...
> 
> Are still uptodate?

Yes, these are from the HP-UX ABI.

> what 'preserved by C code' would mean?

The register remains unchanged across a call.  Call used registers
don't have to be preserved.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
