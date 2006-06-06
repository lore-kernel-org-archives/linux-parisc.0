From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Module Relocation Problem
Date: Mon, 5 Jun 2006 23:07:10 -0400 (EDT)
Message-ID: <200606060307.k5637AbL016980@hiauly1.hia.nrc.ca>
References: <200606051938.20617.kmh@sonic.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: kmh@sonic.net (Kai Holthaus)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606051938.20617.kmh@sonic.net> from "Kai Holthaus" at Jun 5,
	2006 07:38:19 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Anyway - I tried compiling the module with the "-mlong-calls" option - now =
> I=20
> get a different error message upon trying to insert the module into the=20
> kernel:
> 	module quickcam: Unknown relocation: 10

That's R_PARISC_PCREL21L.  I was afraid this might happen.

About the only easy things are "-Os" and "-fno-inline-functions".
These might shrink the module a bit.  Oh, "-fno-unroll-loops" might
also help.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
