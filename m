Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bjorn Helgaas <bjorn_helgaas@hp.com>
Cc: parisc list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110, kernel Panics, still more tears ;-( 
In-Reply-To: Message from Bjorn Helgaas <bjorn_helgaas@hp.com>
   of "Mon, 22 Jul 2002 08:24:13 MDT." <200207220824.13959.bjorn_helgaas@hp.com>
References: <3D383969.1657EF43@ruhr-west.de> <20020720152919.9D690483D@dsl2.external.hp.com>  <200207220824.13959.bjorn_helgaas@hp.com> 
Date: Mon, 22 Jul 2002 09:29:15 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020722152915.38977482A@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Bjorn Helgaas wrote:
> I have to ask the obvious question -- why not just always use
> the largest possible IOVA space, as IA64 does?  Is it a question
> of wasting space on IO PDIR entries?

HP ZX1 has something like 512MB or 1GB RAM for the minimum config.
IIRC, 32MB or 64MB was the minimum for C-class boxes and early K-class.
The difference between sizing and not sizing is normally
256KB to 1MB of memory that otherwise just wouldn't get used.

(I assume you meant to size the IOVA space based on physical memory
up to the max IOVA space supported by U2/Uturn.)

grant
