From: Jean-Pierre HOFER <jph@stephenson.dhis.org>
Subject: Re: [parisc-linux] Debian Etch RC1 on B180L / X display problem
Date: Sat, 25 Nov 2006 00:00:55 +0100 (CET)
Message-ID: <200611242300.kAON0vgf003083@stephenson.dhis.org>
References: <20061124125120.GA27596@miranda.arrow>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: Stuart Brady <sdbrady@ntlworld.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061124125120.GA27596@miranda.arrow>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Sorry, there are not 5 ROWs, but 5 identical COLUMNs.
> > 
> > Thanks in advance for all hints.
> 
> What happens if you put:
> 
>     Option "ShadowFB" "false"
> 
> in the Device section of xorg.conf?
> -- 
> Stuart Brady

Yes, it did the trick !  Many thanks for your hint.

This is a trap. It would be very useful to have a possibility to set/unset
this option in 'dpkg-reconfigure xserver-xorg'. For instance include this
choice in a menu after the mask about "Desired default color depth in bits",
together with some comments about needed setings for the supported HP graphic
cards.

Jean-Pierre
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
