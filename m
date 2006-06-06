From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Module Relocation Problem
Date: Mon, 5 Jun 2006 23:49:03 -0400 (EDT)
Message-ID: <200606060349.k563n4ST023145@hiauly1.hia.nrc.ca>
References: <200606052020.52908.kmh@sonic.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: kmh@sonic.net (Kai Holthaus)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606052020.52908.kmh@sonic.net> from "Kai Holthaus" at Jun 5,
	2006 08:20:52 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Looking over your earlier reply, you indicated that the module must be=20
> quite "large" - do you mean file size of the .ko file?
> Because that is way under the 8MB you mentioned - the file is around 200kB =
> in=20
> size...

I wonder if that implies a bug a bug in the kernel loader.  I could
see a problem with PCREL17F relocations with files around 200kB.
These are used with the PA 1.x "bl" instruction.  The range for
"bl" instructions is about +/- 262kB.  The range for the 22F "b,l"
instruction is 32 times larger.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
