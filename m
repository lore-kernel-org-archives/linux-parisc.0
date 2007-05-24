From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Fw: Hardware-List
Date: Thu, 24 May 2007 19:06:32 -0400 (EDT)
Message-ID: <200705242306.l4ON6Xas019531__39609.9949408837$1416624364$gmane$org@hiauly1.hia.nrc.ca>
References: <20070524234051.3b9bcbfd@Alucard.r3z0>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: T-Bone@parisc-linux.org (Thibaut VARENE)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070524234051.3b9bcbfd@Alucard.r3z0> from "Thibaut VARENE" at
	May 24, 2007 11:40:51 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I have successfully installed hppa etch on an HP c3750, in text mode 
> only on the graphics console (i.e. not the serial console). The HP 
> graphics card is not supported but I don't need graphics on this
> system. PA-RISC 875 mhz processor, 4G RAM.

For those that do want graphics, I had a problem migrating to
the xorg server.  Keyboard input didn't work because the server
was looking in the wrong place for XKeysymDB.

A fix is here:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=422430

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
