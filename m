Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Arjen Hommersom <arjenh@chello.nl>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: PA-RISC 0.9.3+C200+Visualize-EG+2.4.18-pa05 = working X! 
In-Reply-To: Message from Arjen Hommersom <arjenh@chello.nl>
   of "Thu, 21 Mar 2002 00:10:28 +0100." <Pine.LNX.4.21.0203210007210.25956-100000@gatekeeper>
References: <Pine.LNX.4.21.0203210007210.25956-100000@gatekeeper> 
Date: Thu, 21 Mar 2002 00:12:21 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020321071221.A89204845@dsl2.external.hp.com>
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

Arjen Hommersom wrote:
> It doesnt crash my C240 either, but unfortunately no fb is working. I
> guess this doesn't work for the FX2 graphics cards..

correct. FX/* cards support 24-bit color and have a different Frame buffer
layout that tsbogend/deller/esiee/et al don't know how to make work exactly.

I'm really happy the Vis-EG works (using it now)...but I've got a
Vis-FX/E waiting to be plugged in...

thanks,
grant
