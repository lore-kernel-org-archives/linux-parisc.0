Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id F337B4852
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 27 Feb 2004 15:50:23 -0700 (MST)
Date: Fri, 27 Feb 2004 17:49:26 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel 2.6.3 compile problem
Message-ID: <20040227224926.GA10923@baldric.uwo.ca>
References: <200402271110.50459.eggert.ehmke@berlin.de>
	<Pine.LNX.4.58.0402271018590.3556@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0402271018590.3556@sal.ucc.ie>
Cc: Randolph Chung <tausq@debian.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Feb 27, 2004 at 10:22:22AM +0000, M. Grabert wrote:
> > CONFIG_VGA_CONSOLE=y
> 
> I think this is the culprit. There is not VGA support on Linux/PA-RISC.

This is the culprit, and I stumble across it all the time. How do we go
about setting this to CONFIG_VGA_CONSOLE=n as the default? 

c.
